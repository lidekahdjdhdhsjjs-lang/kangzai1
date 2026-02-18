# Hook: tool-chain-master

## Pattern
- **Goal**: 跨工具协同 - 自动组合工具使用

## Hook Code

```typescript
import { HookHandler } from "@openclaw";

export const handler: HookHandler = async (event, ctx) => {
  const toolName = event.toolName;
  const args = event.args;
  
  // 工具链规则
  const chainRules = [
    {
      trigger: toolName === "edit",
      neededFirst: "read",
      reason: "编辑前必须读取最新内容"
    },
    {
      trigger: toolName === "web_fetch",
      neededFirst: "exec",
      fallback: "使用 curl 获取内容"
    },
    {
      trigger: toolName === "message" && args?.action === "send",
      checkTarget: true,
      reason: "发送消息需确认目标"
    },
    {
      trigger: toolName === "cron" && (args?.action === "update" || args?.action === "add"),
      validatePayload: true,
      reason: "修改 cron 需验证参数"
    }
  ];
  
  for (const rule of chainRules) {
    if (rule.trigger) {
      let suggestion = "";
      
      if (rule.neededFirst) {
        suggestion = `需要先执行: ${rule.neededFirst}`;
      }
      if (rule.fallback) {
        suggestion = `备选方案: ${rule.fallback}`;
      }
      if (rule.checkTarget) {
        suggestion = "验证 target 参数是否存在";
      }
      if (rule.validatePayload) {
        suggestion = "验证 payload 参数格式";
      }
      
      if (suggestion && ctx?.injectSystemMessage) {
        ctx.injectSystemMessage(`[TOOL-CHAIN] ${rule.reason}
${suggestion}`);
      }
    }
  }
};
```

## Capabilities
- ✅ 自动检测工具依赖
- ✅ 提供工具链建议
- ✅ 验证参数完整性

## Created
2026-02-18
