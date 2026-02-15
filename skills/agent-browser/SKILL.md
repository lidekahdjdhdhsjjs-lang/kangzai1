---
name: agent-browser
description: Control web browser for automation, scraping, and interactive web tasks. Use browser tool for navigation, form filling, and screenshots.
---

# Agent Browser

## When to Use
- Filling forms and automating web interactions
- Scraping web page content
- Taking screenshots
- Testing web applications
- Navigating complex web interfaces

## Quick Reference

### Commands

```bash
# Start browser
./scripts/start.sh [profile] [--headless]

# Navigate to URL
openclaw browser navigate "https://example.com"

# Take screenshot
openclaw browser screenshot

# Execute JavaScript
openclaw browser evaluate "document.title"

# Fill form
openclaw browser fill "#email" "user@example.com"

# Click element
openclaw browser click "#submit-btn"

# Scrape content
./scripts/scrape.sh <url> [output-file] [selector]
```

## Browser Profiles

- `openclaw`: Isolated browser (recommended)
- `chrome`: Use existing Chrome with extension relay

## Tips
- Use specific selectors for reliable automation
- Add waits for dynamic content
- Combine with `evaluate` for complex interactions
- Check console logs for debugging

## Directory Structure

```
agent-browser/
├── SKILL.md              # This file
├── agents/
│   └── openai.yaml       # Agent configurations
├── examples/
│   ├── automation.md     # Automation examples
│   └── screenshot.md      # Screenshot tips
├── scripts/
│   ├── start.sh          # Browser startup
│   ├── scrape.sh         # Web scraping
│   └── form-fill.sh      # Form automation
```

## Examples

### Basic Automation
See [examples/automation.md](examples/automation.md) for:
- Basic navigation
- Form filling
- Scraping techniques
- Error recovery

### Screenshots
See [examples/screenshot.md](examples/screenshot.md) for:
- Full page screenshots
- Element screenshots
- Debugging workflows
- Best practices

## Agent Configurations

See [agents/openai.yaml](agents/openai.yaml) for model-specific configurations:
- **default**: Balanced settings for general tasks
- **analyst**: High reasoning for complex automation
- **quick**: Fast execution for simple tasks
