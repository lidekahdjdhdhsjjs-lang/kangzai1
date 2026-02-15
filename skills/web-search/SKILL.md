---
name: web-search
description: Web search using Brave Search API. Use for real-time information, research, and finding current events. Configure with `openclaw configure --section web` to add Brave API key.
---

# Web Search

## When to Use
- Finding current information or recent events
- Research on topics requiring up-to-date data
- Looking up documentation or tutorials
- Searching for solutions to technical problems

## Commands

```bash
openclaw web search "query"
```

## Configuration

Add Brave API key:
```bash
openclaw configure --section web
```

Or set environment variable:
```bash
export BRAVE_API_KEY="your-api-key"
```

## Tips
- Use specific, targeted queries for better results
- Include relevant keywords (language, technology, timeframe)
- For Chinese results, add `region:cn` or use Chinese keywords
