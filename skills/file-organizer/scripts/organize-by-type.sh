#!/bin/bash
# File Type Organizer Script
# Organizes files by extension into type-based folders

set -e

SOURCE_DIR=${1:-"."}
DRY_RUN=${2:-"false"}

echo "📁 File Type Organizer"
echo "======================"
echo "Source: $SOURCE_DIR"
echo "Dry run: $DRY_RUN"
echo ""

# Define type categories
declare -A TYPE_MAP=(
  ["jpg,jpeg,png,gif,bmp,svg"]="images"
  ["pdf,doc,docx,txt,md,rst"]="documents"
  ["mp3,wav,flac,m4a"]="audio"
  ["mp4,mkv,avi,mov"]="videos"
  ["zip,7z,tar,gz,bz2"]="archives"
  ["py,js,ts,java,cpp,cs"]="code"
  ["json,yaml,yml,toml,ini,cfg"]="config"
)

# Create category folders
create_folders() {
  for types in "${!TYPE_MAP[@]}"; do
    folder="${TYPE_MAP[$types]}"
    if [ "$SOURCE_DIR" = "." ]; then
      mkdir -p "$folder"
    else
      mkdir -p "$SOURCE_DIR/$folder"
    fi
  done
}

# Move files by type
organize_files() {
  for types in "${!TYPE_MAP[@]}"; do
    folder="${TYPE_MAP[$types]}"
    
    IFS=',' read -ra EXTENSIONS <<< "$types"
    for ext in "${EXTENSIONS[@]}"; do
      shopt -s nullglob
      files=( *."$ext" )
      shopt -u nullglob
      
      for file in "${files[@]}"; do
        if [ -f "$file" ]; then
          if [ "$DRY_RUN" = "--dry-run" ] || [ "$DRY_RUN" = "-n" ]; then
            echo "[DRY-RUN] Would move: $file → $folder/"
          else
            mv "$file" "$folder/"
            echo "  $file → $folder/"
          fi
        fi
      done
    done
  done
}

# Count files by type
count_files() {
  echo ""
  echo "📊 File counts by type:"
  for types in "${!TYPE_MAP[@]}"; do
    folder="${TYPE_MAP[$types]}"
    count=0
    
    IFS=',' read -ra EXTENSIONS <<< "$types"
    for ext in "${EXTENSIONS[@]}"; do
      shopt -s nullglob
      count=$((count + $(ls -1 *."$ext" 2>/dev/null | wc -l)))
      shopt -u nullglob
    done
    
    if [ $count -gt 0 ]; then
      echo "  $folder: $count files"
    fi
  done
}

# Main execution
create_folders
echo "🔄 Organizing files..."
organize_files
count_files

echo ""
echo "✅ Organization complete!"
