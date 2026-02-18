# Hook: exec-exit-code

## Pattern
- **Tool**: exec
- **Error**: Command exited with code N
- **Resolution**: 执行前检查命令语法，失败后自动重试

## Hook Code

```typescript
import { HookHandler } from "@openclaw";

export const handler: HookHandler = async (event, ctx) => {
  if (event.toolName === "exec") {
    const command = event.args?.command;
    
    // 常见错误命令模式
    const riskyPatterns = [
      /^pip\s+/,           // pip instead of python3 -m pip
      /^gh\s+/,           // gh not installed
      /^npm\s+install.*-g$/, // incomplete npm install
    ];
    
    for (const pattern of riskyPatterns) {
      if (pattern.test(command)) {
        if (ctx?.injectSystemMessage) {
          ctx.injectSystemMessage(`[HOOK] 命令 "${command}" 可能有问题。常见错误: pip→python3 -m pip, gh需要安装`);
        }
      }
    }
  }
};
```

## Created
2026-02-18
