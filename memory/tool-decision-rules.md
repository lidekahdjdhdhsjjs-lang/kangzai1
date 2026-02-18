# 工具决策规则 (Tool Decision Rules)

> 基于历史失败模式总结的智能决策树

## 1. Web 请求决策

```
IF 需要获取外部URL内容:
    IF URL需要认证 (Authorization, API key, cookie):
        → 使用 exec + curl + -H "Authorization: ..."
    ELSE IF URL是GitHub API:
        → 使用 exec + curl + https://api.github.com/...
    ELSE IF URL是公开页面:
        → 优先使用 web_search (Brave API)
        → 备选: exec + curl
    END
    
    避免: web_fetch (SECURITY NOTICE 错误率高)
END
```

## 2. 命令执行决策

```
IF 需要执行命令 (exec):
    IF 命令包含 "pip ":
        → 改为 "python3 -m pip"
    ELSE IF 命令包含 "pip3 ":
        → 改为 "python3 -m pip"
    ELSE IF 命令需要sudo:
        → 添加 elevated: true 参数
    END
    
    总是检查: 命令路径是否完整
END
```

## 3. 文件编辑决策

```
IF 需要编辑文件 (edit):
    # 先读取验证
    步骤1: read 文件获取最新内容
    步骤2: 验证 oldText 是否存在
    步骤3: 如不存在，重新定位新文本
    
    技巧:
    - 使用更长的上下文避免重复
    - 包含换行符和缩进
    - 编辑后立即验证
END
```

## 4. 消息发送决策

```
IF 需要发送消息 (message):
    IF action = "react":
        → 必须包含 target 参数 (messageId)
    IF action = "send":
        → 必须包含 channel 参数
    IF 是回复:
        → 包含 replyTo 参数
END
```

## 5. Cron Job 决策

```
IF 需要创建新cron:
    IF 功能类似现有任务:
        → 合并到现有任务
    ELSE IF 任务可合并:
        → 合并到相近时间任务
    ELSE:
        → 检查是否真的必要
END
```

## 快速参考表

| 场景 | 推荐工具 | 备选工具 |
|------|---------|---------|
| 公开网页 | web_search | exec+curl |
| 认证API | exec+curl -H | - |
| GitHub | exec+curl api. | gh CLI |
| pip安装 | python3 -m pip | - |
| 文件编辑 | read→edit验证 | write重写 |
| 反应消息 | 必须加target | - |
