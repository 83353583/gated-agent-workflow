# Gated Agent Workflow

一套面向 **AI 全程开发** 的门禁式工作流：先定范围与步骤，再分步实现；每步必须验收、硬停，并产出可复制的下一 Agent 接力包（Handoff），以控制成本、降低幻觉，并缓解长会话自动压缩上下文带来的失真。

不绑定单一 IDE。核心是中立 Markdown Playbook；**全局 Skill 负责省事，项目内文档负责稳定与跨 Agent。**

## 两种用法（怎么选）

| 你想要 | 推荐做法 |
|--------|----------|
| **只在当前项目**用这套流程 | 把 Playbook/模板 **复制进项目**（或跑 scaffold 脚本） |
| **以后每个新项目**都想用 | 安装 **全局 Skill**；Agent 判定要用时，会先问一句再写入 `docs/ai-workflow/` |

```text
全局 Skill（Cursor / Claude 等「技能」机制）
    ↓ 首次在某项目启用（确认后 scaffold）
项目内 docs/ai-workflow/ + AGENTS.md   ← 真正的跨工具真相
    ↓
任意 Agent（Copilot / Codex / Windsurf / 其他）都能读同一套文档
```

### 能不能适配别的 Agent？

**能，但分两层：**

| 层 | 适配方式 | 说明 |
|----|----------|------|
| **全局 Skill** | Cursor：`~/.cursor/skills`；Claude：`~/.claude/skills` | 各产品自己的机制，**不能**装一次就通吃所有 IDE |
| **项目内文档** | `docs/ai-workflow/` + `AGENTS.md` | **跨 Agent 通用**：没有 Skill 的工具只要 `@PLAYBOOK` 或读 `AGENTS.md` 即可 |

推荐习惯：用 Cursor/Claude 的全局 Skill 省事；**第一次启用时写入项目**。之后换 Copilot、Codex 等，不依赖 Skill 也能继续同一套门禁流。

---

## 快速开始

### A. 仅当前项目（复制 / scaffold）

```bash
# 在本仓库根目录执行；参数为你的目标项目路径
bash scripts/scaffold-into-project.sh /path/to/your-project
```

或手动拷贝 `PLAYBOOK.md` + `templates/` → 目标项目 `docs/ai-workflow/`，并合并根目录 [`AGENTS.md`](./AGENTS.md)。

然后对 Agent 说：

- 「按 Gated Agent Workflow 执行 **新项目启动**」
- 「按 Gated Agent Workflow 执行 **变更单**」

### B. 全局 Skill（推荐给「以后都用」）

```bash
# Cursor
bash scripts/install-cursor-global.sh

# Claude Code（默认 ~/.claude/skills；路径不同则挪文件夹）
bash scripts/install-claude-global.sh
```

会把 [`skills/gated-agent-workflow/`](./skills/gated-agent-workflow/) 连同 `PLAYBOOK.md`、`templates/` 装到对应全局目录。

安装后新开 Agent 对话。当你说「用门禁流程开这个项目 / 初始化门禁工作流」时，Skill 应：

1. 若项目还没有 `docs/ai-workflow/` → **先确认再 scaffold**
2. 再按 Bootstrap 或变更单执行

口令示例：

- `初始化门禁工作流`
- `需求讨论` / `Discover` / `范围可冻结`
- `按 Gated Agent Workflow 新项目启动`
- `走变更单 / 只读勘察`
- `只做当前 Handoff，硬停并输出下一份`

### 从零开一个项目，能简化到什么程度？

全局 Skill 装好后，你日常可以说成：

```text
1. 建空项目目录（或让 Agent 建）
2. 「初始化门禁工作流」
3. 「我要做 ___，先需求讨论」→ 聊到你说「范围可冻结」
4. 确认 SCOPE + 步骤表
5. 按每份 Handoff 开新对话往下做
```

不必手写长流程说明，也不必开干前写完细设计。  
**建议保留的最少门禁：** Discover 冻结 → SCOPE → 分步实现（验收 + Handoff 硬停）。

### 开干前的整体规划，要用强模型吗？

**推荐用中高 / 高档**，不要为了省钱在规划阶段用最弱模型：

| 阶段 | 建议档位 | 原因 |
|------|----------|------|
| Discover / SCOPE / 步骤表拆解 / 选型冻结 | **中高或高** | 拆歪范围或步骤，后面每步都会放大成本 |
| 常规实现步 | 步骤表写的默认档（多为中） | 主战场用中档控成本 |
| 样板 CRUD、文案、文档同步 | 低 | 便宜即可 |

省成本的正确姿势是：**规划短而强，实现按表选档**——不是全程高，也不是全程低。细节见 [`PLAYBOOK.md`](./PLAYBOOK.md) §4。

---

## 解决什么问题

| 痛点 | 本仓库做法 |
|------|------------|
| 一次让 AI 做太大，上下文膨胀 / 幻觉扩散 | 垂直小步 + 人工门禁 |
| 长会话被自动摘要，早期约束丢失 | **每步硬停**，新开 Agent，只粘贴 Handoff |
| 高强模型全程使用成本高 | 规划用中高/高；实现按步骤表选档（见下方说明） |
| 维护期仍走「从零大讨论」 | 独立 **变更流**：先只读勘察，再最小改动 |
| 流程绑死某一 IDE | Playbook 中立；全局 Skill 只是薄触发层 |

## 仓库结构

```text
gated-agent-workflow/
├── README.md
├── PLAYBOOK.md                   # 核心流程
├── AGENTS.md
├── COMPARISON.md
├── templates/                    # 空模板
├── skills/gated-agent-workflow/  # 全局 Skill 正文（安装脚本会附带 PLAYBOOK+templates）
├── scripts/
│   ├── install-cursor-global.sh
│   ├── install-claude-global.sh
│   └── scaffold-into-project.sh
├── adapters/                     # 各工具补充说明与片段
└── examples/
```

## 两个入口（Bootstrap 含 Discover）

| 入口 | 何时用 |
|------|--------|
| **Bootstrap**（含阶段 0 Discover） | 从 0 到 MVP：先需求讨论，再 SCOPE / 步骤 / 实现 |
| **Change Request** | 已有代码；默认先只读勘察 |

小改走 Playbook **小改旁路**，避免仪式过重。

## 接入主流 Agent

| 工具 | 项目级（稳定、可分享） | 全局便捷（省事） |
|------|------------------------|------------------|
| 任意 | `docs/ai-workflow/` + `AGENTS.md` | — |
| Cursor | scaffold / 复制 | `scripts/install-cursor-global.sh` |
| Claude Code | 同上 | `scripts/install-claude-global.sh` |
| Copilot 等 | 合并 `adapters/copilot-instructions.snippet.md` | 通常无统一全局 Skill，靠项目文档 |

细节见 [`adapters/`](./adapters/)。完整规则见 [`PLAYBOOK.md`](./PLAYBOOK.md)。与 Spec Kit 等对比见 [`COMPARISON.md`](./COMPARISON.md)。

## 设计原则（一句话）

**代码与可执行验收是真相；聊天历史不是真相。每步结束必须留下下一 Agent 能独立开工的 Handoff。**

## License

MIT
