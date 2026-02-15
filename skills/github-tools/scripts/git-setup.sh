#!/bin/bash
# GitHub Tools Setup Script
# Configures Git proxy and GitHub CLI for mainland China users

set -e

echo "🔧 GitHub Tools Setup"
echo "====================="

# Check proxy configuration
PROXY_PORT=${1:-7899}

echo "📡 Configuring Git proxy to port $PROXY_PORT..."

# Configure global proxy
git config --global http.proxy "http://127.0.0.1:$PROXY_PORT"
git config --global https.proxy "http://127.0.0.1:$PROXY_PORT"

# Configure GitHub-specific proxy
git config --global http.https://github.com.proxy "http://127.0.0.1:$PROXY_PORT"
git config --global https.https://github.com.proxy "http://127.0.0.1:$PROXY_PORT"

echo "✅ Git proxy configured successfully"

# Verify configuration
echo ""
echo "Current Git proxy settings:"
echo "  http.proxy: $(git config --global --get http.proxy)"
echo "  https.proxy: $(git config --global --get https.proxy)"

# Check GitHub CLI
if command -v gh &> /dev/null; then
    echo ""
    echo "✅ GitHub CLI is installed"
    gh --version
else
    echo ""
    echo "⚠️  GitHub CLI not found. Install with:"
    echo "   - macOS: brew install gh"
    echo "   - Linux: curl -fsSL https://cli.github.com/packages/scripts/install.sh | bash"
fi

echo ""
echo "🎉 Setup complete!"
