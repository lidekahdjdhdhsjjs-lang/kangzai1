#!/bin/bash
# Repository Clone Script
# Supports various clone methods and options

set -e

REPO_URL=${1:-""}
DEST_DIR=${2:-"."}
DEPTH=${3:-""}

echo "📦 Repository Clone"
echo "===================="

if [ -z "$REPO_URL" ]; then
    echo "❌ Error: Repository URL is required"
    echo "Usage: $0 <repository-url> [destination-dir] [depth]"
    echo ""
    echo "Examples:"
    echo "  $0 https://github.com/user/repo.git"
    echo "  $0 https://github.com/user/repo.git ./my-repo 1"
    echo "  $0 user/repo"
    exit 1
fi

# Detect clone method
if command -v gh &> /dev/null; then
    echo "🔄 Using GitHub CLI (gh)..."
    if [ -n "$DEPTH" ]; then
        gh repo clone "$REPO_URL" "$DEST_DIR" -- --depth="$DEPTH"
    else
        gh repo clone "$REPO_URL" "$DEST_DIR"
    fi
else
    echo "🔄 Using Git..."
    if [ -n "$DEPTH" ]; then
        git clone --depth "$DEPTH" "$REPO_URL" "$DEST_DIR"
    else
        git clone "$REPO_URL" "$DEST_DIR"
    fi
fi

echo ""
echo "✅ Repository cloned successfully!"
echo "📁 Location: $(pwd)/$DEST_DIR"
