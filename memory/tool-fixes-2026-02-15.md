# 工具失败修复方案

## 1. exec 工具 (77%)

### 问题分析
- **主要错误**: `Command exited with code N`, `pip: command not found`
- **原因**: 
  - pip 模块不存在
  - 命令执行环境缺少依赖
  - 执行超时或权限问题

### 解决方案

#### 1.1 使用替代命令
```bash
# 用 python3 -m pip 代替 pip
python3 -m pip install httpx

# 检查可用的包管理器
which pip3 || which python3
```

#### 1.2 使用 curl 代替需要 pip 的操作
```bash
# 用 curl 直接调用 API
curl -s -X POST "https://api.example.com" -d '{"query": "test"}'
```

#### 1.3 预检查命令可用性
```bash
# 在执行前检查命令是否存在
command -v pip || python3 -m pip --version
```

---

## 2. web_fetch 工具 (69%)

### 问题分析
- **主要错误**: `401 Unauthorized`, `SECURITY NOTICE: external content`
- **原因**:
  - API 需要认证头 (Bearer token)
  - web_fetch 不支持自定义 Authorization header
  - 目标站点返回 401

### 解决方案

#### 2.1 使用 curl 代替需要认证的请求
```bash
# 添加认证头
curl -H "Authorization: Bearer $API_KEY" "https://api.example.com"
```

#### 2.2 公开端点优先
- 优先使用不需要认证的公开 API
- 例如: 天气数据、公开 RSS 源

#### 2.3 浏览器工具备选
- 对于需要登录的页面，使用 browser 工具
- browser 可以保持登录状态

---

## 3. 通用重试策略

### 模式1: 工具降级
```
primary_tool (web_fetch) → fallback_tool (curl exec)
primary_tool (exec pip) → fallback_tool (python3 -m pip)
```

### 模式2: 预检查
```
执行前检查命令存在性 → 执行 → 失败则用备选
```

### 模式3: 错误识别
```
识别错误类型:
- 401/403 → 需要认证 → 用 curl + header
- 404 → 资源不存在 → 检查 URL
- 500+ → 服务端错误 → 重试/等待
- timeout → 网络问题 → 重试
```

---

## 实施检查清单

- [x] 分析失败模式
- [x] 识别根本原因
- [ ] 创建自动化处理 hook (tool_result_hook)
- [ ] 记录到工具知识库
- [ ] 测试修复效果

---
*修复日期: 2026-02-15*
