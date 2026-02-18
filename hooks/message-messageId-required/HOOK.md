# Hook: message-messageId-required

## Pattern
- **Tool**: message
- **Error**: messageId required
- **Resolution**: 在使用 message 工具时，确保传递正确的 messageId 参数

## Hook Code

```typescript
import { HookHandler } from "@openclaw";

export const handler: HookHandler = async (event, ctx) => {
  if (event.toolName === "message") {
    const args = event.args;
    
    // 检测是否需要 messageId
    const action = args?.action;
    
    // 需要 messageId 的 action
    const needsMessageId = ["edit", "delete", "react", "reactions", "pin", "unpin", "thread-reply"];
    
    if (needsMessageId.includes(action)) {
      if (!args?.messageId && !args?.message) {
        if (ctx?.injectSystemMessage) {
          ctx.injectSystemMessage(`[HOOK] message 工具 action="${action}" 需要 messageId 参数。请确保在 args 中提供 messageId 或使用其他方式指定目标消息。`);
        }
      }
    }
  }
};
```

## Created
2026-02-18
