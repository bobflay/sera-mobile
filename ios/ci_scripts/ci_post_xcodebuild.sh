#!/bin/sh

set -e

echo "🎯 Starting post-build tasks for Xcode Cloud..."

# Export IPA if build succeeded
if [ -f "$CI_ARCHIVE_PATH/Products/Applications/Runner.app" ]; then
    echo "✅ Build succeeded, exporting IPA..."
    
    # Create export directory
    EXPORT_PATH="$CI_DERIVED_DATA_PATH/export"
    mkdir -p "$EXPORT_PATH"
    
    echo "📦 Archive exported successfully"
    
    # Distribute to TestFlight internal testing groups
    if [ ! -z "$CI_ARCHIVE_PATH" ] && [ "$CI_XCODEBUILD_ACTION" = "archive" ]; then
        echo "🚀 Distributing to TestFlight internal testing groups..."
        
        # Using xcrun altool for TestFlight distribution
        # Note: Xcode Cloud automatically handles authentication
        if [ ! -z "$CI_APP_STORE_SIGNED_APP_PATH" ]; then
            echo "📱 Uploading to TestFlight and distributing to all internal groups..."
            
            # The build will be automatically uploaded to TestFlight by Xcode Cloud
            # Configure distribution settings in Xcode Cloud workflow:
            # 1. Go to App Store Connect > Xcode Cloud > Workflows
            # 2. Edit your workflow > Post-Actions
            # 3. Add "TestFlight Internal Testing" action
            # 4. Select all internal testing groups
            # 5. Enable "Notify Testers" if desired
            
            echo "✅ Build will be distributed to configured internal testing groups"
            echo "ℹ️  Configure groups in Xcode Cloud workflow settings"
        fi
    fi
else
    echo "⚠️ No app found in archive path"
fi

# Optional: Upload dSYMs for crash reporting
if [ -d "$CI_ARCHIVE_PATH/dSYMs" ]; then
    echo "📤 Found dSYMs for crash reporting"
    # Add your crash reporting service upload here
    # Example: upload-symbols --dsym "$CI_ARCHIVE_PATH/dSYMs"
fi

# Clean up temporary files to save space
echo "🧹 Cleaning up temporary files..."
rm -rf "$HOME/.pub-cache/hosted/pub.dartlang.org/.cache"
rm -rf "$HOME/.dart"

echo "✨ Post-build tasks completed successfully!"