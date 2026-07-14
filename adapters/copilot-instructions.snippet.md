# GitHub Copilot / 通用 instructions 片段

将以下内容并入目标项目的 `.github/copilot-instructions.md`，或各工具的「自定义指令」文本框：

```markdown
Follow Gated Agent Workflow when scaffolding, implementing features, or handling change requests.

Source of truth: docs/ai-workflow/PLAYBOOK.md (or the linked gated-agent-workflow PLAYBOOK).

Rules:
- Never claim completion without acceptance checks (prefer runnable commands).
- One step at a time; hard-stop after the step; emit a copy-paste Handoff for the next agent.
- For maintenance: read-only recon before edits unless the user approves small-fix bypass.
- Do not rely on long chat history as the next session's only context.
- Separate facts (done) from plans; do not invent APIs or files.
```
