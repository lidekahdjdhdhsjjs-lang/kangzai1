# OpenClaw Skills 知识库

## 📚 已学习 Skills (5/5 完成!)

### 1. healthcheck 🔐 (主机安全)
**路径:** `/usr/lib/node_modules/openclaw/skills/healthcheck/SKILL.md`

**用途:** 主机安全加固和风险评估

**核心命令:**
```bash
openclaw security audit [--deep]
openclaw security audit --fix
openclaw update status
openclaw cron add|list|runs
```

**关键原则:**
- 所有更改需用户明确批准
- 优先可逆、分阶段的更改
- 不修改远程访问设置而不确认
- 记录所有命令和文件修改

**适用场景:**
- 安全审计
- 防火墙/SSH/更新加固
- 风险评估
- 定期检查调度

---

### 2. github-tools 🐙 (GitHub 管理)
**路径:** `/root/.openclaw/workspace/skills/github-tools/SKILL.md`

**用途:** GitHub 仓库管理、克隆、提交、PR、Issues

**代理配置 (中国大陆):**
```bash
# 全局代理
git config --global http.proxy "http://127.0.0.1:7899"
git config --global https.proxy "http://127.0.0.1:7899"
```

**常用命令:**
```bash
# 克隆
git clone https://github.com/user/repo.git

# 浅克隆 (快速)
git clone --depth 1

# 创建提交
git add .
git commit -m "message"
git push

# GitHub CLI
gh repo clone user/repo
gh issue list
gh pr create
```

---

### 3. agent-browser 🌐 (浏览器自动化)
**路径:** `/root/.openclaw/workspace/skills/agent-browser/SKILL.md`

**用途:** 网页自动化、表单填写、截图、内容抓取

**启动:**
```bash
openclaw browser start
```

**核心操作:**
```bash
# 导航
openclaw browser navigate "https://example.com"

# 截图
openclaw browser screenshot

# 执行 JS
openclaw browser evaluate "document.title"

# 填写表单
openclaw browser fill "#email" "user@example.com"

# 点击元素
openclaw browser click "#submit-btn"
```

**浏览器配置:**
- `openclaw`: 隔离浏览器 (推荐)
- `chrome`: 使用现有 Chrome + 扩展中继

---

### 4. tmux 🧵 (远程会话控制)
**路径:** `/usr/lib/node_modules/openclaw/skills/tmux/SKILL.md`

**用途:** 远程控制 tmux 会话，发送按键和抓取输出

**核心概念:**
- **Socket 模式**: 使用隔离的 socket 而非系统级 tmux
- **Pane 目标**: `session:window.pane` 格式
- **安全发送**: 文本和 Enter 分开发送 (Claude Code/Codex TUI)

**常用命令:**
```bash
# 创建隔离 socket
SOCKET_DIR="${OPENCLAW_TMUX_SOCKET_DIR:-/tmp/openclaw-tmux-sockets}"
SOCKET="$SOCKET_DIR/openclaw.sock"

# 新建会话
tmux -S "$SOCKET" new -d -s "session-name" -n shell

# 发送命令 (TUI apps 需要分开 Enter)
tmux -S "$SOCKET" send-keys -t "session-name" -l -- "$cmd" && sleep 0.1
tmux -S "$SOCKET" send-keys -t "session-name" Enter

# 捕获输出
tmux -S "$SOCKET" capture-pane -p -J -t "session-name":0.0 -S -200

# 等待特定文本
{baseDir}/scripts/wait-for-text.sh -t session:0.0 -p 'pattern' -T 20

# 清理
tmux -S "$SOCKET" kill-server
```

**Orchestrating Agents:**
```bash
# 并行运行多个 agents
for i in 1 2 3; do
  tmux -S "$SOCKET" new-session -d -s "agent-$i"
done

# 在不同工作目录运行
tmux -S "$SOCKET" send-keys -t agent-1 "cd /tmp/project1 && codex --yolo 'Fix bug'" Enter
```

**限制:**
- 仅支持 macOS/Linux
- 需要 tmux 在 PATH 中

---

### 5. file-organizer 📁 (文件整理)
**路径:** `/root/.openclaw/workspace/skills/file-organizer/SKILL.md`

**用途:** 按类型、日期或自定义规则整理文件

**核心命令:**

**按类型:**
```bash
# 按扩展名整理
mkdir -p docs/{pdf,docx,txt}
mv *.pdf docs/pdf/
mv *.docx docs/docx/
```

**按日期:**
```bash
# 创建日期文件夹并排序
for f in *.jpg; do
  date=$(date -r "$f" +%Y-%m-%d)
  mkdir -p "$date"
  mv "$f" "$date/"
done
```

**批量重命名:**
```bash
# 添加日期前缀
for f in *.*; do
  mv "$f" "$(date +%Y%m%d)_$f"
done
```

**最佳实践:**
- 移动前先预览
- 使用 `--dry-run` (如果支持)
- 保留原始备份直到验证

---

## 📋 待学习 Skills

**全部已完成!** ✅

---

## 🛠️ Skills 架构理解

### Skills 工作流程
1. **读取 SKILL.md** - 理解用途和使用场景
2. **使用工具** - 按照 SKILL.md 指南执行
3. **遵循约束** - 每个 skill 都有特定限制
4. **用户批准** - 重要操作需要用户确认

### 最佳实践
- ✅ 仔细阅读 SKILL.md 再执行
- ✅ 遵循安全规则 (特别是 healthcheck)
- ✅ 配置正确的代理 (github-tools)
- ✅ 使用隔离浏览器 (agent-browser)
- ✅ 使用 socket 模式 (tmux)
- ❌ 不发明命令或标志
- ❌ 不修改关键设置而不确认

---

## 🔗 资源

- OpenClaw Docs: `/usr/lib/node_modules/openclaw/docs/`
- Skills 目录: `/usr/lib/node_modules/openclaw/skills/`
- Skills Hub: https://clawhub.com

---

*创建时间: 2026-02-13 09:20*
*最后更新: 2026-02-13 10:45*
