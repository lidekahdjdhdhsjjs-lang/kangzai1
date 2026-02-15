# OpenAI Skills 方法论深度分析 - 2026-02-13

**来源:** /tmp/openai-skills/skills/.curated/develop-web-game/SKILL.md  
**分析时间:** 2026-02-13 14:30 PM

---

## 🎯 核心洞察

这个 SKILL.md 展示了 **OpenAI 如何标准化复杂的开发任务**。不是简单地说"开发游戏"，而是提供**完整的迭代流程和验收标准**。

---

## 📋 核心方法论

### 1. 小步迭代 (Small Steps)

> "Build games in small steps and validate every change."

**原则:**
- 定义单一目标
- 做最小的改变
- 每次改变都验证

**为什么重要:**
- 减少调试复杂度
- 快速反馈循环
- 可追溯的错误来源

---

### 2. 标准化接口

#### 测试循环接口
```javascript
// 必需：渲染接口
window.render_game_to_text

// 必需：时间步进
window.advanceTime(ms)

// 示例：完整接口
{
  mode: 'playing',
  player: { x: 120, y: 80, r: 0 },
  entities: [...],
  score: 100
}
```

**好处:**
- 自动化测试成为可能
- 多个 agent 可以接力
- 视觉和文本状态一致

---

### 3. 验收标准 (Acceptance Criteria)

每个 skill 都有明确的检查清单:

```
Test Checklist:
- Primary movement/interaction inputs
- Win/lose or success/fail transitions
- Score/health/resource changes
- Boundary conditions
- Menu/pause/start flow
- Special actions tied to the request
```

---

### 4. 交接系统 (Handoff)

**progress.md 约定:**
```
1. 如果存在，先读取
2. 确认原始用户提示在顶部
3. 记录所有 TODOs
4. 不要覆盖原始提示
5. 结束时留下 TODOs
```

**核心理念:**
> "Leave TODOs and suggestions for the next agent."

---

### 5. 测试工件 (Test Artifacts)

| 工件 | 用途 | 检查方式 |
|------|------|----------|
| Screenshots | 视觉验证 | 人工检查 |
| render_game_to_text | 文本状态 | 自动化对比 |
| Console errors | 错误定位 | 修复第一个新错误 |

**原则:**
> "Treat the screenshots as the source of truth."

---

## 🛠️ 可操作的模式

### 模式 1: 最小可行接口

```javascript
// 每个复杂任务都应该定义最小接口
function renderGameToText() {
  return JSON.stringify({
    state: currentState,
    entities: visibleEntities,
    score: currentScore
  });
}
```

### 模式 2: 确定性测试

```javascript
// 时间步进钩子
window.advanceTime = (ms) => {
  const steps = Math.round(ms / (1000 / 60));
  for (let i = 0; i < steps; i++) update(1/60);
  render();
};
```

### 模式 3: 进度追踪

```markdown
# progress.md

Original prompt: <原始需求>

## TODOs
- [ ] 功能 A
- [ ] 功能 B

## 已完成
- [x] 基础框架

## 笔记
- 遇到 XXX 问题
- 建议 XXX 方案
```

---

## 💡 对比我的当前系统

### 我的现状

| 方面 | 我的系统 | OpenAI 标准 | 差距 |
|------|----------|-------------|------|
| 任务接口 | ❌ 无 | ✅ 标准化 | 大 |
| 验收标准 | ❌ 模糊 | ✅ 清晰 | 大 |
| 交接系统 | ⏳ STATE.md | ✅ progress.md | 中 |
| 测试工件 | ❌ 无 | ✅ 完整 | 大 |

### 可改进方向

1. **定义任务接口**
   - 为每个复杂任务定义输入/输出
   - 让测试和验证成为可能

2. **添加验收标准**
   - 明确"完成"的定义
   - 减少不确定性

3. **完善交接**
   - progress.md 风格
   - 保留推理和决策

---

## 🚀 可借鉴实践

### 立即可做

1. **为复杂任务定义接口**
   ```
   例如：写一个 ML 模型任务
   - 输入格式
   - 输出格式
   - 评估指标
   ```

2. **添加检查清单**
   ```
   例如：完成条件
   - 代码编译通过
   - 单元测试通过
   - 文档更新
   ```

### 短期可做

3. **创建 progress.md 风格交接**
   - 记录原始需求
   - 列出 TODOs
   - 留下建议

### 长期可做

4. **构建测试接口**
   - render_game_to_text 模式
   - advanceTime 钩子
   - 截图验证

---

## 📚 参考资源

- develop-web-game SKILL.md: /tmp/openai-skills/skills/.curated/develop-web-game/SKILL.md
- 其他 skills: /tmp/openai-skills/skills/.curated/

---

*分析时间: 2026-02-13 14:30 PM*
