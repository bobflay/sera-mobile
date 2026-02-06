#!/bin/sh

set -e

echo "🎯 Starting TestFlight distribution with Fastlane..."

# Install Fastlane if not already installed
if ! command -v fastlane &> /dev/null; then
    echo "📦 Installing Fastlane..."
    gem install fastlane
fi

# Navigate to iOS directory
cd "$CI_PRIMARY_REPOSITORY_PATH/ios"

# Set environment variables for Fastlane
export FASTLANE_USER="$APPLE_ID"
export FASTLANE_PASSWORD="$APPLE_APP_SPECIFIC_PASSWORD"
export FASTLANE_APPLE_APPLICATION_SPECIFIC_PASSWORD="$APPLE_APP_SPECIFIC_PASSWORD"
export FASTLANE_SESSION="$FASTLANE_SESSION"
export PILOT_SKIP_WAITING_FOR_BUILD_PROCESSING=true

# Run Fastlane to distribute to TestFlight
echo "🚀 Uploading to TestFlight and distributing to all internal groups..."
fastlane beta

echo "✨ TestFlight distribution completed successfully!"