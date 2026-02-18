# Hook: edit-pre-read

## Pattern
- **Tool**: edit
- **Error**: Could not find the exact text
- **Resolution**: 在编辑前自动读取文件内容，确保精确匹配

## Hook Code

```typescript
import { HookHandler } from "@openclaw";

export const handler: HookHandler = async (event, ctx) => {
  if (event.toolName === "edit") {
    const args = event.args;
    const filePath = args?.file_path || args?.path;
    
    if (filePath && ctx?.injectSystemMessage) {
      ctx.injectSystemMessage(`[HOOK] edit 工具使用前建议先读取文件 "${filePath}" 以确保 oldText 精确匹配。`);
    }
  }
};
```

## Created
2026-02-18
