#!/bin/bash
set -euxo pipefail

export XDG_CONFIG_HOME="${HOME}/.config"

if command -v brew &>/dev/null; then
  echo "[+] Installing tools with brew bundle..."
  brew bundle --file="$XDG_CONFIG_HOME/homebrew/Brewfile" || true
fi