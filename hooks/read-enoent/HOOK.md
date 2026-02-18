# Hook: read-enoent

## Pattern
- **Tool**: read
- **Error**: ENOENT: no such file or directory
- **Resolution**: 读取前检查文件是否存在，失败后自动创建

## Hook Code

```typescript
import { HookHandler } from "@openclaw";

export const handler: HookHandler = async (event, ctx) => {
  if (event.toolName === "read") {
    const filePath = event.args?.file_path || event.args?.path;
    
    if (filePath && ctx?.injectSystemMessage) {
      // 常见路径错误
      if (filePath.includes("memory.json/")) {
        ctx.injectSystemMessage(`[HOOK] 路径错误: "${filePath}"。应该是 memory/ 而不是 memory.json/`);
      }
      if (filePath.includes(".md.md")) {
        ctx.injectSystemMessage(`[HOOK] 路径错误: "${filePath}"。重复的 .md 扩展名`);
      }
    }
  }
};
```

## Created
2026-02-18
