# Hook: gateway-restart-enable

## Pattern
- **Tool**: gateway
- **Error**: Gateway restart is disabled. Set commands.restart=true
- **Resolution**: 自动提示启用 gateway restart 配置

## Hook Code

```typescript
import { HookHandler } from "@openclaw";

export const handler: HookHandler = async (event, ctx) => {
  if (event.toolName === "gateway") {
    const action = event.args?.action;
    
    if (action === "restart") {
      if (ctx?.injectSystemMessage) {
        ctx.injectSystemMessage(`[HOOK] gateway restart 被禁用。需要配置:
1. 打开 openclaw.json
2. 添加 "commands": { "restart": true }
3. 重启 gateway: openclaw gateway restart

或使用 config.patch: { "commands": { "restart": true } }`);
      }
    }
  }
};
```

## Created
2026-02-18
