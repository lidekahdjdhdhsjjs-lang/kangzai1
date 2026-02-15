---
name: file-organizer
description: Organize files by type, date, or custom rules. Move, rename, and categorize files efficiently.
---

# File Organizer

## When to Use
- Organizing messy directories
- Sorting downloads by file type
- Archiving old files by date
- Batch renaming files
- Creating folder structures

## Quick Reference

### Commands

```bash
# Organize by type
./scripts/organize-by-type.sh [dir] [--dry-run]

# Organize by date
./scripts/organize-by-date.sh [dir] [format]

# Batch rename
./scripts/batch-rename.sh "pattern" [--dry-run]

# Manual commands
mkdir -p docs/{pdf,docx,txt}
mv *.pdf docs/pdf/
```

### Patterns

```bash
# By type
find . -type f -name "*.pdf" -exec mv {} docs/ \;

# By date
for f in *.*; do
  date=$(date -r "$f" +%Y-%m-%d)
  mkdir -p "$date"
  mv "$f" "$date/"
done

# Rename
rename 's/IMG_/photo_/' *.jpg
```

## Organized Structure Example

```
project/
├── src/          # Source code
├── docs/         # Documentation
├── tests/        # Test files
├── assets/       # Images, fonts, etc.
└── config/       # Configuration files
```

## Best Practices
- Always preview before moving
- Use `--dry-run` when available
- Keep original backup until verified
- Use consistent naming conventions

## Directory Structure

```
file-organizer/
├── SKILL.md              # This file
├── agents/
│   └── openai.yaml       # Agent configurations
├── examples/
│   ├── organization.md    # Organization examples
│   └── project-structure.md  # Project templates
├── scripts/
│   ├── organize-by-type.sh   # Type sorting
│   ├── organize-by-date.sh   # Date sorting
│   └── batch-rename.sh       # Batch renaming
```

## Examples

### Basic Organization
See [examples/organization.md](examples/organization.md) for:
- File type sorting
- Date-based organization
- Batch renaming
- Custom organization rules

### Project Structures
See [examples/project-structure.md](examples/project-structure.md) for:
- Basic project layout
- Web project structure
- Python project structure
- Automated creation

## Agent Configurations

See [agents/openai.yaml](agents/openai.yaml) for model-specific configurations:
- **default**: Balanced settings for general tasks
- **architect**: Complex structure design
- **quick**: Fast execution for simple tasks
