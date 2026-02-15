# Batch Renaming Patterns

## Common Patterns

### Add Prefix
```bash
# Add date prefix
for f in *.*; do
  mv "$f" "$(date +%Y%m%d)_$f"
done

# Add custom prefix
for f in *.jpg; do
  mv "$f" "photo_$f"
done
```

### Add Suffix
```bash
# Add _backup suffix
for f in *; do
  [ -f "$f" ] && mv "$f" "${f}_backup"
done
```

### Replace Characters
```bash
# Replace spaces with underscores
for f in *\ *; do
  mv "$f" "${f// /_}"
done

# Replace uppercase with lowercase
for f in *; do
  mv "$f" "$(echo $f | tr '[:upper:]' '[:lower:]')"
done
```

### Change Extension
```bash
# .jpeg → .jpg
rename 's/\.jpeg$/\.jpg/' *.jpeg

# .htm → .html
rename 's/\.htm$/\.html/' *.htm
```

### Number Files
```bash
# Add sequence number
i=1
for f in *.jpg; do
  mv "$f" "$(printf '%03d' $i)_$f"
  i=$((i + 1))
done
```

## Advanced Patterns

### Conditional Renaming
```bash
# Rename only large files
for f in *; do
  size=$(stat -f%z "$f" 2>/dev/null || stat -c%s "$f" 2>/dev/null)
  if [ "$size" -gt 1000000 ]; then
    mv "$f" "large_$f"
  fi
done
```

### Regex Replacement
```bash
# Using rename (Perl-based)
rename 's/IMG_(\d+)/photo_$1/' *.jpg

# Remove all numbers
rename 's/[0-9]+//' *
```

### Pattern from Filename
```bash
# Extract date from filename and use as folder
for f in IMG_20240101_*.jpg; do
  date=$(echo "$f" | grep -oP '\d{8}')
  mkdir -p "$date"
  mv "$f" "$date/"
done
```

## Safety Tips

1. **Always dry-run first**
   ```bash
   # Preview without actually renaming
   rename -n 's/old/new/' *
   ```

2. **Backup before bulk operations**
   ```bash
   cp -r . ../backup_before_rename
   ```

3. **Use quotes to handle spaces**
   ```bash
   for f in "* *"; do
     mv "$f" "${f// /_}"
   done
   ```

4. **Test with one file first**
   ```bash
   mv "test file.jpg" "test_file.jpg"  # Test
   ```
