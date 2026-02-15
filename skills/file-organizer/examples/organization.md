# File Organization Examples

## By File Type

### Basic Type Sorting
```bash
# Create folders by type
mkdir -p images/{jpg,png,gif}
mkdir -p documents/{pdf,docx,txt}
mkdir -p archives/{zip,7z,tar}

# Move files
mv *.jpg images/jpg/
mv *.png images/png/
mv *.gif images/gif/
mv *.pdf documents/pdf/
```

### Using find
```bash
# Find and move PDFs
find . -type f -name "*.pdf" -exec mv {} documents/pdf/ \;

# Find by modification time
find . -type f -mtime +30 -exec mv {} archives/ \;
```

## By Date

### Organize Photos by Date
```bash
# Create dated folders and move
for f in *.jpg *.png *.gif; do
  [ -f "$f" ] || continue
  date=$(date -r "$f" +%Y-%m-%d)
  mkdir -p "photos/$date"
  mv "$f" "photos/$date/"
done
```

### Organize Downloads
```bash
# By month
for f in *.*; do
  [ -f "$f" ] || continue
  month=$(date -r "$f" +%Y-%m)
  mkdir -p "$month"
  mv "$f" "$month/"
done
```

## Batch Rename

### Add Prefix
```bash
# Add date prefix
for f in *.*; do
  [ -f "$f" ] || continue
  mv "$f" "$(date +%Y%m%d)_$f"
done
```

### Rename Pattern
```bash
# Replace spaces with underscores
for f in *\ *; do
  mv "$f" "${f// /_}"
done

# Change extension
rename 's/\.jpeg$/\.jpg/' *.jpeg
```

## Custom Organization

### Project Structure
```bash
# Create project structure
mkdir -p project/{src,tests,docs,assets,config}

# Move files accordingly
mv *.py src/
mv *_test.py tests/
mv *.md docs/
```

### Mixed Criteria
```bash
# Complex organization
for f in *; do
  [ -f "$f" ] || continue
  
  # By type
  case "$f" in
    *.py) mkdir -p python && mv "$f" python/ ;;
    *.js) mkdir -p javascript && mv "$f" javascript/ ;;
    *.md) mkdir -p docs && mv "$f" docs/ ;;
  esac
  
  # By size (large files)
  size=$(stat -f%z "$f" 2>/dev/null || stat -c%s "$f" 2>/dev/null)
  if [ "$size" -gt 1000000 ]; then
    mkdir -p large && mv "$f" large/ 2>/dev/null || true
  fi
done
```

## Safety Tips

1. **Always preview** before moving files
2. **Use --dry-run** when available
3. **Keep backups** until verified
4. **Check duplicates** before moving
