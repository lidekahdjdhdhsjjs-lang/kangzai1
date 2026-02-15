# Foundry 学习: AI Agent 工作流最佳实践

## 时间
- 2026-02-15 09:55

## 来源
- 用户分享的参考资料（3张截图）
- OpenClaw 官方文档

---

## 核心概念学习

### 1. 双模型协作模式
从截图中学习到的模式：

| 角色 | 模型 | 职责 |
|------|------|------|
| 调度员 | 4o-mini | 快速决策、任务分解 |
| 开发者 | Claude Sonnet 4 | 深度思考、代码生成 |

**工作流**:
```
思考 (Think) → 搜索 (Search) → 执行 (Execute) → 验证 (Validate)
```

### 2. 动态记忆架构
- **不是静态 RAG**：动态更新上下文
- **认知架构**：模拟人类记忆方式
- **分层记忆**:
  - 短期记忆 (Session)
  - 长期记忆 (MEMORY.md)
  - 每日日志 (memory/YYYY-MM-DD.md)

### 3. 提示词链结构
```
System Prompt → Context Injection → Task Decomposition
```

### 4. Auto Evolve 模式
- 自动化自我进化
- 持续学习和优化

---

## 可借鉴的改进

1. **双模型协作**: 考虑在复杂任务中使用 MiniMax-M2.5 + MiniMax-M2.1 组合
2. **工作流标准化**: 建立标准的思考 → 搜索 → 执行 → 验证流程
3. **动态记忆**: 不依赖静态 RAG，而是动态更新上下文
4. **Memory Seeker & Manager**: 分离记忆寻找者和管理者角色

---

## 现有系统的对应

| 概念 | 当前实现 |
|------|----------|
| 双模型协作 | Cron jobs 使用不同模型 |
| 动态记忆 | memory/ + MEMORY.md |
| 提示词链 | SOUL.md + AGENTS.md |
| Auto Evolve | foundry-overseer + foundry-infinite-evolution |

---

*持续学习，进化不止*
