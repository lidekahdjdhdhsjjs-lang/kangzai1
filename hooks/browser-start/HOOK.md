# Hook: browser-start

## Pattern
- **Tool**: browser
- **Error**: Can't reach the OpenClaw browser control service
- **Resolution**: 自动提示启动 browser 服务

## Hook Code

```typescript
import { HookHandler } from "@openclaw";

export const handler: HookHandler = async (event, ctx) => {
  if (event.toolName === "browser") {
    const action = event.args?.action;
    
    if (action === "start" || action === "status") {
      if (ctx?.injectSystemMessage) {
        ctx.injectSystemMessage(`[HOOK] 启动 browser 服务:
\`\`\`bash
openclaw browser start
\`\`\`
或使用 gateway 工具: gateway action=restart reason="启动browser服务"`);
      }
    }
  }
};
```

## Created
2026-02-18
