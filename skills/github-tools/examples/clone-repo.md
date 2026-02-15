# Git Clone Examples

## Basic Clone

```bash
# Using Git directly
git clone https://github.com/user/repo.git

# Using GitHub CLI
gh repo clone user/repo
```

## Shallow Clone (Faster)

```bash
# Clone only latest commit
git clone --depth 1 https://github.com/user/repo.git

# Clone with depth 10
gh repo clone user/repo -- --depth 10
```

## Clone to Specific Directory

```bash
# Git
git clone https://github.com/user/repo.git ./my-project

# GitHub CLI
gh repo clone user/repo ./my-project
```

## Clone Specific Branch

```bash
# Git
git clone --branch feature-name https://github.com/user/repo.git

# GitHub CLI
gh repo clone user/repo -- --branch feature-name
```

## Troubleshooting

### Slow Clone
```bash
# Use shallow clone
git clone --depth 1 <repo-url>

# Or use GitHub CLI (optimized)
gh repo clone user/repo
```

### Connection Timeout
```bash
# Increase Git timeout
git config --global http.postBuffer 524288000

# Check proxy
git config --global --get http.proxy
```

### Permission Denied
```bash
# Check SSH key
ssh -T git@github.com

# Or use HTTPS with token
git clone https://username:ghp_token@github.com/user/repo.git
```
