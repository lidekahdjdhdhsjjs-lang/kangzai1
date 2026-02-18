# Hook: message-send-target

## Pattern
- **Tool**: message
- **Error**: Action send requires a target / Unknown Channel
- **Resolution**: 使用 message 工具时确保提供正确的 target

## Hook Code

```typescript
import { HookHandler } from "@openclaw";

export const handler: HookHandler = async (event, ctx) => {
  if (event.toolName === "message") {
    const args = event.args;
    const action = args?.action;
    const target = args?.target;
    const channel = args?.channel;
    
    // 需要 target 的 action
    const needsTarget = ["send", "edit", "delete", "react", "reactions", "pin", "unpin"];
    
    if (needsTarget.includes(action)) {
      if (!target && !channel) {
        if (ctx?.injectSystemMessage) {
          ctx.injectSystemMessage(`[HOOK] message action="${action}" 需要 target 或 channel 参数。Discord 格式: channel:ID 或 user:ID 或直接 ID`);
        }
      }
    }
  }
};
```

## Created
2026-02-18
