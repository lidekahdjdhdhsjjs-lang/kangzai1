#!/bin/bash
# Form Automation Script
# Fills and submits forms automatically

set -e

URL=${1:-""}
FORM_FILE=${2:-""}

echo "📝 Form Automation"
echo "=================="

if [ -z "$URL" ]; then
    echo "❌ Error: URL is required"
    echo "Usage: $0 <url> [form-file.json]"
    echo ""
    echo "Form file format:"
    echo '  {'
    echo '    "fields": ['
    echo '      {"selector": "#email", "value": "user@example.com"},'
    echo '      {"selector": "#password", "value": "secret123"}'
    echo '    ],'
    echo '    "submit": "#submit-btn"'
    echo '  }'
    exit 1
fi

echo "🌐 URL: $URL"
echo "📄 Form file: ${FORM_FILE:-"inline"}"
echo ""

# Navigate to page
echo "🔄 Opening page..."
openclaw browser navigate "$URL"

# Wait for form to load
sleep 2

# Check if form file provided
if [ -n "$FORM_FILE" ] && [ -f "$FORM_FILE" ]; then
    echo "📖 Reading form data from file..."
    # Parse JSON and fill fields
    # This is a simplified version - actual implementation would parse JSON
    echo "⚠️  JSON parsing not implemented in this version"
    echo "Using manual fill commands instead"
fi

echo ""
echo "✅ Ready to fill form manually"
echo ""
echo "Commands:"
echo "  openclaw browser fill \"<selector>\" \"<value>\""
echo "  openclaw browser click \"<submit-selector>\""
