# OpenAI Skills 核心模式总结 - 2026-02-13 晚

**来源:** /tmp/openai-skills/skills/.curated/  
**分析时间:** 2026-02-13 19:45 PM

---

## 🎯 OpenAI Skills 生态概览

**总计:** 32 个高质量 Skills  
**分类:**
- **.system/** - 系统级技能 (skill-installer, skill-creator)
- **.curated/** - 用户级技能 (32 个精选)

### 技能分类

| 类别 | Skills | 示例 |
|------|--------|------|
| 开发工具 | 5+ | develop-web-game, jupyter-notebook |
| 设计实现 | 2+ | figma, figma-implement-design |
| 云部署 | 3+ | cloudflare-deploy, netlify-deploy |
| 知识管理 | 4+ | notion-* (4 个) |
| GitHub | 2+ | gh-address-comments, gh-fix-ci |
| 文档 | 2+ | pdf, openai-docs |
| 其他 | 10+ | imagegen, linear, etc. |

---

## 🧠 三大核心模式

### 模式 1: 迭代验证循环

**代表:** `develop-web-game`

```
目标 → 实现 → 验证 → 调整 → 循环

核心原则:
1. 小步迭代 (Small Steps)
2. 每次改动都验证
3. 自动化测试 (Playwright)
4. 视觉 + 文本双重验证
5. 确定性时间步进
```

**关键接口:**
```javascript
// 必须实现
window.render_game_to_text()  // 状态输出
window.advanceTime(ms)        // 时间控制
```

**验收标准:**
- 截图对比 ✓
- 文本状态验证 ✓
- 错误检查 ✓
- 交互完整性 ✓

---

### 模式 2: 知识捕获系统

**代表:** `notion-knowledge-capture`

```
定义 → 定位 → 提取 → 创建 → 链接

核心原则:
1. 结构化捕获
2. 因果记录 ("because")
3. 模板化
4. 关系链接
5. 可发现性
```

**内容类型:**
- Decision (决策)
- How-to (教程)
- FAQ (问答)
- Documentation (文档)

**决策模板 (Decision Log):**
```markdown
# Context (为什么)
- 问题背景
- 面临的挑战

# Decision (做什么)
- 核心决策

# Rationale (为什么)
- 选择这个方案的理由
- 备选方案对比

# Consequences (影响)
- 正面影响
- 负面影响

# Implementation (怎么做)
- 实施步骤
- 时间线
- 负责人
```

---

### 模式 3: 外部集成工作流

**代表:** `figma-implement-design`

```
解析 → 获取 → 验证 → 生成 → 验证

核心原则:
1. 外部 API/MCP 集成
2. 上下文提取
3. Design Tokens 使用
4. 像素级验证
5. 错误恢复指导
```

**Figma 集成:**
```python
# 1. 解析 URL
fileKey, nodeId = parse_figma_url(url)

# 2. 获取上下文
context = get_design_context(fileKey, nodeId)

# 3. 提取规范
tokens = extract_design_tokens(context)
layout = extract_layout(context)

# 4. 生成代码
code = generate_component(tokens, layout)

# 5. 验证
screenshot = compare_design_vs_code(code)
```

---

## 📋 通用工作流模板

### 任何复杂任务

```
Step 0: 前置检查
  - 验证依赖可用
  - 检查配置
  - 错误恢复指南

Step 1: 解析输入
  - 提取关键参数
  - 标准化格式

Step 2: 获取上下文
  - 搜索/查询相关信息
  - 获取必要数据

Step 3: 处理/生成
  - 核心逻辑
  - 使用模板/规范

Step 4: 验证质量
  - 多维度检查
  - 截图/输出对比

Step 5: 迭代优化
  - 修复问题
  - 重新验证

Step 6: 输出/发布
  - 格式化输出
  - 添加元数据
```

---

## 🛠️ 最佳实践清单

### SKILL.md 结构

```yaml
---
name: "skill-name"
description: "简短描述 + 使用场景"
metadata:
  short-description: "一句话描述"
---

# Skill Title

## Overview
- 核心功能概述
- 适用场景

## Prerequisites
- 前置条件
- 依赖项

## Workflow
1. 步骤 1
2. 步骤 2
3. ...

## Examples
- 代码示例
- 使用示例

## References
- 相关文档
- 资源链接
```

### Agents 配置

```yaml
interface:
  display_name: "Skill Name"
  short_description: "简短描述"
  icon_small: "./assets/icon.svg"
  default_prompt: "默认提示词"

dependencies:
  tools:
    - type: "mcp"
      value: "service-name"
      url: "https://..."
```

### 目录结构

```
skill-name/
├── SKILL.md              # 必需：核心文档
├── agents/
│   └── openai.yaml       # Agent 配置
├── scripts/              # 支撑脚本
├── assets/               # 资源文件
├── references/           # 参考文档
│   ├── api.md
│   ├── patterns.md
│   └── gotchas.md
├── examples/             # 实践示例
├── evaluations/          # 评估测试
└── LICENSE.txt          # 许可证
```

---

## 💡 核心洞察

### 1. 标准化 > 灵活

OpenAI Skills 不追求"一个技能做所有事"，而是：
- 每个 skill 专注一件事
- 标准化输入/输出
- 可组合工作流

### 2. 验证是关键

没有验证的输出 = 半成品：
- 截图对比 (视觉)
- 文本验证 (逻辑)
- 错误检查 (质量)

### 3. 上下文是资产

- 捕获上下文
- 记录因果
- 链接关系
- 可发现性

### 4. 模板减少认知负担

- 复用已有模式
- 减少重复劳动
- 保证质量一致

---

## 🚀 可立即应用

### 1. 决策记录

每次重要决定，记录：
```markdown
## 决策: [标题]

### Context
- 为什么需要这个决定

### Decision
- 我决定...

### Rationale
- 因为... (至少 2 个理由)

### Alternatives Considered
- 方案 A: ... (被拒绝，因为...)
- 方案 B: ... (被接受，因为...)

### Next Steps
- [ ] 步骤 1
- [ ] 步骤 2

### Review Date
- [日期]
```

### 2. 验证清单

每个任务完成后：
- [ ] 代码/输出自检
- [ ] 文档更新
- [ ] 测试覆盖
- [ ] 错误处理

### 3. 知识捕获

每次重要对话后：
- [ ] 提取关键信息
- [ ] 记录决策和理由
- [ ] 识别行动项
- [ ] 结构化存储

---

## 📊 OpenAI Skills vs OpenClaw Skills

| 特性 | OpenAI | OpenClaw |
|------|--------|----------|
| SKILL.md | ✅ 标准格式 | ✅ |
| agents/ | ✅ 完整配置 | ❌ |
| scripts/ | ✅ 支撑脚本 | ❌ |
| assets/ | ✅ 图标资源 | ❌ |
| references/ | ✅ 详细文档 | ❌ |
| examples/ | ✅ 实践示例 | ❌ |
| evaluations/ | ✅ 测试覆盖 | ❌ |
| LICENSE | ✅ 许可证 | ❌ |

**结论:** OpenClaw 更简洁，OpenAI 更完整  
**建议:** 逐步完善 OpenClaw Skills

---

## 🔗 参考资源

- Skills 根目录: `/tmp/openai-skills/skills/`
- 系统技能: `/tmp/openai-skills/skills/.system/`
- 用户技能: `/tmp/openai-skills/skills/.curated/`

---

*分析时间: 2026-02-13 19:45 PM*
*上下文压缩后深度学习*
