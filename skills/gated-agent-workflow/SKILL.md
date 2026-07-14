---
name: gated-agent-workflow
description: >-
  Installs and runs the Gated Agent Workflow (step gates, copy-paste Handoff,
  model tiers, bootstrap vs change-request). Use when starting a greenfield AI
  project, adding features/bugs under gated flow, user asks for 门禁式工作流 /
  Gated Agent Workflow / 接力包 / 变更单 / 初始化门禁流程, or when the project
  already has docs/ai-workflow/. Do not use for tiny one-line edits unless the
  user explicitly asks for this workflow.
---

# Gated Agent Workflow

## Source of truth

1. Prefer **`docs/ai-workflow/PLAYBOOK.md`** in the target project once it exists (portable across agents).
2. Otherwise read **`PLAYBOOK.md` next to this `SKILL.md`** (bundled by global install scripts).
3. Templates live in `docs/ai-workflow/templates/` or next to this skill under `templates/`.

## First: ensure project is scaffolded

If the target project lacks `docs/ai-workflow/PLAYBOOK.md`:

1. **Ask once** (unless the user already said「初始化门禁」「以后都用这套」「scaffold」):  
   「是否在本项目写入 Gated Agent Workflow（`docs/ai-workflow/` + `AGENTS.md`）？」
2. On yes → **Scaffold** from the directory that contains this `SKILL.md` (or from the cloned workflow repo):
   - `PLAYBOOK.md` → `docs/ai-workflow/PLAYBOOK.md`
   - `templates/*.md` → `docs/ai-workflow/templates/`
   - If root `AGENTS.md` is missing, copy bundled `AGENTS.md`; if it exists, merge the「Gated Agent Workflow」section (do not wipe unrelated content)
   - Optional (Cursor only): add `.cursor/rules` from `rules-snippet.md` if present
   - Prefer running `scripts/scaffold-into-project.sh <project>` when that script is available
3. **Do not** overwrite filled `SCOPE.md` / `ARCHITECTURE.md` / handoffs / decision logs without asking.

## Then: choose entry

| Intent | Flow |
|--------|------|
| New product / MVP from zero | Bootstrap — PLAYBOOK §2 |
| New feature / bug / maintenance | Change Request — PLAYBOOK §3 (read-only recon first; small-fix bypass if allowed) |
| User pasted a Handoff | Execute **only that step**, hard-stop, emit next Handoff |

## Hard gates (always)

- No completion claim without acceptance (prefer runnable commands).
- One step only → hard stop → emit next copy-paste Handoff (`templates/handoff.md`).
- No out-of-scope refactors; facts ≠ plans.
- Do not chain many steps in one long chat (context compression risk).

## Model tiers

Default medium. Escalate for architecture / auth / data model / hard debugging. Record tier on the step table and Handoff.

## Cross-agent note

This Skill file is a **convenience trigger** (Cursor / Claude / similar). After scaffold, other tools without Skills still follow the same flow via project `AGENTS.md` + `docs/ai-workflow/`.
