#!/bin/zsh

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

exec osascript <<APPLESCRIPT
tell application "Terminal"
    activate
    do script "${SCRIPT_DIR}/codex-rate-limits.command"
    delay 0.2
    try
        set number of columns of front window to 76
        set number of rows of front window to 13
        set bounds of front window to {220, 140, 790, 430}
    end try
end tell
APPLESCRIPT
