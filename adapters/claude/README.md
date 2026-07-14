# Claude Code 接入

## 只想当前项目用

```bash
bash /path/to/gated-agent-workflow/scripts/scaffold-into-project.sh .
```

可选：在 `CLAUDE.md` 写一句指向 `docs/ai-workflow/PLAYBOOK.md`。

## 想以后项目都用（全局 Skill）

```bash
bash scripts/install-claude-global.sh
```

默认安装到 `~/.claude/skills/gated-agent-workflow/`。若你本机 Claude skills 目录不同，把该文件夹挪过去即可。

Skill 与 Cursor 共用同一份：[`skills/gated-agent-workflow/SKILL.md`](../../skills/gated-agent-workflow/SKILL.md)。

**说明：** 全局 Skill 是 Claude/Cursor 的便捷层；scaffold 进项目后，其他不读 Claude Skill 的 Agent 仍可通过项目内 `AGENTS.md` + `docs/ai-workflow/` 使用同一流程。
