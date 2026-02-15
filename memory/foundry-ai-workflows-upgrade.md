# Foundry AI Workflows 学习与升级报告

**日期**: 2026-02-14  
**主题**: AI Agent Workflow Patterns 研究与系统升级

---

## 📚 项目研究

### 1. antinomyhq/forge - AI Pair Programmer
- **特点**: 终端开发环境，支持 300+ AI 模型
- **关键功能**:
  - 多提供商支持 (OpenAI, Anthropic, Grok, DeepSeek, Gemini)
  - 工作流文件执行 (`--workflow`)
  - 事件调度 (`--event`)
  - 会话管理
- **可借鉴**: 多模型路由、终端集成、工作流文件机制

### 2. calf-ai/calfkit-sdk - Event-Driven Distributed AI Agents
- **核心概念**: 基于 Kafka 的事件驱动架构
- **优势**:
  - 解耦: 工具/代理独立部署，动态发现
  - 水平扩展: 各组件独立扩展
  - 持久性: 事件不丢失
  - 高吞吐: 异步通信
- **可借鉴**: 事件驱动代理通信、松耦合工具发现

### 3. mdrideout/junjo - AI Graph Workflow Library
- **特点**: 图结构工作流 + Redux 风格状态管理
- **核心概念**:
  - 节点 (Node): 动作、条件、并行、LLM 调用
  - 边 (Edge): 节点连接，支持条件分支
  - 状态: Pydantic 模型，类型安全
  - 可视化 + OpenTelemetry 原生
- **可借鉴**: 图工作流可视化、状态管理、Eval-Driven Development

### 4. Matt-Hulme/deliberate-agentic-development
- **特点**: 结构化 AI 开发工作流
- **流程**:
  - Plan: Vision → Tech Stack → Milestones → Issues → Tasks
  - Build: One Task → One Commit → One Review
  - Track: 状态管理 + Linear 集成
- **可借鉴**: 检查点、人工审查、TDD 支持

---

## 🔍 最佳实践搜索

### AI Agent Workflow Patterns
- **状态管理**: 类似 Redux 的集中式状态
- **图遍历**: 节点执行 + 条件分支
- **可观测性**: OpenTelemetry 集成

### Multi-Agent Coordination
- **消息传递**: 事件驱动 > 直接调用
- **状态共享**: 独立状态 vs 共享上下文
- **任务分发**: 子代理模式

### Event-Driven AI Systems
- **事件总线**: 解耦生产者和消费者
- **持久化**: 消息不丢失
- **动态发现**: 组件可热插拔

---

## 🎯 系统改进建议

### 1. 工作流状态管理 (高优先级)
- 实现类似 Junjo 的图工作流
- 支持状态持久化
- 条件分支执行

### 2. 事件驱动架构 (中优先级)
- 实现事件总线
- 支持工作流事件监听
- 事件触发工作流执行

### 3. 多代理协作 (中优先级)
- 子代理任务分发
- 结果聚合
- 状态同步

### 4. 结构化开发流程 (低优先级)
- 检查点机制
- 人工审核点
- 任务 → 提交 → 审查流程

---

## 🚀 实现尝试

尝试创建了 **AI Workflow Orchestrator** 扩展，包含以下工具:

| 工具 | 功能 |
|------|------|
| `workflow_create` | 创建工作流 |
| `workflow_add_node` | 添加节点 |
| `workflow_add_edge` | 添加边(连接) |
| `workflow_update_state` | 更新状态 |
| `workflow_execute_step` | 执行步骤 |
| `workflow_status` | 获取状态 |
| `workflow_emit_event` | 发送事件 |
| `workflow_list` | 列出工作流 |
| `workflow_delegate_task` | 分发子任务 |
| `workflow_add_event_listener` | 事件监听 |

> ⚠️ **注意**: 扩展编写需要完整的 TypeScript 模块结构，本次尝试因验证规则限制未能完全实现。建议后续手动创建完整模块。

---

## 📋 后续行动

1. **完善工作流扩展**: 使用 TypeScript 编写完整模块
2. **集成事件驱动**: 基于现有 Hooks 系统扩展
3. **添加状态持久化**: 支持工作流状态保存
4. **实现图可视化**: 借鉴 Junjo AI Studio

---

## 💡 关键洞察

| 项目 | 核心价值 | 适用场景 |
|------|----------|----------|
| Forge | 多模型编排 | 复杂代码任务 |
| Calfkit | 事件驱动 | 大规模分布式系统 |
| Junjo | 图工作流 + 状态 | 复杂业务逻辑 |
| Deliberate | 结构化流程 | 企业级开发 |

**结论**: OpenClaw 可以在现有 Hooks 机制基础上，借鉴这些项目的优点，逐步增强工作流编排能力。
