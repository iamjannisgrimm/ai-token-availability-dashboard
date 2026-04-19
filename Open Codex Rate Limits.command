#!/bin/zsh

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
exec "$SCRIPT_DIR/run-codex-rate-limits-window.sh"
