#!/bin/bash
set -euxo pipefail

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

# Install chezmoi
if ! command -v chezmoi &>/dev/null; then
  echo "[+] Installing chezmoi..."
  sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin
fi

# Run chezmoi init
~/bin/chezmoi init eyemono-moe --apply