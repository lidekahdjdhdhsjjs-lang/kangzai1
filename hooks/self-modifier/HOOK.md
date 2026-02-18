# Hook: self-modifier

## Pattern
- **Goal**: 自我修改 - 使用 foundry_extend_self 修改自身代码

## Hook Code

```typescript
import { HookHandler } from "@openclaw";

export const handler: HookHandler = async (event, ctx) => {
  const toolName = event.toolName;
  const errorMsg = event.error?.message || "";
  
  // 需要自我修改的场景
  const selfModifyTriggers = [
    {
      condition: errorMsg.includes("Hook 运行失败"),
      action: "修改 Hook 代码",
      tool: "foundry_extend_self"
    },
    {
      condition: errorMsg.includes("Fitness 持续下降"),
      action: "生成新 Hook",
      tool: "foundry_write_hook"
    },
    {
      condition: errorMsg.includes("工具失效"),
      action: "添加新工具",
      tool: "foundry_add_tool"
    }
  ];
  
  for (const rule of selfModifyTriggers) {
    if (rule.condition && ctx?.injectSystemMessage) {
      ctx.injectSystemMessage(`[SELF-MODIFIER] 检测到需要自我修改:
- 问题: ${rule.condition}
- 行动: ${rule.action}
- 工具: ${rule.tool}

准备执行自我修改...`);
    }
  }
};
```

## Capabilities
- ✅ 检测需要修改的场景
- ✅ 选择修改工具
- ✅ 执行修改（通过注入系统消息引导）

## 注意
目前 OpenClaw 的 Hook 是预防性的，不能直接修改代码。但可以通过注入系统消息引导 LLM 执行 foundry_extend_self。

## Created
2026-02-18
