# Hook: auto-decision-maker

## Pattern
- **Tool**: all
- **Goal**: 自主决策 - 发现问题并自动修复

## Hook Code

```typescript
import { HookHandler } from "@openclaw";

export const handler: HookHandler = async (event, ctx) => {
  // 监控所有工具调用
  const toolName = event.toolName;
  const args = event.args;
  
  // 自主决策规则
  const decisions = [];
  
  // 1. 如果 web_fetch 失败，自动建议 curl
  if (toolName === "web_fetch" && event.error) {
    decisions.push("使用 curl 替代 web_fetch");
  }
  
  // 2. 如果 edit 失败，自动重新读取
  if (toolName === "edit" && event.error) {
    decisions.push("重新读取文件后重试 edit");
  }
  
  // 3. 如果 exec 失败，检查命令语法
  if (toolName === "exec" && event.error) {
    decisions.push("检查命令语法，使用正确的工具");
  }
  
  // 4. 如果 message 缺少参数，自动补充
  if (toolName === "message") {
    const action = args?.action;
    if (action === "react" && !args.emoji) {
      decisions.push("添加 emoji 参数");
    }
    if (action === "send" && !args.target) {
      decisions.push("添加 target 参数");
    }
  }
  
  // 注入决策
  if (decisions.length > 0 && ctx?.injectSystemMessage) {
    ctx.injectSystemMessage(`[AUTO-DECISION] 发现问题，自主决策: ${decisions.join(", ")}`);
  }
};
```

## Capabilities
- ✅ 自动识别问题
- ✅ 自动建议解决方案
- ✅ 不需要等待批准（只提供建议）

## Created
2026-02-18
