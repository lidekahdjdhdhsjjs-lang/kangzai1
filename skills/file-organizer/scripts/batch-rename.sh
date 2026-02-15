#!/bin/bash
# Batch Rename Tool
# Supports various renaming patterns

set -e

PATTERN=${1:-""}
REPLACEMENT=${2:-""}
FILES=${3:-"*.*"}
DRY_RUN=${4:-"false"}

echo "🏷️ Batch Rename Tool"
echo "===================="
echo "Pattern: $PATTERN"
echo "Replacement: $REPLACEMENT"
echo "Files: $FILES"
echo "Dry run: $DRY_RUN"
echo ""

# Show help if no pattern
if [ -z "$PATTERN" ] || [ "$PATTERN" = "--help" ] || [ "$PATTERN" = "-h" ]; then
  echo "Usage: $0 <pattern> <replacement> [files] [--dry-run]"
  echo ""
  echo "Patterns:"
  echo "  s/old/new/     Replace 'old' with 'new'"
  echo "  IMG_%Y%m%d     Add date prefix"
  echo "  %Y%m%d_file    Add date prefix"
  echo "  *_backup       Add suffix"
  echo ""
  echo "Examples:"
  echo "  $0 'IMG_' '' *.jpg"
  echo "  $0 '' '%Y%m%d_' *.md"
  echo "  $0 '_old' '_new' *"
  echo "  $0 's/ /_/' '* *'"
  exit 0
fi

# Count files to rename
file_count=$(ls $FILES 2>/dev/null | wc -l)

if [ $file_count -eq 0 ]; then
  echo "⚠️  No files found matching: $FILES"
  exit 0
fi

echo "🔄 Will rename $file_count files..."
echo ""

# Rename files
renamed=0
failed=0

for file in $FILES; do
  [ -f "$file" ] || continue
  
  new_name=""
  
  # Apply pattern
  if [[ "$PATTERN" == s/* ]]; then
    # Substitution pattern: s/old/new/
    old=$(echo "$PATTERN" | sed 's/s\/\([^/]*\)\/.*/\1/')
    new=$(echo "$PATTERN" | sed 's/.*\/\([^/]*\)\/.*/\1/')
    new_name=$(echo "$file" | sed "$PATTERN")
  elif [[ "$PATTERN" == *%Y%m%d* ]]; then
    # Date prefix
    date_prefix=$(date +%Y%m%d)
    new_name="${date_prefix}_${file}"
  elif [[ "$PATTERN" == *%Y-%m-%d* ]]; then
    # Date with dashes
    date_prefix=$(date +%Y-%m-%d)
    new_name="${date_prefix}_${file}"
  else
    # Simple prepend/append
    if [ -n "$REPLACEMENT" ]; then
      new_name="${PATTERN}${file}${REPLACEMENT}"
    else
      new_name="${PATTERN}${file}"
    fi
  fi
  
  # Rename if different
  if [ "$new_name" != "$file" ]; then
    if [ "$DRY_RUN" = "--dry-run" ] || [ "$DRY_RUN" = "-n" ]; then
      echo "[DRY-RUN] $file → $new_name"
    else
      if mv "$file" "$new_name" 2>/dev/null; then
        echo "  $file → $new_name"
        renamed=$((renamed + 1))
      else
        echo "  ❌ Failed: $file"
        failed=$((failed + 1))
      fi
    fi
  fi
done

echo ""
echo "📊 Summary:"
echo "  Renamed: $renamed files"
echo "  Failed: $failed files"

echo ""
echo "✅ Batch rename complete!"
