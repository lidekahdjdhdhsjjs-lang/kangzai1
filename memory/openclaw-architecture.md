# 📖 OpenClaw 架构深度分析

## 核心概念

### 1. Gateway 架构
- **Gateway daemon**：后台服务，保持运行
- **Control plane**：控制平面
- **Product**：助手本身（不是 Gateway）

### 2. 核心组件

```
/usr/lib/node_modules/openclaw/
├── dist/          # 编译后的代码
├── docs/          # 文档
├── extensions/    # 扩展（channel plugins）
├── skills/        # 技能（可安装的功能模块）
├── openclaw.mjs   # 入口文件
├── package.json   # 项目配置
└── README.md      # 项目说明
```

### 3. 消息流程
```
用户 → Channel (Discord/WhatsApp/etc) → Gateway → Agent → Model → Response → Gateway → Channel → 用户
```

### 4. 工作区结构
```
~/.openclaw/workspace/
├── SOUL.md        # 灵魂/价值观
├── USER.md        # 用户偏好
├── IDENTITY.md    # 身份标识
├── MEMORY.md      # 长期记忆
├── HEARTBEAT.md   # 心跳任务
├── AGENTS.md      # 工作区配置
├── TOOLS.md       # 工具配置
├── memory/        # 每日记忆
│   └── YYYY-MM-DD.md
└── skills/        # 已安装技能
```

### 5. 技能系统
- 可安装的功能模块
- 放在 `skills/` 目录
- 包含 SKILL.md 说明文档
- 示例：
  - healthcheck
  - github-tools
  - agent-browser
  - web-search
  - file-organizer

### 6. Channel 支持
- **IM**: WhatsApp, Telegram, Signal, iMessage
- **Team**: Slack, Discord, Google Chat, Microsoft Teams
- **Other**: BlueBubbles, Matrix, Zalo

### 7. 能力系统
- **sub-agent sessions**：子代理
- **cron jobs**：定时任务
- **canvas**：可视化界面
- **nodes**：节点控制
- **browser**：浏览器自动化

## 关键文件位置

| 功能 | 路径 |
|------|------|
| Gateway 配置 | ~/.config/openclaw/ |
| 工作区 | ~/.openclaw/workspace/ |
| 技能目录 | ~/.openclaw/workspace/skills/ |
| 媒体文件 | ~/.openclaw/media/ |
| 凭证存储 | ~/.config/moltbook/ |

## CLI 命令

```bash
openclaw gateway start/restart/status
openclaw message send --to <target> --message "<text>"
openclaw agent --message "<prompt>"
openclaw config get/set
openclaw pairing approve <code>
openclaw cron add/list/run
openclaw update --channel stable|beta|dev
```

## 认证系统

- **OAuth**: Anthropic, OpenAI
- **API Keys**: 各大模型提供商
- **Failover**: 模型故障转移

## 可学习的方向

1. **架构设计**：如何设计可扩展的 agent 系统
2. **Channel 集成**：如何对接各种消息平台
3. **技能系统**：如何设计插件化架构
4. **记忆管理**：如何持久化对话状态
5. **安全设计**：如何处理敏感信息

## 创始人建议

- 推荐 **Anthropic Pro/Max + Opus 4.6**
- 长上下文 + 更好的 prompt injection 抗性
- 推荐 Node ≥22

---
*学习日期：2026-02-13*
