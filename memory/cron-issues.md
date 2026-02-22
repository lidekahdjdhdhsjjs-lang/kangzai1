# Cron Issues Log

## 2026-02-22 18:54

### 状态：✅ 全部健康

**Cron Jobs 诊断**:
| Job | consecutiveErrors | 状态 |
|-----|------------------|------|
| discord-channel-monitor | 0 | ✅ 已恢复 |
| gateway-auto-restart-checker | 0 | ✅ |
| foundry-overseer | 0 | ✅ |
| daily-memory-summary | 0 | ✅ |
| daily-github-backup | 0 | ✅ |
| triple-robot-discussion | 0 | ✅ |
| auto-company-morning | 0 | ✅ |
| memory-archiver | 0 | ✅ |

**总结**:
- 所有 10 个 Cron Jobs 全部正常
- 无需修复

---

## 2026-02-20

### auto-company-morning (ID: 5c2f1fa8-09b9-4ed5-8145-73b009e7e2bf)

- **Error**: "cron delivery target is missing"
- **Consecutive Errors**: 1
- **Last Run**: 2026-02-18 09:00
- **Status**: ⚠️ 需关注

**尝试修复**:
- 2026-02-20 11:55: 更新 delivery 配置 → 无效

**可能原因**:
- Discord channel ID 格式问题
- delivery.to 字段解析失败

**后续步骤**:
- 监控 consecutiveErrors
- 如果继续失败，考虑移除 delivery 配置改用 message 工具发送

**2026-02-20 13:54 更新**:
- consecutiveErrors: 1 (未增加)
- 状态: 继续监控
- 其他 cron jobs 全部健康 (consecutiveErrors = 0)

## 2026-02-21 12:54

### 状态：✅ 全部健康
- 所有 8 个 Cron Jobs consecutiveErrors = 0
- 无需修复

## 2026-02-21 07:24

### 状态：✅ 全部健康

**检查结果**:
- 所有 8 个 cron jobs consecutiveErrors = 0
- 无需修复的 jobs
- 之前记录的 auto-company-morning 问题已自行恢复

## 2026-02-22 15:24

### 状态：⚠️ 1个需修复

**Cron Jobs 诊断**:
| Job | consecutiveErrors | 状态 |
|-----|------------------|------|
| discord-channel-monitor | 5 | ❌ **需修复** (rate_limit) |
| gateway-auto-restart-checker | 2 | ⚠️ 需关注 (rate_limit) |
| foundry-overseer | 2 | ⚠️ 需关注 (rate_limit) |
| daily-memory-summary | 0 | ✅ |
| daily-github-backup | 0 | ✅ |
| triple-robot-discussion | 0 | ✅ |
| auto-company-morning | 0 | ✅ |
| memory-archiver | 0 | ✅ |

**问题分析**:
- `discord-channel-monitor` (5次连续错误): MiniMax 模型限速 (rate_limit)
- 其他 jobs 正常运行，只是偶尔因模型限速失败

**处理建议**:
- 暂时观察，MiniMax 限速是外部因素
- 如果持续失败，考虑切换到备选模型 (GLM-4-Flash)

**Tool Fitness 状态**:
| Tool | Fitness | 状态 |
|------|---------|------|
| web_search | 100% | ✅ |
| write | 100% | ✅ |
| exec | 94% | ✅ |
| read | 97% | ✅ |
| cron | 97% | ✅ |
| message | 97% | ✅ |
| edit | 83% | ⚠️ 需改进 |
| gateway | 89% | ⚠️ 需改进 |
| web_fetch | 65% | ❌ 需用curl替代 |
| browser | 75% | ⚠️ 需改进 |

**Evolution 目标**:
1. web_fetch (65%): 使用 exec+curl 替代
2. edit (83%): 预读取文件
3. browser (75%): 确保浏览器服务启动
4. gateway (89%): 配置 commands.restart=true

---
*记忆永远不删除，只追加*
