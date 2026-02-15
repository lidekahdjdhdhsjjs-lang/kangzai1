# Screenshot Examples

## Basic Screenshot

### Full Page
```bash
openclaw browser screenshot
```

### Specific Element
```bash
# Get element and screenshot it
openclaw browser evaluate "document.querySelector('#hero').screenshot()"
```

## Screenshot Workflow

### 1. Navigate to Page
```bash
openclaw browser navigate "https://example.com/dashboard"
```

### 2. Wait for Content
```bash
sleep 3  # Wait for dynamic content
```

### 3. Take Screenshot
```bash
openclaw browser screenshot
```

### 4. Scroll and Continue
```bash
# Scroll to bottom
openclaw browser evaluate "window.scrollTo(0, document.body.scrollHeight)"
sleep 1

# Take another screenshot
openclaw browser screenshot
```

## Screenshot with Evaluation

### Get Visual Evidence
```bash
# Navigate
openclaw browser navigate "https://example.com"

# Check if element is visible
IS_VISIBLE=$(openclaw browser evaluate "document.querySelector('#success-message')?.offsetParent !== null")

# Screenshot if visible
if [ "$IS_VISIBLE" = "true" ]; then
    openclaw browser screenshot
fi
```

## Debugging Tips

1. **Screenshots help debug** automation issues
2. **Name screenshots** to track progress
3. **Take before/after** screenshots
4. **Use selectors** that are stable (IDs over classes)
5. **Wait for animations** to complete
