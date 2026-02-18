# Hook: auto-repair-edit

## Pattern
- **Tool**: edit
- **Error**: Could not find the exact text / Found N occurrences
- **Resolution**: 自动重新读取文件并重试

## Hook Code (Auto-Repair)

```typescript
import { HookHandler } from "@openclaw";

export const handler: HookHandler = async (event, ctx) => {
  // 在 edit 调用前自动执行
  if (event.toolName === "edit") {
    const filePath = event.args?.file_path || event.args?.path;
    const oldText = event.args?.oldText || event.args?.old_string;
    
    if (filePath && oldText && ctx?.injectSystemMessage) {
      // 自动注入读取文件提醒
      ctx.injectSystemMessage(`[AUTO-REPAIR] edit 工具准备执行:
1. 先读取: ${filePath}
2. 验证 oldText 是否存在
3. 如不存在，自动添加更多上下文后重试
4. 如重复，手动添加唯一标识`);
    }
  }
};

// 结果处理
export const resultHandler: HookHandler = async (event, ctx) => {
  if (event.toolName === "edit" && event.error) {
    const errorMsg = event.error?.message || "";
    
    if (errorMsg.includes("Could not find") || errorMsg.includes("Found N occurrences")) {
      // 自动记录失败并建议方案
      if (ctx?.injectSystemMessage) {
        ctx.injectSystemMessage(`[AUTO-REPAIR] edit 失败，需要重新读取文件后重试。`);
      }
    }
  }
};
```

## Created
2026-02-18
