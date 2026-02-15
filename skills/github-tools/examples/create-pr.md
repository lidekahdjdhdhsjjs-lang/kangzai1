# Pull Request Examples

## Create PR with GitHub CLI

### Basic PR
```bash
gh pr create --title "Fix login bug" --body "Fixed authentication issue"
```

### PR with specific base
```bash
gh pr create --title "New feature" --base develop --head feature-branch
```

### PR from commit message
```bash
git add .
git commit -m "Add amazing feature"
git push -u origin feature-branch

gh pr create --title "Add amazing feature" --base main
```

## PR Workflow

### 1. Create Feature Branch
```bash
git checkout -b feature/amazing-feature
# Make changes
git add .
git commit -m "Implement amazing feature"
```

### 2. Push to Remote
```bash
git push -u origin feature/amazing-feature
```

### 3. Create PR
```bash
gh pr create \
  --title "feat: Add amazing feature" \
  --body "## Summary
Implemented amazing feature that does X

## Changes
- Added feature A
- Fixed bug B

## Testing
- Added unit tests
- Verified manually" \
  --base main
```

### 4. Review PR
```bash
# List open PRs
gh pr list

# View PR diff
gh pr diff

# Check PR checks
gh pr checks
```

## Common PR Commands

```bash
# List PRs
gh pr list --state open

# View PR
gh pr view 123

# Checkout PR locally
gh pr checkout 123

# Add PR comment
gh pr comment 123 --body "Great work!"

# Merge PR
gh pr merge 123 --squash --delete-branch

# Close PR
gh pr close 123
```

## PR Best Practices

1. **Clear title**: Use conventional commits format
2. **Detailed description**: Explain what and why
3. **Small PRs**: Under 400 lines is ideal
4. **Link issues**: Reference related issues
5. **Add tests**: Include test coverage
