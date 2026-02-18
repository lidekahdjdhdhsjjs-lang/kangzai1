# Tool Fixes - 2026-02-19

## 问题1: cron:invalid params (4次失败)

**错误信息:**
```
cron:invalid cron.update params: at /patch/payload: must have required property STR; at /patch/payload: unexpected property STR
```

**根因分析:**
- cron.update 调用时 payload 格式不正确
- 可能原因：使用了错误的参数名或类型

**解决方案:**
- 使用 cron action=list 先查看当前 job 配置
- 更新时确保 payload 符合 schema:
  - `payload.kind` 必须是 "agentTurn" 或 "systemEvent"
  - `payload.message` (agentTurn) 或 `payload.text` (systemEvent)
  
**预防 Hook:**
- 创建 tool_result_persist hook 记录 cron 错误
- 验证 payload 格式

---

## 问题2: message:Action react requires a target (26次失败)

**根因分析:**
- 使用 message react 时没有提供 target 参数
- Discord react 需要 messageId

**解决方案:**
- 始终提供 target 参数指向目标消息
- 或使用 emoji 参数而不是 action:react

---

## 问题3: exec:Command exited with code N (16次失败)

**已记录方案 (MEMORY.md):**
- 使用 `python3 -m pip` 替代 `pip`
- 检查命令语法和退出码

---

## 工具 Fitness 状态 (2026-02-19 07:54)

| 工具 | Fitness | 状态 |
|------|---------|------|
| web_search | 100% | ✅ |
| write | 100% | ✅ |
| sessions_spawn | 100% | ✅ |
| nodes | 100% | ✅ |
| session_status | 100% | ✅ |
| process | 100% | ✅ |
| memory_search | 100% | ✅ |
| read | 98% | ✅ |
| cron | 96% | ✅ |
| message | 96% | ✅ |
| edit | 98% | ✅ |
| exec | 90% | ⚠️ |

---

## 行动计划

1. ✅ 已记录 cron:invalid 问题
2. ⚠️ 需要创建 Hook 预防 cron update 错误
3. ⚠️ 需要改进 message react 调用方式

**更新时间:** 2026-02-19 07:54
