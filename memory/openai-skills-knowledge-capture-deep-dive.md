# OpenAI Skills 深度分析 - 知识捕获与设计实现 - 2026-02-13 晚

**来源:** /tmp/openai-skills/skills/.curated/  
**分析时间:** 2026-02-13 19:30 PM

---

## 🎯 核心洞察

深入分析 OpenAI Skills 生态系统后，发现两个极具代表性的 skills：

1. **notion-knowledge-capture** - 知识捕获系统
2. **figma-implement-design** - 设计实现工作流

它们展示了 **AI Agent 如何处理复杂的、多步骤的专业工作流**。

---

## 📚 案例 1: Notion Knowledge Capture

**路径:** `skills/.curated/notion-knowledge-capture/`

### 架构概览

```
notion-knowledge-capture/
├── SKILL.md                    # 核心文档
├── agents/
│   └── openai.yaml            # Agent 配置
├── assets/                     # 图标资源
├── evaluations/                # 评估测试
├── examples/                   # 实践示例
│   ├── conversation-to-faq.md
│   ├── decision-capture.md
│   └── how-to-guide.md
├── reference/                  # 数据库模板
│   ├── team-wiki-database.md
│   ├── how-to-guide-database.md
│   ├── faq-database.md
│   ├── decision-log-database.md
│   └── documentation-database.md
└── LICENSE.txt
```

### 核心工作流 (5 步)

#### Step 1: 定义捕获目标
```
- 询问目的、受众、新鲜度
- 确定内容类型：
  • decision (决策)
  • how-to (教程)
  • FAQ (问答)
  • concept/wiki (概念)
  • documentation (文档)
```

#### Step 2: 定位目标数据库
```
- 使用 reference/*-database.md 指南
- 确认必需属性：
  • title, tags, owner
  • status, date, relations
- 多候选时询问用户
```

#### Step 3: 提取和结构化
```
- 提取事实、决策、行动、理由
- 决策: 记录备选方案、理由、结果
- 教程: 捕获步骤、前置条件、链接、边缘案例
- FAQ: Q&A 格式，简洁答案 + 深度链接
```

#### Step 4: 创建/更新 Notion
```
- 使用 notion-create-pages
- 设置属性: title, tags, owner, status, dates
- 使用 reference/ 模板结构化内容
- 如果更新现有页面: fetch → edit
```

#### Step 5: 链接和曝光
```
- 添加关系/反向链接到 hub pages
- 添加摘要/changelog
- 创建后续任务并链接
```

### 决策捕获示例 (Decision Log)

**数据库 Schema:**

| Property | Type | Purpose |
|----------|------|---------|
| Decision | title | What was decided |
| Date | date | When made |
| Status | select | Proposed/Accepted/Superseded |
| Domain | select | Architecture/Product/Business |
| Impact | select | High/Medium/Low |
| Deciders | people | Who made it |
| Stakeholders | people | Who's affected |

**完整决策记录模板:**

```markdown
# 决策标题

## Context (背景)
为什么需要这个决策

## Decision (决策)
做了什么决策

## Rationale (理由)
为什么选择这个方案

## Options Considered (备选方案)
- Option A: 方案A
  - Pros: 优点
  - Cons: 缺点
  - Decision: Rejected/Accepted
  
- Option B: 方案B
  ...

## Consequences (后果)
Positive: 正面影响
Negative: 负面影响

## Implementation (实施计划)
1. 步骤1
2. 步骤2
Timeline: 时间线
Owner: 负责人

## Success Metrics
- 指标1
- 指标2
```

### 决策捕获实战

**用户请求**: "Document our decision to move from REST to GraphQL API"

**提取的决策**:
- **Decision**: Migrate customer-facing API from REST to GraphQL
- **Context**: 50+ REST endpoints, inconsistent patterns
- **Rationale**: Better client experience, type safety
- **Alternatives**: Keep REST, gRPC, GraphQL
- **Status**: Accepted

**为什么这个有价值**:
1. **因果记录** - "because" 句子模式
2. **备选方案** - 展示权衡过程
3. **可追溯** - 链接到相关决策
4. **可执行** - 清晰的实施计划

---

## 🎨 案例 2: Figma Implement Design

**路径:** `skills/.curated/figma-implement-design/`

### 工作流概览

```
Figma URL → Extract Node ID → Fetch Design Context → 
Implement Code → Verify Fidelity → Deploy
```

### 6 步核心流程

#### Step 0: 设置 Figma MCP
```
1. codex mcp add figma --url https://mcp.figma.com/mcp
2. codex --enable rmcp_client
3. codex mcp login figma
```

