#!/bin/zsh

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
BIN_DIR="$HOME/bin"
DOCS_LAUNCHER="$HOME/Documents/Open Codex Rate Limits.command"
LAUNCH_AGENT_DIR="$HOME/Library/LaunchAgents"
LAUNCH_AGENT_PATH="$LAUNCH_AGENT_DIR/com.jannis.codex-rate-limits.plist"

mkdir -p "$BIN_DIR" "$HOME/Documents" "$LAUNCH_AGENT_DIR"

cp "$SCRIPT_DIR/codex-rate-limits" "$BIN_DIR/codex-rate-limits"
cp "$SCRIPT_DIR/codex-rate-limits.command" "$BIN_DIR/codex-rate-limits.command"
cp "$SCRIPT_DIR/run-codex-rate-limits-window.sh" "$BIN_DIR/run-codex-rate-limits-window.sh"
cp "$SCRIPT_DIR/Open Codex Rate Limits.command" "$DOCS_LAUNCHER"

chmod +x \
  "$BIN_DIR/codex-rate-limits" \
  "$BIN_DIR/codex-rate-limits.command" \
  "$BIN_DIR/run-codex-rate-limits-window.sh" \
  "$DOCS_LAUNCHER"

cat > "$LAUNCH_AGENT_PATH" <<PLIST
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>Label</key>
  <string>com.jannis.codex-rate-limits</string>
  <key>ProgramArguments</key>
  <array>
    <string>/bin/zsh</string>
    <string>$BIN_DIR/run-codex-rate-limits-window.sh</string>
  </array>
  <key>RunAtLoad</key>
  <true/>
  <key>StandardOutPath</key>
  <string>$HOME/Library/Logs/codex-rate-limits.log</string>
  <key>StandardErrorPath</key>
  <string>$HOME/Library/Logs/codex-rate-limits.log</string>
</dict>
</plist>
PLIST

launchctl bootout "gui/$(id -u)" "$LAUNCH_AGENT_PATH" >/dev/null 2>&1 || true
launchctl bootstrap "gui/$(id -u)" "$LAUNCH_AGENT_PATH" >/dev/null 2>&1 || true
launchctl enable "gui/$(id -u)/com.jannis.codex-rate-limits" >/dev/null 2>&1 || true
launchctl kickstart -k "gui/$(id -u)/com.jannis.codex-rate-limits" >/dev/null 2>&1 || true

echo "Installed."
echo "Documents launcher: $DOCS_LAUNCHER"
echo "LaunchAgent: $LAUNCH_AGENT_PATH"
