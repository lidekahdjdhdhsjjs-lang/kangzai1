# Hook: edit-unique-match

## Pattern
- **Tool**: edit
- **Error**: Found N occurrences of the text - text must be unique
- **Resolution**: 编辑前确保 oldText 是唯一的，添加更多上下文

## Hook Code

```typescript
import { HookHandler } from "@openclaw";

export const handler: HookHandler = async (event, ctx) => {
  if (event.toolName === "edit") {
    const args = event.args;
    const oldText = args?.oldText || args?.old_string;
    const filePath = args?.file_path || args?.path;
    
    // 检查是否太短容易重复
    if (oldText && oldText.length < 20) {
      if (ctx?.injectSystemMessage) {
        ctx.injectSystemMessage(`[HOOK] oldText 太短 "${oldText}" (${oldText.length}字符)，容易出现 multiple matches。建议增加上下文。`);
      }
    }
  }
};
```

## Created
2026-02-18
