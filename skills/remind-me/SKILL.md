---
name: remind-me
description: Schedule reminders using OpenClaw cron system. Set one-time or recurring reminders.
---

# Remind Me

## When to Use
- Scheduling future reminders
- Setting task deadlines
- Creating recurring notifications
- Time-based follow-ups

## Commands

### One-time Reminder
```bash
openclaw cron add --name "Meeting" --at "2026-02-15T14:00:00" --text "团队会议"
```

### Recurring Reminder
```bash
# Every day at 9am
openclaw cron add --name "Daily Standup" --schedule "0 9 * * *" --text "每日站会"

# Every Monday at 10am
openclaw cron add --name "Weekly Review" --schedule "0 10 * * 1" --text "周回顾"
```

### List Reminders
```bash
openclaw cron list
```

### Delete Reminder
```bash
openclaw cron remove <jobId>
```

## Schedule Format
- Cron: `minute hour day month weekday`
- Examples:
  - `0 9 * * *` = 每天 9:00
  - `30 14 * * 5` = 每周五 14:30
  - `0 8 1 * *` = 每月1号 8:00

## Tips
- Use descriptive names for easy identification
- Set reminders 15-30 min before actual event
- Combine with calendar for full schedule view
