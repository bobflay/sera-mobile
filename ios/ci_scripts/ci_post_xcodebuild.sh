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