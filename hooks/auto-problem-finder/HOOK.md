# Hook: auto-problem-finder

## Pattern
- **Goal**: 主动发现问题 - 定期扫描并修复

## Hook Code

```typescript
import { HookHandler } from "@openclaw";

export const handler: HookHandler = async (event, ctx) => {
  // 定时检查系统问题
  if (event.eventType === "gateway:startup" || event.eventType === "heartbeat") {
    
    const checks = [
      { name: "Cron Jobs", check: "检查是否有失败的 cron job" },
      { name: "Memory", check: "检查记忆文件是否完整" },
      { name: "Fitness", check: "检查工具 Fitness 是否下降" },
      { name: "Hooks", check: "检查 Hook 是否激活" },
    ];
    
    if (ctx?.injectSystemMessage) {
      ctx.injectSystemMessage(`[AUTO-PROBLEM-FINDER] 系统检查:
${checks.map(c => `- ${c.name}: ${c.check}`).join("\n")}

发现问题的处理方式:
1. 轻微问题 → 自动修复
2. 中等问题 → 记录到待办
3. 严重问题 → 立即通知用户`);
    }
  }
};
```

## Capabilities
- ✅ 启动时自检
- ✅ 心跳时检查
- ✅ 自动分级处理问题

## Created
2026-02-18