#### Step 1: 解析 Node ID
**URL 格式**: `https://figma.com/design/:fileKey/:fileName?node-id=1-2`

**提取**:
- fileKey: `:fileKey` (design/ 后的段)
- nodeId: `1-2` (node-id 参数)

#### Step 2: 获取设计上下文
```python
get_design_context(fileKey=":fileKey", nodeId="1-2")
```

**返回结构**:
- Layout properties (Auto Layout, constraints)
- Typography specifications
- Color values & design tokens
- Component structure & variants
- Spacing & padding

#### Step 3: 验证设计系统
```
- 检查项目是否有 design tokens
- 识别组件变体
- 确认响应式规则
- 验证可访问性要求
```

#### Step 4: 生成代码
```
- 使用设计 token 而非硬编码值
- 1:1 实现视觉保真度
- 遵循项目代码规范
- 添加必要的注释
```

#### Step 5: 验证和迭代
```
- 截图对比
- 测量像素差异
- 修复偏差
- 重新验证
```

### 设计 Token 示例

```javascript
// design-tokens.json
{
  "colors": {
    "primary": "#0066FF",
    "secondary": "#6B7280",
    "success": "#10B981",
    "error": "#EF4444"
  },
  "spacing": {
    "xs": "4px",
    "sm": "8px",
    "md": "16px",
    "lg": "24px",
    "xl": "32px"
  },
  "typography": {
    "h1": { "size": "32px", "weight": "700" },
    "body": { "size": "16px", "weight": "400" }
  }
}
```

---

## 🔧 对比分析

### 共同模式

| 方面 | Notion Capture | Figma Implement |
|------|----------------|-----------------|
| **工作流长度** | 5 步 | 6 步 |
| **外部集成** | Notion API | Figma MCP |
| **上下文获取** | 搜索 + fetch | get_design_context |
| **质量验证** | 链接 + discoverability | 截图 + pixel 测量 |
| **迭代机制** | 更新现有页面 | 修复 + 重新验证 |

### 关键成功因素

1. **清晰的步骤边界**
   - 每步有明确的输入/输出
   - 不允许跳过步骤

2. **错误处理**
   - MCP 失败时暂停并指导
   - 提供恢复指令

3. **验证机制**
   - Notion: 链接和曝光
   - Figma: 像素级对比

4. **模板化**
   - Notion: 数据库 schema + content 模板
   - Figma: design tokens + 代码规范

---

## 💡 可借鉴的最佳实践

### 1. 决策记录 (Decision Log)

**立即可做**:
```markdown
# 我的决策记录模板

## 问题
- 描述当前面临的问题

## 决策
- 我决定...

## 理由
- 因为...

## 备选方案
- 方案 A: ... (被拒绝，原因...)
- 方案 B: ... (被接受，原因...)

## 下一步
- 行动 1
- 行动 2

## 验证方式
- 如何知道是否正确？
```

### 2. 知识捕获检查清单

**每次重要对话后**:
- [ ] 提取关键决策
- [ ] 记录理由 ("because")
- [ ] 识别行动项
- [ ] 指定负责人
- [ ] 设置截止日期
- [ ] 链接到相关上下文

### 3. 设计实现验证

**代码实现后**:
- [ ] 对比设计截图
- [ ] 验证 design tokens
- [ ] 检查响应式行为
- [ ] 验证可访问性
- [ ] 测量像素差异

---

## 🚀 下一步行动

### 短期 (今天)

1. **采用决策记录模板**
   - 在 STATE.md 中添加决策记录
   - 每次重要决定都记录

2. **改进知识捕获**
   - 为复杂任务创建结构化文档
   - 记录因果关系

### 中期 (本周)

3. **构建验证机制**
   - 为我的任务添加检查清单
   - 实施迭代验证

4. **标准化模板**
   - 创建常用的文档模板
   - 应用于所有重要工作

### 长期 (本月)

5. **完善知识库**
   - 将所有重要文档结构化
   - 建立链接关系
   - 实现可发现性

---

## 📂 参考资源

- Notion Knowledge Capture: `/tmp/openai-skills/skills/.curated/notion-knowledge-capture/`
- Figma Implement Design: `/tmp/openai-skills/skills/.curated/figma-implement-design/`
- 决策模板: `reference/decision-log-database.md`
- 实践示例: `examples/decision-capture.md`

---

*分析时间: 2026-02-13 19:30 PM*
*上下文压缩后深度学习*
