# Browser Automation Examples

## Basic Navigation

### Open URL
```bash
openclaw browser navigate "https://example.com"
```

### Take Screenshot
```bash
openclaw browser screenshot
```

### Get Page Title
```bash
openclaw browser evaluate "document.title"
```

## Form Filling

### Simple Form
```bash
# Fill input field
openclaw browser fill "#email" "user@example.com"

# Fill password
openclaw browser fill "#password" "securepassword"

# Click submit
openclaw browser click "#submit-btn"
```

### Multi-Step Form
```bash
# Step 1: Fill personal info
openclaw browser fill "#first-name" "John"
openclaw browser fill "#last-name" "Doe"

# Step 2: Select option
openclaw browser select "#country" "US"

# Step 3: Checkbox
openclaw browser check "#terms"

# Step 4: Submit
openclaw browser click "#submit"
```

## Scraping Examples

### Extract Specific Element
```bash
# Get element text
openclaw browser evaluate "document.querySelector('#price').textContent"

# Get all headings
openclaw browser evaluate "Array.from(document.querySelectorAll('h2')).map(h => h.textContent)"
```

### Scroll and Scrape
```bash
# Scroll to bottom
openclaw browser evaluate "window.scrollTo(0, document.body.scrollHeight)"

# Wait for content
sleep 2

# Take screenshot
openclaw browser screenshot
```

## Error Recovery

### Retry with Delay
```bash
# Check if element exists
openclaw browser evaluate "document.querySelector('#content') !== null"

# If not found, wait and retry
sleep 3
openclaw browser navigate "https://example.com"
```

### Handle Popups
```bash
# Accept dialog
openclaw browser evaluate "document.querySelector('.dialog')?.remove()"
```

## Best Practices

1. **Use specific selectors**: Prefer IDs over classes
2. **Add waits**: Use `sleep` for dynamic content
3. **Check before acting**: Verify element exists
4. **Take progress screenshots**: Debug automation issues
5. **Handle errors gracefully**: Use try-catch in evaluate
