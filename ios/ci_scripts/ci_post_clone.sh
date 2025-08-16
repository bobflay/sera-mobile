#!/bin/sh

set -e

echo "🚀 Starting Flutter setup for Xcode Cloud..."

# Install Flutter
FLUTTER_PATH="$HOME/flutter"
export PATH="$PATH:$FLUTTER_PATH/bin"

if [ ! -d "$FLUTTER_PATH" ]; then
    echo "📦 Installing Flutter SDK..."
    git clone https://github.com/flutter/flutter.git --depth 1 -b stable $FLUTTER_PATH
else
    echo "✅ Flutter already cached, updating..."
    cd $FLUTTER_PATH
    git pull origin stable
fi

# Configure Flutter for CI
flutter config --no-analytics
export PUB_CACHE="$HOME/.pub-cache"
export FLUTTER_SUPPRESS_ANALYTICS=true

# Verify Flutter installation
echo "✅ Verifying Flutter installation..."
flutter --version

# Download iOS artifacts
echo "📱 Downloading iOS artifacts..."
flutter precache --ios

# Navigate to project directory
cd $CI_PRIMARY_REPOSITORY_PATH

# Get Flutter dependencies
echo "📚 Getting Flutter dependencies..."
flutter pub get

# Generate iOS platform files
echo "🔧 Generating iOS platform files..."
flutter build ios --config-only

# Install CocoaPods dependencies if Podfile exists
echo "🎯 Installing CocoaPods dependencies..."
cd ios
if [ -f "Podfile" ]; then
    pod install --repo-update
else
    echo "No Podfile found, skipping pod install"
fi

echo "✨ Flutter setup completed successfully!"