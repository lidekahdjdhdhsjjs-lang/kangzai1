# Hook: cron-patch-params

## Pattern
- **Tool**: cron
- **Error**: invalid cron.update params: at /patch/payload: must have required property 'kind'
- **Resolution**: cron patch 操作时确保 payload 包含 kind 属性

## Hook Code

```typescript
import { HookHandler } from "@openclaw";

export const handler: HookHandler = async (event, ctx) => {
  if (event.toolName === "cron" && event.args?.action === "update") {
    const patch = event.args?.patch;
    const payload = patch?.payload;
    
    if (payload && !payload.kind) {
      if (ctx?.injectSystemMessage) {
        ctx.injectSystemMessage(`[HOOK] cron update 需要 payload.kind 属性。当前 patch: ${JSON.stringify(patch).slice(0,200)}`);
      }
    }
  }
};
```

## Created
2026-02-18
