#!/bin/bash
set -euxo pipefail

export XDG_CONFIG_HOME="${HOME}/.config"

{{ if eq .chezmoi.os "linux" }}
BREW_PREFIX="/home/linuxbrew/.linuxbrew"
{{ else if eq .chezmoi.os "darwin" }}
BREW_PREFIX="/opt/homebrew"
{{ end }}
eval "$(${BREW_PREFIX}/bin/brew shellenv)"

echo "[+] Installing tools with brew bundle..."
brew bundle --file="$XDG_CONFIG_HOME/homebrew/Brewfile" || true
