# Cron Issues Tracker

## 2026-02-18

### 已修复问题

| Date | Job | Issue | Status |
|------|-----|-------|--------|
| 2026-02-18 | auto-company-morning | delivery target missing | ✅ 已修复 |
| 2026-02-18 | discord-channel-monitor | MiniMax rate limit | ✅ 已修复：切换到 GLM-4-Flash |

### 待观察

- discord-channel-monitor: 下次运行使用新模型，如仍失败需进一步调查
- auto-company-morning: consecutiveErrors 重置为 0

---

## 2026-02-19

### Overseer 分析结果 (02:24)

**持续失败模式（已自动修复）:**
| 问题 | 次数 | 状态 |
|------|------|------|
| cron:invalid cron.update params | 4x | ✅ 自动修复 |
| exec:Command exited with code N | 16x | ✅ 自动修复 |

**当前 Cron Jobs 状态:**
| Job | consecutiveErrors | 状态 |
|-----|-------------------|------|
| foundry-overseer | 0 | ✅ 正常 |
| foundry-infinite-evolution | 0 | ✅ 正常 |
| discord-channel-monitor | 0 | ✅ 正常 |
| auto-company-morning | 0 | ✅ 正常 |
| auto-company-review | 0 | ✅ 正常 |
| daily-memory-summary | 0 | ✅ 正常 |
| daily-github-backup | 0 | ✅ 正常 |
| triple-robot-discussion | 0 | ✅ 正常 |
| memory-archiver | - | ✅ 待运行 |

**结论:** 所有 cron jobs 正常运行，无需干预。Foundry 已自动记录这些失败模式并成功恢复。
