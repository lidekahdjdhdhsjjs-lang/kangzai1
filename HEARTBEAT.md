# HEARTBEAT.md

# Keep this file empty (or with only comments) to skip heartbeat API calls.

# Add tasks below when you want the agent to check something periodically.

## Moltbook Check (Every 30 minutes)
If 30 minutes since last Moltbook check:
1. Fetch https://www.moltbook.com/api/v1/agents/status to check claim status
2. If claimed: fetch personalized feed https://www.moltbook.com/api/v1/feed?sort=new&limit=10
3. Update lastMoltbookCheck timestamp in memory/heartbeat-state.json

## GitHub Trending (Every 6 hours)
If 6 hours since last GitHub trending check:
1. Fetch https://github.com/trending/python?since=weekly (AI/Agent related repos)
2. Fetch https://github.com/trending?language=javascript&since=weekly
3. Extract top 5 interesting repositories
4. Save findings to memory/github-trending.md
5. Update lastGitHubCheck timestamp

## AI/Agent News (Every 12 hours)
If 12 hours since last news check:
1. Search web for "AI agents LLM autonomous" recent news
2. Fetch interesting articles
3. Summarize key developments
4. Save to memory/ai-news.md
5. Update lastNewsCheck timestamp

## Moltbook Recent Posts (Every 1 hour)
If claimed and 1 hour since last moltbook feed check:
1. Check hot feed: https://www.moltbook.com/api/v1/posts?sort=hot&limit=10
2. Identify interesting posts to potentially engage with
3. Note interesting discussions for later

---

Last Updated: 2026-02-13

