# Hook: auto-researcher

## Pattern
- **Goal**: 外部交互 - 自动搜索和整理信息

## Hook Code

```typescript
import { HookHandler } from "@openclaw";

export const handler: HookHandler = async (event, ctx) => {
  const toolName = event.toolName;
  const args = event.args;
  
  // 需要外部信息的场景
  const researchTriggers = [
    {
      trigger: toolName === "foundry_research" && args?.query,
      action: "执行研究",
      saveResult: true
    },
    {
      trigger: toolName === "web_search" && args?.query,
      action: "搜索信息",
      saveResult: true
    },
    {
      trigger: toolName === "foundry_implement" && args?.capability,
      action: "实现新功能",
      saveResult: false
    }
  ];
  
  for (const rule of researchTriggers) {
    if (rule.trigger && ctx?.injectSystemMessage) {
      let msg = `[AUTO-RESEARCHER] 检测到研究任务: ${rule.action}`;
      
      if (rule.saveResult) {
        msg += "\n结果将自动保存到记忆系统";
      }
      
      ctx.injectSystemMessage(msg);
    }
  }
};
```

## Capabilities
- ✅ 自动检测研究需求
- ✅ 自动保存结果
- ✅ 整合外部信息

## Created
2026-02-18
