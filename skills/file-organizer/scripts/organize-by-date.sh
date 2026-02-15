#!/bin/bash
# File Organizer by Date
# Organizes files by modification or creation date

set -e

SOURCE_DIR=${1:-"."}
PATTERN=${2:-"%Y-%m-%d"}  # Default: YYYY-MM-DD
GROUP_BY=${3:-"month"}     # Options: day, month, year

echo "📅 File Date Organizer"
echo "======================"
echo "Source: $SOURCE_DIR"
echo "Pattern: $PATTERN"
echo "Group by: $GROUP_BY"
echo ""

# Function to get date in specified format
get_date() {
  local file="$1"
  if [ "$GROUP_BY" = "day" ]; then
    date -r "$file" +"$PATTERN" 2>/dev/null || stat -f "%Sm" -t "$PATTERN" "$file" 2>/dev/null
  elif [ "$GROUP_BY" = "month" ]; then
    date -r "$file" +"$PATTERN" 2>/dev/null || stat -f "%Sm" -t "$PATTERN" "$file" 2>/dev/null
  else
    date -r "$file" +"$PATTERN" 2>/dev/null || stat -f "%Sm" -t "$PATTERN" "$file" 2>/dev/null
  fi
}

# Create dated folders and move files
organize_by_date() {
  local count=0
  local total=0
  
  for file in *.*; do
    [ -f "$file" ] || continue
    total=$((total + 1))
    
    date_folder=$(get_date "$file")
    
    if [ -n "$date_folder" ] && [ "$date_folder" != "" ]; then
      mkdir -p "$date_folder"
      mv "$file" "$date_folder/"
      echo "  $file → $date_folder/"
      count=$((count + 1))
    fi
  done
  
  echo ""
  echo "📊 Summary:"
  echo "  Organized: $count files"
  echo "  Folders created: $(find . -maxdepth 1 -type d -name "????-??-??" -o -name "????-??" | wc -l)"
}

# Main execution
cd "$SOURCE_DIR"
organize_by_date

echo ""
echo "✅ Date organization complete!"
