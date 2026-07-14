---
name: gated-agent-workflow
description: >-
  Gate AI coding with step stops, copy-paste handoffs, model-tier cost control,
  and separate bootstrap vs change-request flows. Use for new AI-built projects,
  change requests, handoff prompts, or when user mentions Gated Agent Workflow.
---

# Gated Agent Workflow (Claude Code)

## Instructions

1. Locate and follow `PLAYBOOK.md` from this workflow repo or the project's `docs/ai-workflow/PLAYBOOK.md`.
2. Use templates in `templates/` for SCOPE, architecture, step table, handoff, change request, and decision log.
3. Entries:
   - New project → Bootstrap flow
   - Maintenance / new feature / bug → Change Request（read-only recon first, unless small-fix bypass）
4. Hard gates: acceptance required; one step then hard stop; always emit next copy-paste Handoff; no out-of-scope refactors.

## Suggested user phrases

- 执行 Gated Agent Workflow 新项目启动
- 执行 Gated Agent Workflow 变更单
- 只读勘察，不改代码
- 本变更已通过，只同步文档
