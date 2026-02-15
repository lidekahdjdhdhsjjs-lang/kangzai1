#!/bin/bash
# Agent Browser Start Script
# Launches browser with specified profile

set -e

PROFILE=${1:-"openclaw"}
HEADLESS=${2:-"false"}

echo "🌐 Agent Browser"
echo "================"
echo "Profile: $PROFILE"
echo "Headless: $HEADLESS"
echo ""

# Validate profile
if [ "$PROFILE" != "openclaw" ] && [ "$PROFILE" != "chrome" ]; then
    echo "❌ Error: Invalid profile '$PROFILE'"
    echo "Valid profiles: openclaw, chrome"
    exit 1
fi

# Check profile argument for headless
if [ "$HEADLESS" = "--headless" ] || [ "$HEADLESS" = "-h" ]; then
    HEADLESS="true"
fi

echo "🔄 Starting browser..."

# Start browser based on profile
case $PROFILE in
    openclaw)
        echo "📦 Using OpenClaw isolated browser"
        openclaw browser start --profile=openclaw
        ;;
    chrome)
        echo "🌐 Using existing Chrome with extension relay"
        echo "⚠️  Make sure Chrome extension is installed and connected"
        openclaw browser start --profile=chrome
        ;;
esac

echo ""
echo "✅ Browser started successfully!"
echo ""
echo "Usage examples:"
echo "  # Navigate to URL"
echo "  openclaw browser navigate \"https://example.com\""
echo ""
echo "  # Take screenshot"
echo "  openclaw browser screenshot"
echo ""
echo "  # Fill form"
echo "  openclaw browser fill \"#email\" \"user@example.com\""
