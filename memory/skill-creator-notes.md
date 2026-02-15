# 📖 关键技能深度学习笔记

## 1. Skill Creator - 技能创建指南

### 核心原则
1. **简洁为王** - 上下文窗口是公共资源，只添加 Claude 没有的信息
2. **适度自由** - 根据任务复杂度设置自由度（高/中/低）
3. **渐进披露** - 三层加载系统：metadata → SKILL.md → bundled resources

### 技能结构
```
skill-name/
├── SKILL.md (required)
│   ├── YAML frontmatter (name + description)
│   └── Markdown instructions
└── Bundled Resources (optional)
    ├── scripts/     # 可执行脚本
    ├── references/  # 参考文档
    └── assets/      # 资源文件
```

### 创建流程
1. 理解具体用例
2. 规划可复用内容
3. 初始化技能 (init_skill.py)
4. 编辑技能
5. 打包技能 (package_skill.py)
6. 迭代优化

### 对我们的价值
- ✅ 可以快速创建定制化技能
- ✅ 学习模块化设计思想
- ✅ 掌握渐进式上下文管理
- ✅ 建立标准化的技能开发流程

---
*学习时间：2026-02-13 03:00*
