#!/bin/zsh

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

exec osascript <<APPLESCRIPT
tell application "Terminal"
    activate
    do script "${SCRIPT_DIR}/codex-rate-limits.command"
    delay 0.2
    try
        set number of columns of front window to 78
        set number of rows of front window to 15
        set bounds of front window to {180, 110, 820, 510}
    end try
end tell
APPLESCRIPT
