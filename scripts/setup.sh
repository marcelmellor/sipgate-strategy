#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

echo "Initializing submodules..."
git submodule update --init --recursive

# Verify magic-md
if [[ -f .skills/render/scripts/render.sh ]]; then
  echo "✓ magic-md render skill ready"
else
  echo "✗ magic-md render skill missing — check .gitmodules" >&2
  exit 1
fi

# Verify design
DESIGN=$(grep '^design=' .magic-md.conf 2>/dev/null | cut -d= -f2 | xargs)
DESIGNS_DIR=$(grep '^designs_dir=' .magic-md.conf 2>/dev/null | cut -d= -f2 | xargs)
if [[ -n "$DESIGN" && -n "$DESIGNS_DIR" && -f "$DESIGNS_DIR/$DESIGN.css" ]]; then
  echo "✓ Design '$DESIGN' found"
else
  echo "✗ Design '$DESIGN' not found in $DESIGNS_DIR/" >&2
  exit 1
fi

echo "Done."
