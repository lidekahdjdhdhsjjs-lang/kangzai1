# Hook: message-emoji-required

## Pattern
- **Tool**: message
- **Error**: emoji required
- **Resolution**: 在使用 message 工具时，确保传递正确的 emoji 参数

## Hook Code

```typescript
import { HookHandler } from "@openclaw";

export const handler: HookHandler = async (event, ctx) => {
  if (event.toolName === "message") {
    const args = event.args;
    const action = args?.action;
    
    // 需要 emoji 的 action
    const needsEmoji = ["react", "emoji-upload"];
    
    if (needsEmoji.includes(action)) {
      if (!args?.emoji && !args?.emojiName) {
        if (ctx?.injectSystemMessage) {
          ctx.injectSystemMessage(`[HOOK] message 工具 action="${action}" 需要 emoji 参数。请在 args 中提供 emoji 或 emojiName。`);
        }
      }
    }
  }
};
```

## Created
2026-02-18
