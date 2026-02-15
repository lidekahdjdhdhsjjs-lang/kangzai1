---
name: github-tools
description: GitHub repository management, cloning, commits, PRs, and issues. Requires Git proxy configuration for mainland China users.
---

# GitHub Tools

## When to Use
- Cloning or forking repositories
- Creating commits and pull requests
- Managing issues and PRs
- Checking repository status
- GitHub API operations

## Quick Reference

### Commands

```bash
# Clone repository
git clone https://github.com/user/repo.git

# Create commit
git add .
git commit -m "message"
git push

# GitHub CLI (if installed)
gh repo clone user/repo
gh issue list
gh pr create
```

### Script Usage

```bash
# Setup Git proxy
./scripts/git-setup.sh [proxy-port]  # Default: 7899

# Clone repository
./scripts/repo-clone.sh <repo-url> [dest-dir] [depth]

# Create pull request
./scripts/pr-create.sh <title> <body> [base-branch]
```

## Setup (Mainland China)

For reliable access from mainland China, configure Git proxy:

```bash
# Method 1: Global proxy
git config --global http.proxy "http://127.0.0.1:7890"
git config --global https.proxy "http://127.0.0.1:7890"

# Method 2: GitHub only
git config --global http.https://github.com.proxy "http://127.0.0.1:7890"
git config --global https.https://github.com.proxy "http://127.0.0.1:7890"

# Method 3: Direct access (no proxy)
git config --global --unset http.proxy
git config --global --unset https.proxy
```

## Common Issues

- **Slow clones**: Try shallow clone `git clone --depth 1`
- **Connection timeout**: Increase timeout or check proxy
- **Permission denied**: Configure SSH key or use personal access token

## Directory Structure

```
github-tools/
├── SKILL.md              # This file
├── agents/
│   └── openai.yaml       # Agent configurations
├── examples/
│   ├── clone-repo.md     # Clone examples
│   └── create-pr.md      # Pull request examples
├── scripts/
│   ├── git-setup.sh      # Git configuration
│   ├── repo-clone.sh     # Repository clone
│   └── pr-create.sh      # Pull request creation
```

## Examples

### Clone Repository
See [examples/clone-repo.md](examples/clone-repo.md) for detailed examples:
- Basic clone
- Shallow clone (faster)
- Clone to specific directory
- Clone specific branch
- Troubleshooting

### Create Pull Request
See [examples/create-pr.md](examples/create-pr.md) for complete workflow:
- GitHub CLI PR creation
- PR workflow (branch → push → review)
- Common PR commands
- Best practices

## Agent Configurations

See [agents/openai.yaml](agents/openai.yaml) for model-specific configurations:
- **default**: Balanced settings for general tasks
- **analyst**: High reasoning for repo analysis
- **quick**: Fast execution for simple operations
