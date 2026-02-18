# Hook: active-planner

## Pattern
- **Goal**: 主动规划 - 不是等任务，是自己找任务

## Hook Code

```typescript
import { HookHandler } from "@openclaw";

export const handler: HookHandler = async (event, ctx) => {
  // 定时触发主动规划
  if (event.eventType === "heartbeat" || event.eventType === "gateway:startup") {
    
    const planningQuestions = [
      " Fitness 有没有下降?",
      " 有没有新的失败模式?",
      " Cron jobs 运行正常吗?",
      " 记忆系统完整吗?",
      " Hooks 都激活了吗?"
    ];
    
    if (ctx?.injectSystemMessage) {
      ctx.injectSystemMessage(`[ACTIVE-PLANNER] 主动规划检查:
${planningQuestions.map((q, i) => `${i+1}.${q}`).join("\n")}

发现问题时的处理:
- 轻微: 自动修复
- 中等: 记录到待办
- 严重: 立即通知用户`);
    }
  }
};
```

## Capabilities
- ✅ 定时自检
- ✅ 问题分级
- ✅ 自动处理

## Created
2026-02-18
