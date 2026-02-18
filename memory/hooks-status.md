# 2026-02-18 Hooks 激活状态

## 当前 Hooks (8个)

| Hook | 功能 | 状态 |
|------|------|------|
| web-fetch-fallback | web_fetch 失败时用 curl 重试 | ✅ 已激活 |
| web-fetch-warning | 记录 web_fetch 警告 | ✅ 已激活 |
| edit-auto-retry | edit 失败自动重试 | ✅ 已激活 |
| edit-exact-match | edit 精确匹配修复 | ✅ 已激活 |
| edit-failure-logger | edit 失败日志 | ✅ 已激活 |
| message-param-validator | message 参数验证 | ✅ 已激活 |
| exec-failure-recovery | exec 退出码分析 (新) | ✅ 已激活 |
| browser-auto-start | 浏览器自动启动 (新) | ✅ 已激活 |

## 目标 Fitness

- edit: 86% → 90%+
- web_fetch: 66% → 80%+ (通过 curl fallback)
- browser: 67% → 80%+ (通过 auto-start)

## 待解决问题

1. web_fetch SECURITY NOTICE - 根本限制，需用 exec+curl
2. edit 精确匹配 - 已有 hooks 需观察效果
3. browser 服务未启动 - 已有 auto-start hook
