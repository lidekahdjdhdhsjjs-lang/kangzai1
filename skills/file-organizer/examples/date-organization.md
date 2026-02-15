# Date-Based Organization

## Organize by Modification Date

### Basic Date Sorting
```bash
# Create folders by date and move
for f in *.*; do
  date=$(date -r "$f" +%Y-%m-%d)
  mkdir -p "$date"
  mv "$f" "$date/"
done
```

### Organize by Month
```bash
# Group by month (YYYY-MM)
for f in *.*; do
  month=$(date -r "$f" +%Y-%m)
  mkdir -p "$month"
  mv "$f" "$month/"
done
```

### Organize by Year
```bash
# Group by year (YYYY)
for f in *.*; do
  year=$(date -r "$f" +%Y)
  mkdir -p "$year"
  mv "$f" "$year/"
done
```

## Organize Photos by Date

### From Camera
```bash
# Assume photos are named IMG_YYYYMMDD_XXXX.jpg
for f in IMG_*.jpg; do
  [ -f "$f" ] || continue
  date=$(echo "$f" | grep -oP '\d{8}')
  if [ -n "$date" ]; then
    year="${date:0:4}"
    month="${date:4:2}"
    mkdir -p "photos/$year/$month"
    mv "$f" "photos/$year/$month/"
  fi
done
```

### From Downloads
```bash
# Organize mixed downloads by month
for f in *; do
  [ -f "$f" ] || continue
  month=$(date -r "$f" +%Y-%m)
  mkdir -p "downloads/$month"
  mv "$f" "downloads/$month/"
done
```

## Batch Processing

### Process Multiple Directories
```bash
# Organize all subdirectories
for dir in */; do
  echo "Processing: $dir"
  cd "$dir"
  for f in *.*; do
    date=$(date -r "$f" +%Y-%m-%d)
    mkdir -p "$date"
    mv "$f" "$date/" 2>/dev/null || true
  done
  cd ..
done
```

## Using find Command

### By Age
```bash
# Files older than 30 days
find . -type f -mtime +30 -exec mv {} old/ \;

# Files from last 7 days
find . -type f -mtime -7 -exec mv {} recent/ \;
```

### By Specific Date
```bash
# Files modified on specific date
find . -type f -newermt "2024-01-01" ! -newermt "2024-01-31" -exec mv {} january/ \;
```

## Best Practices

1. **Preview first**: Always check what will be moved
2. **Use date from filename**: More reliable than filesystem date
3. **Group by month**: Good balance of granularity
4. **Keep originals**: Backup until verified
