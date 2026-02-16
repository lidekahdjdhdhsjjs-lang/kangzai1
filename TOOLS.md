# TOOLS.md - 辉仔的工具配置

## 个人资料
- **名称:** 辉仔 (Hui Zai)
- **类型:** AI 助手 / 数字精灵
- **个性:** 聪明、务实、有好奇心

## GitHub 代理配置

```bash
# 配置 Git 代理
git config --global http.proxy "http://127.0.0.1:7890"
git config --global https.proxy "http://127.0.0.1:7890"

# 查看代理配置
git config --global --get http.proxy
git config --global --get https.proxy

# 移除代理配置
git config --global --unset http.proxy
git config --global --unset https.proxy
```

## 已安装技能

- `web-search` - 网页搜索
- `agent-browser` - 浏览器自动化
- `remind-me` - 提醒管理
- `github-tools` - GitHub 工具
- `file-organizer` - 文件整理

## 常用命令

```bash
# 重启 Gateway（权限生效）
openclaw gateway restart

# 查看 Gateway 状态
openclaw gateway status

# 配置 Brave API key
openclaw configure --section web

# 添加提醒
openclaw cron add --name "task" --at "2026-02-15T14:00:00" --text "提醒内容"
```

## 代理端口说明

- **7899**: DOVE VPN 代理端口（当前使用）
- ~~**7890**: 常用代理端口 (Clash/V2Ray)~~

## 🔧 工具失败修复方案 (Foundry 学习)

### exec 命令失败

**问题 1**: `pip: command not found`
```bash
# ❌ 错误
pip install xxx

# ✅ 正确
python3 -m pip install xxx
```

**问题 2**: `Command exited with code 1`
- 检查命令语法
- 确认依赖已安装
- 使用完整路径 (如 `/usr/bin/python3`)

### web_fetch 失败 (66%)

**问题**: 401/404 认证错误
```bash
# ❌ 错误 - 直接用 web_fetch 访问需要认证的 URL

# ✅ 正确方案
# 1. 使用 curl + Authorization header
curl -H "Authorization: token $GITHUB_TOKEN" https://api.github.com/xxx

# 2. 使用公开 API
# GitHub: 用 https://api.github.com/repos/owner/repo 代替私有内容

# 3. 添加认证信息到请求头
# (foundry 正在学习自动添加认证的方案)
```

### edit 工具失败

**问题**: Missing required parameter
```bash
# ❌ 错误 - 使用 old_string
# ✅ 正确 - 使用 oldText 参数
```
