#!/bin/bash
# Web Scraping Script
# Scrapes page content and saves to file

set -e

URL=${1:-""}
OUTPUT=${2:-"scraped_content.txt}
SELECTOR=${3:-"body"}

echo "🕷️  Web Scraping"
echo "================"

if [ -z "$URL" ]; then
    echo "❌ Error: URL is required"
    echo "Usage: $0 <url> [output-file] [selector]"
    echo ""
    echo "Examples:"
    echo "  $0 https://example.com"
    echo "  $0 https://example.com output.txt"
    echo "  $0 https://example.com output.txt \"#main-content\""
    exit 1
fi

echo "🌐 URL: $URL"
echo "📄 Output: $OUTPUT"
echo "🎯 Selector: $SELECTOR"
echo ""

# Navigate to URL
echo "🔄 Navigating..."
openclaw browser navigate "$URL"

# Wait for page load
sleep 2

# Get page title
TITLE=$(openclaw browser evaluate "document.title")
echo "📑 Title: $TITLE"

# Extract content
echo "🔍 Extracting content..."
CONTENT=$(openclaw browser evaluate "document.querySelector('$SELECTOR')?.textContent")

# Save to file
echo "$CONTENT" > "$OUTPUT"

echo ""
echo "✅ Content saved to: $OUTPUT"
echo "📊 Size: $(wc -c < "$OUTPUT") bytes"
