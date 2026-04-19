#!/bin/zsh

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

(
  sleep 0.2
  osascript <<'APPLESCRIPT'
tell application "Terminal"
    try
        set number of columns of front window to 72
        set number of rows of front window to 19
        set bounds of front window to {235, 145, 785, 535}
    end try
end tell
APPLESCRIPT
) >/dev/null 2>&1 &

exec python3 "$SCRIPT_DIR/codex-rate-limits"
