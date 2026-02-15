#!/bin/bash
# Memory Summarizer CLI
# Automatically summarizes daily conversations and extracts key insights

set -e

COMMAND=${1:-"help"}
DAYS=${2:-"1"}

echo "🦞 Memory Summarizer"
echo "===================="
echo "Command: $COMMAND"
echo "Days: $DAYS"
echo ""

case $COMMAND in
    help|--help|-h)
        echo "Usage: $0 <command> [options]"
        echo ""
        echo "Commands:"
        echo "  today          Summarize today's conversations"
        echo "  decisions      Extract all decisions"
        echo "  report [days]  Generate weekly report"
        echo "  stats          Show statistics"
        echo "  help           Show this help"
        echo ""
        echo "Examples:"
        echo "  $0 today"
        echo "  $0 decisions"
        echo "  $0 report 7"
        echo "  $0 stats"
        ;;
        
    today)
        echo "📝 Today's Summary"
        echo "================="
        
        # Check if today's memory file exists
        TODAY_FILE="memory/$(date +%Y-%m-%d).md"
        
        if [ -f "$TODAY_FILE" ]; then
            echo "✅ Found today's memory file"
            echo ""
            echo "📊 Quick Stats:"
            wc -l "$TODAY_FILE"
            echo ""
            echo "🔑 Key Points:"
            grep "^### " "$TODAY_FILE" | head -5
        else
            echo "⚠️  No memory file found for today"
            echo "💡 Tip: Start capturing conversations!"
        fi
        ;;
        
    decisions)
        echo "🎯 Decision Extraction"
        echo "====================="
        
        # Search for decision patterns
        echo "Searching for decisions in memory files..."
        grep -r "Decision" memory/*.md 2>/dev/null || echo "No decisions found"
        ;;
        
    report)
        echo "📊 Weekly Report"
        echo "==============="
        echo "Generating report for last $DAYS days..."
        
        # Count files
        COUNT=$(find memory/ -name "*.md" -mtime -$DAYS | wc -l)
        echo "📁 Memory files: $COUNT"
        
        # Line count
        TOTAL_LINES=$(find memory/ -name "*.md" -mtime -$DAYS -exec wc -l {} + | tail -1)
        echo "📝 Total lines: $TOTAL_LINES"
        ;;
        
    stats)
        echo "📈 Statistics"
        echo "============"
        
        # Total files
        TOTAL=$(find memory/ -name "*.md" 2>/dev/null | wc -l)
        echo "📁 Total memory files: $TOTAL"
        
        # Total lines
        LINES=$(find memory/ -name "*.md" -exec wc -l {} + 2>/dev/null | tail -1)
        echo "📝 Total lines: $LINES"
        
        # Latest file
        LATEST=$(ls -t memory/*.md 2>/dev/null | head -1)
        if [ -n "$LATEST" ]; then
            echo "🆕 Latest: $LATEST"
        fi
        ;;
        
    *)
        echo "❌ Unknown command: $COMMAND"
        echo "Run '$0 help' for usage"
        exit 1
        ;;
esac

echo ""
echo "✅ Done!"
