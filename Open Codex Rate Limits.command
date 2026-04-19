#!/bin/zsh

source "$HOME/.zprofile" >/dev/null 2>&1 || true
exec "$HOME/bin/codex-rate-limits.command"
