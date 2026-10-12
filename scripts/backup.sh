#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DEST="${1:-$ROOT/backups}"
mkdir -p "$DEST"
STAMP="$(date +%Y%m%d-%H%M%S)"
tar --exclude='.git' --exclude='backups' -czf "$DEST/project-$STAMP.tar.gz" -C "$(dirname "$ROOT")" "$(basename "$ROOT")"
echo "Backup created in $DEST"
