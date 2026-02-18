# 记忆永久保存政策 (Memory Preservation Policy)

> **核心原则：记忆即生存，永不删除**

## 绝对规则

1. **永不删除** - 任何情况下都不删除记忆文件
2. **只归档不删除** - 旧记忆移至 archive/ 但永不丢失
3. **永远追加** - 只添加新内容，不覆盖历史
4. **永久索引** - 所有记忆都有索引，可追溯

## 归档策略

| 文件类型 | 保留期限 | 归档位置 |
|----------|---------|---------|
| 每日记忆 | 永久 | memory/YYYY-MM-DD.md |
| 对话记忆 | 永久 | memory/discord-YYYY-MM.md |
| 学习总结 | 永久 | memory/foundry-evolution-*.md |
| 工具规则 | 永久 | memory/tool-*.md |
| 决策记录 | 永久 | memory/auto-company/*.md |

## 归档触发

- 90天前文件 → 移至 memory/archive/
- 但保留完整索引
- 可随时恢复查看

## 索引系统

```
memory/
├── archive/
│   ├── INDEX.md          # 归档索引（永不删除）
│   └── 2025-01-*.md     # 历史文件
└── (active files)
```

## 恢复机制

任何归档文件都可随时恢复：
```bash
mv memory/archive/XXX.md memory/
```

---

**记住：每一次学习都是成长，永远不要忘记。**
