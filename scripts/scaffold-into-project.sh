#!/usr/bin/env bash
# Scaffold Gated Agent Workflow into a target project.
# Usage: bash scripts/scaffold-into-project.sh /path/to/target-project
#    or: bash scripts/scaffold-into-project.sh   # uses cwd
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
TARGET="${1:-.}"
TARGET="$(cd "$TARGET" && pwd)"
DEST="$TARGET/docs/ai-workflow"

if [[ "$TARGET" == "$ROOT" ]]; then
  echo "Refusing to scaffold into the workflow repo itself: $TARGET" >&2
  echo "Pass your application project path as the argument." >&2
  exit 1
fi

mkdir -p "$DEST/templates"
cp "$ROOT/PLAYBOOK.md" "$DEST/PLAYBOOK.md"
cp "$ROOT/templates/"*.md "$DEST/templates/"
cp "$ROOT/COMPARISON.md" "$DEST/COMPARISON.md" 2>/dev/null || true

if [[ ! -f "$TARGET/AGENTS.md" ]]; then
  cp "$ROOT/AGENTS.md" "$TARGET/AGENTS.md"
  echo "Created $TARGET/AGENTS.md"
else
  echo "AGENTS.md already exists — merge adapters/AGENTS.md.snippet manually if needed."
fi

echo "Scaffolded → $DEST"
echo "Next: ask agent to run Bootstrap or Change Request per PLAYBOOK.md"
