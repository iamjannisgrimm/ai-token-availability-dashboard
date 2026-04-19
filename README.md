# Codex Rate Limits Widget

Small macOS terminal widget for showing the current Codex subscription rate-limit usage from local Codex session telemetry.

<img width="640" height="325" alt="Screenshot 2026-04-19 at 3 53 54 PM" src="https://github.com/user-attachments/assets/c96cac48-b3e6-4dec-a36d-0490dab99eda" />

It reads `~/.codex/sessions/**/*.jsonl` and displays the latest `rate_limits` snapshot in a compact terminal dashboard.

## Important behavior

This works with whichever Codex account the local CLI is currently logged into.

It does not call a separate OpenAI subscription API. Instead, it reads the telemetry written by the local Codex app/CLI for the currently logged-in macOS user. If that user switches Codex accounts, the widget follows the new account automatically because it keeps reading that same local `~/.codex/sessions` directory.

## Requirements

- macOS
- Python 3
- Codex installed and used at least once on the machine
- Terminal.app if you want the click-to-open shortcut and login window behavior

## Run directly

```bash
chmod +x ./codex-rate-limits
./codex-rate-limits
```

Useful modes:

```bash
./codex-rate-limits --once
./codex-rate-limits --json
./codex-rate-limits --interval 1
```

## Install the widget locally

This installs:

- `~/bin/codex-rate-limits`
- `~/bin/codex-rate-limits.command`
- `~/bin/run-codex-rate-limits-window.sh`
- `~/Documents/Open Codex Rate Limits.command`
- `~/Library/LaunchAgents/com.jannis.codex-rate-limits.plist`

Run:

```bash
chmod +x ./install.sh
./install.sh
```

After that:

- double-click `~/Documents/Open Codex Rate Limits.command`
- or log out and back in to have it open automatically at login

## Notes

- The UI shows percentage used and remaining for the short window and weekly window.
- The displayed values depend on what Codex has recently written to `~/.codex/sessions`.
- If there is no recent telemetry yet, open Codex and use it once first.
