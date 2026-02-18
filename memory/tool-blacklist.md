# 工具使用黑名单 (Tool Blacklist)

> 永远不删除的记忆 - 记录工具使用禁忌

## 禁止使用 (Do Not Use)

| 工具 | 原因 | 替代方案 |
|------|------|---------|
| **web_fetch** | 64% 失败率 (SECURITY NOTICE) | exec + curl |

## 不推荐使用 (Use With Caution)

| 工具 | 场景 | 建议 |
|------|------|------|
| edit | 精确匹配易失败 | 先 read 再 edit |
| message react | 需精确 target | 检查参数完整性 |

## 强制替换规则

```
IF 需要请求外部URL:
    IF 原计划使用 web_fetch:
        → 立即替换为: exec + curl
        → 禁止使用 web_fetch
END
```

## 记忆原则
- ✅ 永远不删除
- ✅ 只追加新规则
- ✅ 持续更新优化
