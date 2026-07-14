# Agent Instructions — Gated Agent Workflow

本项目（或引用本工作流的目标项目）遵循 **Gated Agent Workflow**。

## 必读

1. 先读工作流仓库或本地副本中的 `PLAYBOOK.md`。
2. 使用 `templates/` 下模板产出 SCOPE、步骤表、Handoff、变更单等。
3. 遵守硬约束：可执行验收、一步一步、每步硬停、产出可复制下一 Handoff、事实与计划分离。

## 入口

| 用户意图 | 你应执行 |
|----------|----------|
| 新项目 / 从零开始 / Bootstrap | PLAYBOOK §2 新项目启动 |
| 新需求 / 维护 / Bug / 变更 | PLAYBOOK §3 变更单（先只读勘察，除非小改旁路） |
| 「只做本步」+ 贴了 Handoff | 严格按该 Handoff 执行，结束后硬停并给出下一 Handoff |

## 禁止

- 无验收声称完成
- 同一长会话连续推进多个步骤（除非人类明确要求打破门禁）
- 范围外重构或提前做后续步骤
- 用聊天历史代替 Handoff 作为下一会话的唯一上下文

## 模型档位

按 PLAYBOOK §4：默认中档；架构/鉴权/数据模型/疑难排障升高等。在步骤表与 Handoff 中写明建议档位。
