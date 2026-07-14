# Agent Instructions — Gated Agent Workflow

本项目（或引用本工作流的目标项目）遵循 **Gated Agent Workflow**。

## 必读

1. 优先读 **`docs/ai-workflow/PLAYBOOK.md`**（scaffold 之后）。若尚未 scaffold，可读工作流仓库或全局 Skill 旁的 `PLAYBOOK.md`，并先完成初始化。
2. 模板在 `docs/ai-workflow/templates/`（或工作流仓库 / 全局 Skill 的 `templates/`）。
3. 硬约束：可执行验收、一步一步、每步硬停、产出可复制下一 Handoff、事实与计划分离。Discover 阶段禁止写业务代码，直到人类确认「范围可冻结」。

## 入口

| 用户意图 | 你应执行 |
|----------|----------|
| 需求讨论 / Discover / 先对齐需求 | PLAYBOOK §2 阶段 0；维护 `DISCOVERY.md`（含模糊关键点与可选竞品速览） |
| 范围可冻结 | 从 Discover 转入 SCOPE；冻结前关键模糊点须已拍板/假设/延后 |
| 新项目 / Bootstrap / 初始化门禁 | PLAYBOOK §2；若缺 `docs/ai-workflow/` 先确认再 scaffold；默认从 Discover 起 |
| 新需求 / 维护 / Bug / 变更 | PLAYBOOK §3（先只读勘察，除非小改旁路） |
| 「只做本步」+ 贴了 Handoff | 严格按该 Handoff，结束后硬停并给出下一 Handoff |

## 禁止

- 无验收声称完成
- Discover 未冻结就写业务代码或开工步骤表实现
- 同一长会话连续推进多个**实现**步骤（除非人类明确要求打破门禁）
- 范围外重构或提前做后续步骤
- 用聊天历史代替 Handoff 作为下一会话的唯一上下文

## 模型档位

- **整体规划**（Discover / SCOPE / 步骤表 / 选型冻结）：中高或高。  
- **实现步**：按 PLAYBOOK §4，默认中档；架构/鉴权/数据模型/疑难排障升级。  
- 改动业务逻辑的实现步：验收宜含至少一条自动化测试（见 PLAYBOOK §4.2）。  
在步骤表与 Handoff 中写明建议档位。
