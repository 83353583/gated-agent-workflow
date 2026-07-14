#!/usr/bin/env bash
# Install Gated Agent Workflow as a Cursor *global* skill.
# Usage: from repo root → bash scripts/install-cursor-global.sh
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
DEST="${HOME}/.cursor/skills/gated-agent-workflow"

mkdir -p "$DEST/templates"
cp "$ROOT/skills/gated-agent-workflow/SKILL.md" "$DEST/SKILL.md"
cp "$ROOT/PLAYBOOK.md" "$DEST/PLAYBOOK.md"
cp "$ROOT/AGENTS.md" "$DEST/AGENTS.md"
cp "$ROOT/templates/"*.md "$DEST/templates/"
cp "$ROOT/adapters/cursor/rules-snippet.md" "$DEST/rules-snippet.md" 2>/dev/null || true

echo "Installed Cursor global skill → $DEST"
echo "Restart or new Agent chat may be needed for discovery."
echo "In a project, say: 初始化门禁工作流 / 按 Gated Agent Workflow 新项目启动"
