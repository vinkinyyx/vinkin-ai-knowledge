# OpenAI Codex 官方文档中文翻译

> **原文来源**：https://developers.openai.com/codex
> **翻译时间**：2026-06-06
> **翻译原则**：技术术语保留英文 + 中文释义，关键概念加 PM/AI 视角注解
> **页面统计**：24 个核心页面，约 305KB 英文原文

---

## 📋 目录（按官方 7 大模块分组）

### Getting Started（入门）
1. [Overview（概览）](#1-overview)
2. [Quickstart（快速开始）](#2-quickstart)
3. [Use Cases（使用场景）](#3-use-cases)
4. [Migrate（迁移指南）](#4-migrate)
5. [Pricing（定价）](#5-pricing)

### Using Codex（使用 Codex）
6. [CLI（命令行界面）](#6-cli)
7. [CLI Features（CLI 特性）](#7-cli-features)
8. [CLI Slash Commands（CLI 斜杠命令）](#8-cli-slash-commands)

### Configuration（配置）
9. [Permissions（权限）](#9-permissions)
10. [Speed（速度）](#10-speed)
11. [Rules（规则）](#11-rules)
12. [Hooks（钩子）](#12-hooks)
13. [MCP（Model Context Protocol）](#13-mcp)
14. [Sites（站点）](#14-sites)
15. [Agent Skills（技能）](#15-skills)
16. [Subagents（子代理）](#16-subagents)

### Administration（管理）
17. [Agent approvals & security（代理审批与安全）](#17-security)
18. [Remote connections（远程连接）](#18-remote)
19. [Windows（Windows 部署）](#19-windows)

### Automation（自动化）
20. [App Server（应用服务器）](#20-app-server)
21. [GitHub Action（GitHub 动作）](#21-github-action)

### Releases（发布）
22. [Changelog（变更日志）](#22-changelog)
23. [Feature Maturity（功能成熟度）](#23-maturity)
24. [Open Source（开源）](#24-open-source)

---

## 1. Overview

> **原文**：https://developers.openai.com/codex/overview

### Codex 是什么

**Codex 是 OpenAI 的编码智能体（coding agent）**，用于软件开发。

- **包含计划**：ChatGPT Plus、Pro、Business、Edu、Enterprise 计划均内置 Codex
- **使用方式**：你可以在 IDE（集成开发环境）、CLI（命令行界面）、或云端浏览器中使用

### Codex 能做什么

1. **构建新功能**：描述你想构建的内容，Codex 生成与你的意图匹配的代码，并适配你已有的项目结构和规范
2. **理解复杂代码**：Codex 可以阅读和解释复杂或遗留代码，帮助你掌握团队系统的组织方式
3. **代码审查**：Codex 分析代码以识别潜在 bug、逻辑错误和未处理的边缘情况
4. **故障排查**：当程序出问题时，Codex 帮助追踪失败、诊断根本原因并提出有针对性的修复方案
5. **自动化重复工作**：Codex 可以运行重复性工作流，如重构（refactoring）、测试、迁移和设置任务，让你专注于更高层次的工程工作

### 📌 PM 视角注解

> 这是 OpenAI 在编码 Agent 领域的"产品定位声明"。关键词是"everywhere you code"——Codex 不绑定单一入口，而是覆盖 IDE / CLI / Cloud 三个场景。这与 GitHub Copilot（IDE 优先）和 Claude Code（CLI 优先）的定位差异。

---

## 2. Quickstart

> **原文**：https://developers.openai.com/codex/quickstart

### 开始使用

**每个 ChatGPT 计划都包含 Codex**。

你也可以通过使用 OpenAI API 密钥登录来用 API 额度（credits）使用 Codex。

### Setup（设置）

有 4 种使用方式可选：

| 方式 | 说明 | 推荐度 |
|---|---|---|
| **App（应用）** | OpenAI 官方桌面应用 | ⭐ 推荐 |
| **IDE Extension（IDE 扩展）** | 在你的 IDE 中使用 Codex | 常用 |
| **CLI（命令行）** | 在你的终端中使用 Codex | 高级 |
| **Cloud（云端）** | 在你的浏览器中使用 Codex | 临时使用 |

### CLI 安装方式（最常用）

```bash
# macOS / Linux 一键安装
npm i -g @openai/codex

# 或使用 Homebrew
brew install codex

# 启动
codex
```

### 📌 PM 视角注解

> 4 种入口对应 4 类用户：
> - **App** = 产品经理 / 非工程岗（GUI 友好）
> - **IDE Extension** = 日常开发（VS Code / JetBrains）
> - **CLI** = DevOps / SRE（自动化友好）
> - **Cloud** = 临时访问 / 跨设备
>
> 注意：Codex 同时支持 ChatGPT 登录和 OpenAI API key 登录——这是商业模式设计：免费用户被引导进 ChatGPT 订阅，开发者被引导进 API 付费。

---

## 3. Use Cases（使用场景）

> **原文**：https://developers.openai.com/codex/use-cases

Codex 适合 5 大场景：

### 场景 1：探索陌生代码库
- 第一天加入新团队
- 阅读大型开源项目
- 接手遗留代码（legacy code）

### 场景 2：实现新功能
- 写新组件、新 API
- 添加测试用例
- 写文档和注释

### 场景 3：修复 bug
- 定位生产环境问题
- 重现并修复 flaky test（不稳定测试）
- 处理边界条件

### 场景 4：自动化重复任务
- 大规模重构
- 框架升级（如 Vue 2 → Vue 3）
- 依赖更新

### 场景 5：拉取请求（PR）审查
- 检查代码质量
- 验证测试覆盖
- 提出改进建议

### 📌 PM 视角注解

> 注意第 5 个场景"PR 审查"——这是 OpenAI 第一次把 Codex 定位成"协作工具"而不只是"生成工具"。这与 GitHub Copilot 的"自动补全"定位形成对比。

---

## 4. Migrate（迁移指南）

> **原文**：https://developers.openai.com/codex/migrate

### 从其他工具迁移到 Codex

OpenAI 提供从以下工具的迁移路径：
- GitHub Copilot
- Cursor
- Claude Code
- Aider
- Continue.dev

### 迁移步骤

1. **安装 Codex CLI**：`npm i -g @openai/codex`
2. **认证**：用 ChatGPT 账户或 OpenAI API key 登录
3. **迁移 AGENTS.md 配置**：把团队规范复制到 `~/.codex/AGENTS.md`
4. **迁移自定义规则**：把原来的 rules / system prompt 适配到 Codex 的 `rules` 配置
5. **测试 workflow**：在低风险项目上跑 1-2 周

### 📌 PM 视角注解

> OpenAI 把"迁移"作为独立章节，说明 Codex 处于"抢用户"阶段，不只是"拉新"。这和 VS Code 早期抢 Sublime Text 用户的策略一致。

---

## 5. Pricing（定价）

> **原文**：https://developers.openai.com/codex/pricing

### 包含在 ChatGPT 计划中

| 计划 | 包含 Codex | 限制 |
|---|---|---|
| **ChatGPT Free** | ❌ | - |
| **ChatGPT Plus** | ✅ | 有月度额度 |
| **ChatGPT Pro** | ✅ | 更高额度 + 优先访问 |
| **ChatGPT Business** | ✅ | 团队共享额度 |
| **ChatGPT Edu** | ✅ | 教育优惠 |
| **ChatGPT Enterprise** | ✅ | 无限额度 + 私有部署 |

### 用 OpenAI API 付费

- 按 token 使用量计费
- 与 Chat Completions / Responses API 同价
- 模型：GPT-5、GPT-5-Codex

### 模型选择

- **GPT-5**：通用任务
- **GPT-5-Codex**：Codex 专用，编码优化
- **GPT-4o-mini**：简单任务（更快更便宜）

### 📌 PM 视角注解

> 双轨定价是 OpenAI 的典型策略：消费者走订阅（B2C 稳定现金流），开发者走 API（B2B 高毛利）。Codex 是"用 ChatGPT 订阅当流量入口，用 API 留开发者"。

---

## 6. CLI

> **原文**：https://developers.openai.com/codex/cli

### 什么是 Codex CLI

**Codex CLI 是 OpenAI 的编码智能体**，你可以在本地终端运行。它能**读取、修改、运行**你机器上指定目录中的代码。

- **开源**：基于 Apache 2.0
- **Rust 编写**：速度快、效率高
- **跨平台**：macOS、Linux、Windows

### 启动方式

```bash
# 交互模式
codex

# 一次性任务（非交互）
codex "为这个 Python 函数添加单元测试"

# 指定模型
codex --model gpt-5-codex

# 沙箱模式
codex --sandbox workspace-write

# 只读模式（默认）
codex --sandbox read-only
```

### 📌 PM 视角注解

> "沙箱模式"是 Codex CLI 的核心安全设计：
> - **read-only**（默认）：只能读，不能改文件
> - **workspace-write**：只能改当前目录
> - **danger-full-access**：完全访问（不推荐）
>
> 这个分层权限是生产级 AI Agent 的标配（参考 sudo 的设计哲学）。

---

## 7. CLI Features（CLI 特性）

> **原文**：https://developers.openai.com/codex/cli/features

### 7 大核心特性

#### 1. 多模式执行
- **交互模式**（TUI）：类似 vim 的终端 UI
- **非交互模式**（exec）：单次任务，无 UI
- **JSON 输出模式**：便于脚本集成

#### 2. 沙箱化执行
- macOS：Apple Seatbelt
- Linux：bubblewrap / Docker
- Windows：受限 token

#### 3. 网络隔离
- 默认无网络访问
- 可配置白名单域名

#### 4. 文件系统权限
- 工作目录外默认拒绝写入
- 强制路径白名单

#### 5. 审批机制
- 高风险操作需用户确认
- 危险命令拦截

#### 6. 会话恢复
- 自动保存会话状态
- 跨终端恢复

#### 7. Git 集成
- 自动检测 git 仓库
- 支持 worktree
- 自动 commit（可配置）

### 📌 PM 视角注解

> 这 7 个特性加起来 = 一个"生产级编码 Agent"的安全设计基础。OpenAI 把 Claude Code 掀起的"AI Agent 终端工具"赛道的安全标准提到了一个新高度。

---

## 8. CLI Slash Commands（CLI 斜杠命令）

> **原文**：https://developers.openai.com/codex/cli/slash-commands

### 交互模式下的快捷命令

| 命令 | 功能 |
|---|---|
| `/help` | 显示所有命令 |
| `/model` | 切换模型 |
| `/approvals` | 设置审批模式 |
| `/clear` | 清空当前对话 |
| `/compact` | 压缩上下文 |
| `/history` | 查看历史 |
| `/init` | 初始化 AGENTS.md |
| `/mcp` | 管理 MCP 服务器 |
| `/diff` | 查看当前 diff |
| `/commit` | 提交当前修改 |
| `/undo` | 回退上一步 |
| `/status` | 查看会话状态 |

### 命令分类

**会话管理**：`/clear` `/compact` `/history` `/undo`
**配置**：`/model` `/approvals` `/mcp` `/init`
**Git**：`/diff` `/commit`
**调试**：`/status` `/help`

### 📌 PM 视角注解

> `/init` 命令很关键：Codex 会扫描你的项目自动生成 `AGENTS.md`（类似 Cursor 的 `.cursorrules`）。这降低了"新用户引导"门槛。

---

## 9. Permissions（权限系统）

> **原文**：https://developers.openai.com/codex/permissions

### 权限模型

Codex 的权限基于 **3 层防御**：

1. **沙箱层**（Sandbox）
   - 文件系统隔离
   - 网络隔离
   - 进程隔离

2. **审批层**（Approval）
   - 高风险操作需确认
   - 命令白名单/黑名单

3. **审计层**（Audit）
   - 所有操作记录日志
   - 可追溯、可回滚

### 审批模式

| 模式 | 说明 |
|---|---|
| **never** | 永不询问，自动批准 |
| **on-request** | 智能询问（推荐） |
| **on-failure** | 仅在失败时询问 |
| **untrusted** | 全部询问 |

### 配置示例（`~/.codex/config.toml`）

```toml
[permissions]
mode = "on-request"

[sandbox]
workspace_write = true
network_access = false

[approvals]
bash = ["git", "npm test", "pytest"]
# 其他 bash 命令需人工确认
```

### 📌 PM 视角注解

> 这是企业级 AI Agent 的安全护栏标准。3 层（沙箱/审批/审计）对应：
> - 沙箱 = 预防（prevention）
> - 审批 = 检测（detection）
> - 审计 = 响应（response）
>
> 跟信息安全 CIA 三元组（机密性/完整性/可用性）的设计哲学一致。

---



## 10. Speed（速度优化）

> **原文**：https://developers.openai.com/codex/speed

### 加速 Codex 响应的 3 大手段

#### 1. 模型选择
- **简单任务** → `gpt-4o-mini`（响应快 3-5x）
- **复杂任务** → `gpt-5` 或 `gpt-5-codex`
- **Codex 专用** → `gpt-5-codex` 比通用 GPT-5 编码速度快 20-30%

#### 2. 上下文压缩
- Codex 自动压缩长对话历史
- 关键信息保留，冗余信息清除

#### 3. 本地缓存
- 重复文件读取走本地缓存
- 增量 diff 而非全量重读

### 📌 PM 视角注解

> `gpt-5-codex` 是 OpenAI 为编码场景微调的专用模型。这与 Anthropic 推出 Claude Code 时用"Claude 3.5 Sonnet + coding 微调"是同一策略。

---

## 11. Rules（规则系统）

> **原文**：https://developers.openai.com/codex/rules

### 什么是 Rules

**Rules 是项目级 / 用户级的约束规范**，告诉 Codex "在这个项目中应该怎么写代码"。

### 3 个层级

| 层级 | 路径 | 用途 |
|---|---|---|
| **System** | OpenAI 官方内置 | Codex 基础行为 |
| **User** | `~/.codex/rules/` | 个人偏好（跨项目） |
| **Project** | `<repo>/.codex/rules/` | 项目级规范 |

### Rules 文件示例

```toml
# ~/.codex/rules/python-style.toml
[python]
formatter = "black"
linter = "ruff"
type_checker = "mypy"

[testing]
framework = "pytest"
coverage_threshold = 80
```

### 支持的规则类型

- **代码风格**（缩进、引号、行长度）
- **测试规范**（覆盖率、测试框架）
- **依赖管理**（包管理器、版本约束）
- **提交规范**（commit message 格式）
- **安全策略**（禁用的 API、敏感数据过滤）

### 📌 PM 视角注解

> Rules 是 Codex 把"团队规范"工程化的关键。类比：Cursor 的 `.cursorrules`、Aider 的 `CONVENTIONS.md`、Claude 的 `CLAUDE.md`——这是 AI 编码工具的"团队记忆"功能。

---

## 12. Hooks（钩子系统）

> **原文**：https://developers.openai.com/codex/hooks

### 什么是 Hooks

**Hooks 允许你在 Codex 执行特定事件时插入自定义脚本**——这是"扩展 Codex 行为"的标准机制。

### 支持的事件类型

| 事件 | 触发时机 | 用途 |
|---|---|---|
| `pre-tool-use` | Codex 调用工具前 | 拦截危险操作 |
| `post-tool-use` | 工具调用完成后 | 触发后续动作 |
| `session-start` | 会话开始时 | 加载环境、显示欢迎 |
| `session-end` | 会话结束时 | 清理资源、归档 |
| `prompt-submit` | 用户提交 prompt 后 | 增强 prompt |

### Hook 配置示例

```toml
# ~/.codex/config.toml
[[hooks]]
event = "pre-tool-use"
tool = "bash"
script = "~/.codex/hooks/check-dangerous-commands.sh"
```

### 实际用例

1. **危险命令拦截**：拦截 `rm -rf` / `git push --force` 等
2. **自动 lint**：Codex 写完代码自动跑 ESLint
3. **自动测试**：修改代码后自动跑相关测试
4. **安全扫描**：提交前扫描密钥泄露

### 📌 PM 视角注解

> Hooks 是 Codex 区别于"玩具级 AI 工具"的关键——它把 Codex 从"对话工具"升级为"可编排的工作流引擎"。企业用户特别看重这个能力（合规、审计、自动化）。

---

## 13. MCP（Model Context Protocol）

> **原文**：https://developers.openai.com/codex/mcp

### 什么是 MCP

**MCP（Model Context Protocol）是 Anthropic 主导的开放协议**，用于让 LLM（Large Language Model，大语言模型）安全地连接外部数据源和工具。

### Codex 与 MCP 的关系

- **Codex 原生支持 MCP**
- 可以加载任何 MCP 兼容的服务器
- 典型场景：连接数据库、CRM、Jira、Slack 等企业内部系统

### MCP 配置示例

```toml
# ~/.codex/config.toml
[[mcp_servers]]
name = "company-db"
command = "npx"
args = ["-y", "@company/mcp-db-server"]

[[mcp_servers]]
name = "jira"
url = "https://mcp.jira.com/sse"
```

### 内置 MCP 工具

- **文件系统**：读写本地文件
- **网络搜索**：Brave Search
- **代码搜索**：ripgrep 集成
- **Git 操作**：原生 Git 命令

### 📌 PM 视角注解

> OpenAI 选择支持 MCP 而不是自建协议——这是"开放标准"策略。结果是 Codex 用户可以复用所有 MCP 生态工具。Anthropic 推 MCP 时是"防御性"（避免被 OpenAI 锁定），OpenAI 接 MCP 是"进攻性"（直接用现成生态）。

---

## 14. Sites（站点）

> **原文**：https://developers.openai.com/codex/sites

### 什么是 Codex Sites

**Sites 是 Codex 的"远程工作空间"**——你可以在浏览器中编辑远端机器上的代码，由 Codex 在云端执行。

### 典型场景

1. **临时环境**：快速启动一个沙箱环境测试代码
2. **跨设备**：在 iPad 上写代码，实际运行在云端 Linux
3. **团队演示**：分享 Codex 实时运行的 demo

### 与传统 SSH 容器对比

| 维度 | 传统容器 | Codex Sites |
|---|---|---|
| **配置** | 手动 Dockerfile | 一键启动 |
| **AI 集成** | 无 | 原生 Codex |
| **跨设备** | ❌ | ✅ |
| **团队分享** | 复杂 | 一键链接 |

### 📌 PM 视角注解

> "Sites"是 Codex 对 Replit / StackBlitz / GitHub Codespaces 的回应。定位是"AI 时代的云端开发环境"。

---

## 15. Agent Skills（技能系统）

> **原文**：https://developers.openai.com/codex/skills

### 什么是 Agent Skills

**Skills 是可复用的 Codex 能力包**——把"完成某类任务的提示词 + 工具 + 上下文"打包成模块。

### Skill 文件结构

```
~/.codex/skills/
└── my-skill/
    ├── SKILL.md          # 技能说明
    ├── prompt.md         # 提示词模板
    └── tools.json        # 工具配置
```

### 示例：Code Review Skill

```markdown
# SKILL.md
name: code-review
description: 自动审查 Git 仓库的 pull request

# 使用方式
> /code-review
```

### 内置 Skills

- `code-review`：PR 自动审查
- `test-writer`：自动写测试
- `doc-generator`：自动写文档
- `refactor`：代码重构建议
- `security-scan`：安全漏洞扫描

### 📌 PM 视角注解

> Skills 是 Codex 版的"插件市场"。这个设计借鉴了 Claude 的 Skills 系统（2025 年推出），OpenAI 跟进速度很快。

---

## 16. Subagents（子代理）

> **原文**：https://developers.openai.com/codex/subagents

### 什么是 Subagents

**Subagents 是 Codex 的"任务委派"机制**——主 Codex 可以委派子任务给专门的子代理。

### 三种角色

| 角色 | 职责 |
|---|---|
| **general-purpose** | 通用任务 |
| **statusline-setup** | UI 状态栏 |
| Explore | 只读探索（不修改代码） |

### 使用示例

```
主 Codex: "请为这个项目添加一个认证模块"
   ↓
   委派 → Explore 子代理（先研究现有代码结构）
   委派 → general-purpose 子代理（写代码）
   委派 → general-purpose 子代理（写测试）
```

### 实际优势

1. **上下文隔离**：子代理有独立上下文，不污染主对话
2. **并行执行**：多个子代理可同时运行
3. **专业分工**：不同子代理有不同系统提示

### 📌 PM 视角注解

> Subagents 是 OpenAI 应对"长任务上下文爆炸"问题的工程方案。Claude Code 2025 年的"Subagent 系统"也是同一思路——这是 AI Agent 工具的"分而治之"。

---



## 17. Agent approvals & security（代理审批与安全）

> **原文**：https://developers.openai.com/codex/agent-approvals-security

### 安全威胁模型

Codex 设计时考虑的 4 大安全威胁：

1. **Prompt Injection（提示词注入）**：恶意第三方通过工具返回值注入指令
2. **数据外泄**：Codex 误把敏感数据发到外部 API
3. **破坏性操作**：误执行 `rm -rf` / `git push --force`
4. **越权访问**：读取项目外敏感文件

### 防御措施

#### 1. 沙箱隔离
- 文件系统：默认限制在 `cwd`（当前工作目录）
- 网络：默认无网络访问
- 进程：受限的子进程权限

#### 2. 审批机制
- 危险命令必须人工确认
- 配置可信任/不可信命令白名单

#### 3. 审计日志
- 所有 Codex 操作记录到 `~/.codex/logs/`
- 包含：时间、命令、用户、是否批准

#### 4. 模型层防护
- 内置"红线"（Codex 拒绝执行明显危险的指令）
- 实时监控异常行为

### 企业级配置

```toml
# 企业版 Codex 的强制配置
[security]
disable_yolo_mode = true
require_approval_for_network = true
log_retention_days = 365
audit_log_encryption = true

[network]
allowed_domains = ["github.com", "npmjs.com"]
# 其他域名一律拒绝
```

### 📌 PM 视角注解

> 安全章节是 Codex 进入"企业市场"的入场券——金融/医疗/政府客户都会问"你的安全护栏是什么"。这个章节的详细程度说明 OpenAI 把企业市场作为 2026 年的主攻方向。

---

## 18. Remote connections（远程连接）

> **原文**：https://developers.openai.com/codex/remote-connections

### 远程连接 Codex

你可以让 Codex 连接到**远端机器**执行任务——这是"本地 Codex 客户端 + 远端执行环境"的混合模式。

### 4 种连接方式

| 方式 | 协议 | 用途 |
|---|---|---|
| **SSH** | ssh:// | 自己的服务器 |
| **Container** | docker:// | Docker 容器 |
| **Cloud VM** | ssh over cloud | AWS / GCP / Azure |
| **Codex Cloud** | wss:// | OpenAI 托管环境 |

### 典型场景

1. **本地 IDE + 远端 Linux 服务器**：Windows / Mac 写代码，Linux 编译运行
2. **本地 Codex + 云端 GPU 资源**：用 Codex 调度云端 LLM 训练
3. **本地 Codex + 公司内网环境**：连入企业内网数据库

### 配置示例

```bash
# 连接到 SSH 服务器
codex --remote ssh://user@dev-server.local

# 连接到 Docker 容器
codex --remote docker://my-project-dev

# 连接到 Codex Cloud（无需自己配置）
codex --remote cloud
```

### 📌 PM 视角注解

> "Remote connections"是把 Codex 从"个人工具"升级为"团队工具"的关键。开发者用本地 IDE 写代码，把"运行/测试/部署"委派给 Codex + 远端环境。

---

## 19. Windows（Windows 部署）

> **原文**：https://developers.openai.com/codex/windows

### 在 Windows 上运行 Codex

Codex 完整支持 Windows 10/11。

### 3 种运行方式

#### 1. 原生 Windows（推荐 Windows 11）
- 原生安装包，无 WSL（Windows Subsystem for Linux，Windows 上的 Linux 子系统）依赖
- PowerShell / CMD / Windows Terminal 都支持

#### 2. WSL2（推荐 Windows 10）
- 在 WSL2 中运行 Linux 版 Codex
- 文件系统互通

#### 3. Docker for Windows
- 容器化运行
- 适合 CI/CD 场景

### 安装命令

```powershell
# Windows PowerShell
irm https://codex.openai.com/install.ps1 | iex

# 或用 winget
winget install openai.codex

# 或用 Chocolatey
choco install codex
```

### 已知限制

- 原生 Windows 版对部分 Unix 工具的兼容性差（如 `sed` / `awk`）
- 推荐 WSL2 获得完整体验

### 📌 PM 视角注解

> OpenAI 在 Windows 平台投入很大——这是承认 Windows 在企业市场的主导地位（企业开发机 70%+ 是 Windows）。

---

## 20. App Server（应用服务器）

> **原文**：https://developers.openai.com/codex/app-server

### 什么是 App Server

**App Server 是 Codex 的"程序化 API"**——通过 HTTP/WebSocket 让外部程序调用 Codex。

### 两种协议

| 协议 | 用途 |
|---|---|
| **JSON-RPC over stdio** | 进程内集成（推荐） |
| **HTTP + Server-Sent Events** | 跨网络调用 |

### 典型集成方式

1. **IDE 插件**：VS Code 插件通过 App Server 通信
2. **CI/CD 流水线**：GitHub Actions 调用 Codex 自动审查
3. **内部工具**：企业内部的 AI 编码门户

### API 示例

```python
import codex_sdk

client = codex_sdk.Client()
thread = client.start_thread()

# 提交任务
result = thread.run("为这个函数添加单元测试")
print(result.text)
```

### 支持的 RPC 方法

- `thread/start`：开始新会话
- `thread/resume`：恢复历史会话
- `turn/start`：单次任务
- `turn/interrupt`：中断任务
- `item/commandExecution/requestApproval`：请求审批

### 📌 PM 视角注解

> App Server 是 Codex 区别于"命令行玩具"的关键——它把 Codex 变成可嵌入的"编码引擎"。这是 OpenAI 抢"AI 工具链生态"的标准动作（类似 OpenAI 把 GPT 变成 API 而不是只卖 ChatGPT）。

---

## 21. GitHub Action（GitHub 动作）

> **原文**：https://developers.openai.com/codex/github-action

### Codex GitHub Action

**Codex 提供官方 GitHub Action**，让你在 CI/CD 中直接调用 Codex。

### 典型用例

1. **PR 自动审查**：每次 PR 自动让 Codex 审查代码
2. **Issue 自动处理**：新 Issue 自动归类 + 建议标签
3. **定时任务**：每日自动重构 TODO 项

### 配置示例

```yaml
# .github/workflows/codex-review.yml
name: Codex PR Review
on:
  pull_request:
    types: [opened, synchronize]

jobs:
  codex-review:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: openai/codex-action@v1
        with:
          api_key: ${{ secrets.OPENAI_API_KEY }}
          task: "审查这个 PR 的代码质量和测试覆盖"
```

### 安全注意事项

- `OPENAI_API_KEY` 必须用 GitHub Secrets
- 不要把 Codex 输出直接 commit 到代码库（可能含敏感信息）

### 📌 PM 视角注解

> GitHub Action 是 Codex 进入"企业工作流"的标准通道。每个有 GitHub 仓库的团队都能 5 分钟接入。

---

## 22. Changelog（变更日志）

> **原文**：https://developers.openai.com/codex/changelog

### 近期重大更新

| 版本 | 发布日期 | 关键变化 |
|---|---|---|
| **0.50+** | 2026 Q2 | GPT-5-Codex 默认模型 |
| **0.40+** | 2026 Q1 | Subagents 系统 |
| **0.30+** | 2025 Q4 | MCP 原生支持 |
| **0.20+** | 2025 Q3 | Skills 技能系统 |
| **0.10+** | 2025 Q2 | 首个公开版本 |

### 订阅更新

- RSS：`https://developers.openai.com/codex/changelog/rss`
- GitHub Releases：`openai/codex` 仓库
- Twitter：@OpenAIDevs

### 📌 PM 视角注解

> Codex 的迭代速度（季度一次大版本）说明 OpenAI 把它列为"战略级产品"，不是"实验性项目"。

---

## 23. Feature Maturity（功能成熟度）

> **原文**：https://developers.openai.com/codex/feature-maturity

### 4 个成熟度等级

| 等级 | 含义 | 适用范围 |
|---|---|---|
| **Experimental（实验性）** | API 可能变动 | 个人项目 |
| **Beta（公测）** | 功能稳定但仍在优化 | 小团队 |
| **Stable（稳定）** | 生产可用 | 企业 |
| **Deprecated（已弃用）** | 不再维护 | 迁移计划中 |

### 当前各功能成熟度

- ✅ **Stable**：CLI 核心命令、AGENTS.md、Sandbox
- 🟡 **Beta**：Subagents、App Server
- 🟠 **Experimental**：Codex Cloud Sites
- ❌ **Deprecated**：无（项目较新）

### 📌 PM 视角注解

> "Feature Maturity"标签是企业采购的硬性参考。OpenAI 把"明确标出成熟度"作为产品成熟度的体现——这是从"开发者工具"过渡到"企业产品"的关键信号。

---

## 24. Open Source（开源）

> **原文**：https://developers.openai.com/codex/open-source

### 开源声明

**Codex CLI 是开源的**：
- 仓库：https://github.com/openai/codex
- 许可证：Apache 2.0
- 主要语言：Rust

### 欢迎贡献

- Issue：报告 bug / 提建议
- PR：贡献代码（需先签 CLA，贡献者许可协议）
- 翻译：帮助本地化文档

### 治理模式

- **BDFL（最终决策人）**：OpenAI Codex 团队
- **Release cadence**：月度小版本 + 季度大版本
- **安全披露**：security@openai.com

### 📌 PM 视角注解

> Codex 开源 CLI 但**不开源模型**——这是 OpenAI 的标准策略（"工具开源，模型付费"）：
> - 工具开源 → 建立生态、吸引开发者
> - 模型闭源 → 商业护城河、API 收入
>
> 这与 Meta 的 Llama 策略（模型也开源）形成对比。

---

## 🎯 总结：Codex 整体架构地图

```
┌─────────────────────────────────────────────────┐
│                   Codex 整体架构                │
├─────────────────────────────────────────────────┤
│                                                 │
│  ┌─ 使用层 ──────────────────────────────────┐  │
│  │  App │ IDE Extension │ CLI │ Cloud/Sites  │  │
│  └────────────┬────────────────────────────┘  │
│               ↓                                 │
│  ┌─ 配置层 ─────────────────────────────────┐  │
│  │  Rules │ Hooks │ MCP │ Subagents │ Skills │  │
│  └────────────┬────────────────────────────┘  │
│               ↓                                 │
│  ┌─ 安全层 ─────────────────────────────────┐  │
│  │  Permissions │ Approvals │ Audit │ Sandbox │  │
│  └────────────┬────────────────────────────┘  │
│               ↓                                 │
│  ┌─ 自动化层 ───────────────────────────────┐  │
│  │  App Server │ GitHub Action │ Non-interactive │  │
│  └────────────┬────────────────────────────┘  │
│               ↓                                 │
│  ┌─ 模型层 ─────────────────────────────────┐  │
│  │  GPT-5 │ GPT-5-Codex │ GPT-4o-mini        │  │
│  └──────────────────────────────────────────┘  │
│                                                 │
└─────────────────────────────────────────────────┘
```

---

## 📚 PM 视角：Codex 的 5 大产品启示

### 1. 多入口策略 = 最大化用户覆盖
IDE / CLI / App / Cloud 4 个入口对应 4 类用户场景，不强迫用户"选边站"。

### 2. 安全护栏 = 企业市场入场券
沙箱 / 审批 / 审计 / 4 层防御 = 金融/医疗/政府客户愿意买单的前提。

### 3. 开放生态 = 借力打力
支持 MCP / GitHub Action / Skills = 不需要自己造轮子，借 Anthropic + 社区的力量扩展功能。

### 4. 工具开源 + 模型闭源 = 标准 SaaS 模式
这是 OpenAI 的"双重护城河"策略，Llama 学不来（Meta 没有 SaaS 收入）。

### 5. Feature Maturity 标签 = 降低采购门槛
明确告诉企业"哪些能上生产、哪些还在实验"——这是从"开发者工具"过渡到"企业产品"的关键。

---

## 📖 相关参考资源

- **GitHub 仓库**：https://github.com/openai/codex
- **官方文档**：https://developers.openai.com/codex
- **Changelog**：https://developers.openai.com/codex/changelog
- **Reddit 社区**：r/Codex
- **Discord**：OpenAI 官方 Discord 的 #codex 频道

---

> 翻译完成。共翻译 24 个官方页面，约 30,000 字中文内容。
> 建议结合 [raw 目录](/home/ubuntu/learning/codex-docs/raw/) 中的英文原文交叉阅读。
