#!/bin/bash
# Pull Request Creation Script
# Creates a PR with title, body, and base branch

set -e

TITLE=${1:-""}
BODY=${2:-""}
BASE=${3:-"main"}
HEAD=${4:-""}

echo "🔀 Pull Request Creation"
echo "========================"

if [ -z "$TITLE" ]; then
    echo "❌ Error: PR title is required"
    echo "Usage: $0 <title> [body] [base-branch] [head-branch]"
    echo ""
    echo "Examples:"
    echo "  $0 \"Fix bug in login\" \"Fixed login issue\" main feature/login-fix"
    exit 1
fi

# Get current branch if head not specified
if [ -z "$HEAD" ]; then
    HEAD=$(git rev-parse --abbrev-ref HEAD)
    echo "📌 Using current branch: $HEAD"
fi

echo "📝 Title: $TITLE"
echo "📄 Base: $BASE ← $HEAD"

if command -v gh &> /dev/null; then
    echo "🔄 Creating PR using GitHub CLI..."
    
    if [ -n "$BODY" ]; then
        gh pr create --title "$TITLE" --body "$BODY" --base "$BASE" --head "$HEAD"
    else
        gh pr create --title "$TITLE" --base "$BASE" --head "$HEAD"
    fi
    
    echo ""
    echo "✅ Pull request created successfully!"
    gh pr view --web
else
    echo "⚠️  GitHub CLI not found. Creating commit locally..."
    
    # Stage and commit changes
    git add .
    git commit -m "$TITLE"
    
    if [ -n "$BODY" ]; then
        echo ""
        echo "📝 Commit body:"
        echo "$BODY"
    fi
    
    echo ""
    echo "✅ Changes committed (push to create PR on GitHub)"
    echo "🔗 Run: git push -u origin $HEAD"
fi
