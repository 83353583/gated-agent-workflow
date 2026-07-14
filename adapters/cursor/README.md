# Cursor 接入

## 只想当前项目用

```bash
bash /path/to/gated-agent-workflow/scripts/scaffold-into-project.sh .
```

或拷贝 `PLAYBOOK.md` + `templates/` 到 `docs/ai-workflow/`，合并根目录 `AGENTS.md`。可选：把 `rules-snippet.md` 做成 `.cursor/rules/gated-agent-workflow.mdc`。

## 想以后项目都用（全局 Skill）

```bash
bash scripts/install-cursor-global.sh
```

会安装到 `~/.cursor/skills/gated-agent-workflow/`（含 `SKILL.md`、`PLAYBOOK.md`、`templates/`）。

Skill 正文在仓库：[`skills/gated-agent-workflow/SKILL.md`](../../skills/gated-agent-workflow/SKILL.md)。

Agent 判定要用时，若项目尚未初始化，会先确认再写入 `docs/ai-workflow/`——**稳定跨会话/跨工具的是项目内文件，不是全局 Skill  alone。**

## 口令

- `初始化门禁工作流`
- `按 Gated Agent Workflow 新项目启动`
- `执行变更单` / `只读勘察`
- `只做当前 Handoff，硬停并输出下一 Handoff`
