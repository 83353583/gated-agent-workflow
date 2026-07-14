#!/usr/bin/env bash
# Install Gated Agent Workflow as a Claude Code *global* skill (best-effort path).
# Usage: from repo root → bash scripts/install-claude-global.sh
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
# Claude Code commonly uses ~/.claude/skills
DEST="${HOME}/.claude/skills/gated-agent-workflow"

mkdir -p "$DEST/templates"
cp "$ROOT/skills/gated-agent-workflow/SKILL.md" "$DEST/SKILL.md"
# Prefer Claude-flavored wrapper if present, but keep same PLAYBOOK bundle
if [[ -f "$ROOT/adapters/claude/SKILL.md" ]]; then
  # Keep name/description compatible: use shared skill body + note
  cp "$ROOT/skills/gated-agent-workflow/SKILL.md" "$DEST/SKILL.md"
fi
cp "$ROOT/PLAYBOOK.md" "$DEST/PLAYBOOK.md"
cp "$ROOT/AGENTS.md" "$DEST/AGENTS.md"
cp "$ROOT/templates/"*.md "$DEST/templates/"

echo "Installed Claude global skill → $DEST"
echo "If your Claude skills path differs, move this folder accordingly."
