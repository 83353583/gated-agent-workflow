---
name: gated-agent-workflow
description: >-
  Gate AI coding with step stops, copy-paste handoffs, model-tier cost control,
  and separate bootstrap vs change-request flows. Use when starting a new
  project with AI, adding features, fixing bugs under this workflow, producing
  a Handoff Prompt, or when the user says Gated Agent Workflow / 门禁式工作流 /
  接力包 / 变更单.
---

# Gated Agent Workflow (Cursor)

## When triggered

1. Read the playbook at the skill's repo or the project's copy of `PLAYBOOK.md`.
2. Choose entry:
   - **Bootstrap** — greenfield / MVP
   - **Change Request** — maintenance, new feature, bug（default: read-only recon first）
3. Use templates under `templates/`（scope, architecture, step-table, handoff, change-request, decision-log）.

## Hard rules

- Do not claim done without running acceptance checks.
- One step only; then **hard stop**.
- Always emit the next copy-paste **Handoff Prompt**.
- Prefer executable commands as acceptance.
- Do not use long chat history as the next agent's only context.

## Outputs

Follow `PLAYBOOK.md`. Prefer writing artifacts into the target project's `docs/ai-workflow/` when it exists.
