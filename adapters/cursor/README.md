# Cursor 接入说明

## 方式 A：项目内 Skill（推荐分享给协作者）

1. 将本仓库作为 submodule，或拷贝 `PLAYBOOK.md` + `templates/` 到目标项目 `docs/ai-workflow/`。
2. 拷贝 `adapters/cursor/SKILL.md` 到目标项目 `.cursor/skills/gated-agent-workflow/SKILL.md`。
3. 按需把 `rules-snippet.md` 做成 `.cursor/rules/gated-agent-workflow.mdc`。
4. 根目录放置或合并 `AGENTS.md`。

## 方式 B：个人全局 Skill

拷贝 `adapters/cursor/SKILL.md` 到 `~/.cursor/skills/gated-agent-workflow/SKILL.md`，并在 skill 正文中写明 Playbook 的绝对路径或「先在仓库中查找 PLAYBOOK.md」。

## 使用口令

- `执行 Gated Agent Workflow 新项目启动`
- `执行 Gated Agent Workflow 变更单`
- `只做当前 Handoff，完成后硬停并输出下一 Handoff`
