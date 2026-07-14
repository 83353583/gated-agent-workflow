# Claude Code 接入说明

1. 将本仓库 clone 到本地，或把 `PLAYBOOK.md` + `templates/` 放入目标项目。
2. 把 `adapters/claude/SKILL.md` 安装为 Claude Code skill（按你当前 Claude Code 的 skills 目录约定拷贝）。
3. 可选：在项目 `CLAUDE.md` 中加入：

```markdown
本项目使用 Gated Agent Workflow。先读 docs/ai-workflow/PLAYBOOK.md（或工作流仓库中的 PLAYBOOK.md）。
新项目走 Bootstrap；维护走变更单（先只读勘察）。每步硬停并产出下一 Handoff。
```

4. 根目录可同时放置 `AGENTS.md` 以兼容其他工具。
