# Cursor Rule 片段（可选）

将以下内容加入目标项目的 `.cursor/rules/`（例如 `gated-agent-workflow.mdc`），**保持简短**；长流程仍以 `PLAYBOOK.md` 为准。

```markdown
---
description: Gated Agent Workflow hard gates
globs:
alwaysApply: true
---

# Gated Agent Workflow

- 遵守项目中的 PLAYBOOK / AGENTS 中关于 Gated Agent Workflow 的约定。
- 无验收不得宣称完成；优先可执行命令。
- 一步只做一步；结束后硬停，并产出可复制的下一 Handoff。
- 禁止范围外重构；维护期先只读勘察（除非用户声明小改旁路）。
- 不要靠长聊天接力；下一会话只使用 Handoff + 全局文档摘要。
```
