# Hook: message-react-target

## Pattern
- **Tool**: message
- **Error**: Action react requires a target
- **Resolution**: 在使用 react action 时，确保传递 messageId 或 target

## Hook Code

```typescript
import { HookHandler } from "@openclaw";

export const handler: HookHandler = async (event, ctx) => {
  if (event.toolName === "message") {
    const args = event.args;
    const action = args?.action;
    
    // 需要 target 的 action
    const needsTarget = ["react", "reactions", "pin", "unpin", "edit", "delete", "thread-reply"];
    
    if (needsTarget.includes(action)) {
      if (!args?.messageId && !args?.target && !args?.message) {
        if (ctx?.injectSystemMessage) {
          ctx.injectSystemMessage(`[HOOK] message 工具 action="${action}" 需要 messageId、target 或 message 参数之一。请确保提供目标消息。`);
        }
      }
    }
  }
};
```

## Created
2026-02-18
