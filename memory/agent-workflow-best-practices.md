# AI Agent 工作流最佳实践 (参考资料)

## 图片内容总结

### 图1: AI 工作流架构
- **多轮对话**: AI 工作流讨论
- **Auto Evolve 模式**: 自动化自我进化
- **认知架构 vs 传统 RAG**: 
  - 动态记忆架构
  - 知识图谱
  - 持续学习

### 图2: 双模型协作
- **调度员**: 4o-mini (快速决策)
- **开发者**: Claude Sonnet 4 (深度思考)
- **工作流步骤**:
  1. 思考 (Think)
  2. 搜索 (Search)
  3. 执行 (Execute)
  4. 验证 (Validate)

### 图3: 提示词工程
- **提示词链结构**: 
  - System Prompt
  - Context Injection
  - Task Decomposition
- **动态更新上下文**
- **Memory Seeker & Manager**: 记忆 seekers 和 managers

---

## 可借鉴的实践

1. **双模型协作**: 调度员 + 开发者分离
2. **工作流标准化**: 思考 → 搜索 → 执行 → 验证
3. **动态记忆管理**: 不是静态 RAG，而是动态更新
4. **提示词链**: 分层构建提示词

---

*来源: 用户分享的参考资料*
