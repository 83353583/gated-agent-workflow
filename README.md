# Gated Agent Workflow

一套面向 **AI 全程开发** 的门禁式工作流：先定范围与步骤，再分步实现；每步必须验收、硬停，并产出可复制的下一 Agent 接力包（Handoff），以控制成本、降低幻觉，并缓解长会话自动压缩上下文带来的失真。

不绑定 Cursor。核心是中立 Markdown Playbook；Cursor / Claude Code / Copilot / Windsurf / Codex 等均可接入。

## 解决什么问题

| 痛点 | 本仓库做法 |
|------|------------|
| 一次让 AI 做太大，上下文膨胀 / 幻觉扩散 | 垂直小步 + 人工门禁 |
| 长会话被自动摘要，早期约束丢失 | **每步硬停**，新开 Agent，只粘贴 Handoff |
| 高强模型全程使用成本高 | 步骤表标明模型档位与升级条件 |
| 维护期仍走「从零大讨论」 | 独立 **变更流**：先只读勘察，再最小改动 |
| 流程绑死某一 IDE | Playbook 中立 + 薄适配层 |

## 快速开始

1. 把本仓库 clone 到本地，或把 `PLAYBOOK.md` + `templates/` 拷进你的项目（例如 `docs/ai-workflow/`）。
2. 在目标项目根目录放入或合并 [`AGENTS.md`](./AGENTS.md)（或使用 [`adapters/AGENTS.md.snippet`](./adapters/AGENTS.md.snippet)）。
3. 对新项目：对 Agent 说「按 Gated Agent Workflow 执行 **新项目启动**」。
4. 对维护/新需求：说「按 Gated Agent Workflow 执行 **变更单**」。

更完整的说明见 [`PLAYBOOK.md`](./PLAYBOOK.md)。

## 仓库结构

```text
gated-agent-workflow/
├── README.md                 # 本文件
├── PLAYBOOK.md               # 核心：启动流 + 变更流 + 门禁规则
├── AGENTS.md                 # 可直接放进目标项目根目录
├── COMPARISON.md             # 与 Spec Kit / SDD / RIPER 等对比
├── templates/                # 可复制空模板
│   ├── scope.md
│   ├── architecture.md
│   ├── step-table.md
│   ├── handoff.md
│   ├── change-request.md
│   └── decision-log.md
├── adapters/                 # 各 Agent 薄适配
│   ├── AGENTS.md.snippet
│   ├── cursor/
│   ├── claude/
│   └── copilot-instructions.snippet.md
└── examples/                 # 填写示例（非真实项目）
    ├── sample-step-table.md
    └── sample-handoff.md
```

## 两个入口

| 入口 | 何时用 |
|------|--------|
| **Bootstrap（新项目启动）** | 从 0 到 MVP：需求 → 范围 → 步骤表 → 分步实现 |
| **Change Request（维护/新需求）** | 已有代码：变更单 → 只读勘察 → 分步实施 → 文档回写 |

小改（单点 bug、文案）走 Playbook 中的 **小改旁路**，不必走完整启动仪式。

## 接入主流 Agent（摘要）

| 工具 | 做法 |
|------|------|
| 任意 Agent | `@PLAYBOOK.md` 或把 Playbook 贴进首条消息 |
| Cursor | 见 [`adapters/cursor/`](./adapters/cursor/) |
| Claude Code | 见 [`adapters/claude/`](./adapters/claude/) |
| GitHub Copilot | 见 [`adapters/copilot-instructions.snippet.md`](./adapters/copilot-instructions.snippet.md) |
| 其他 | 根目录 `AGENTS.md` 指向本 Playbook |

## 设计原则（一句话）

**代码与可执行验收是真相；聊天历史不是真相。每步结束必须留下下一 Agent 能独立开工的 Handoff。**

## License

MIT
