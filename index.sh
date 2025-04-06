#!/bin/bash
set -euo pipefail

case "${DEBUG:-}" in
  true|1|yes|on)
    set -x
    ;;
esac

echo -e "\033[1;34m[INFO]\033[0m    Welcome to the dot.eyemono.moe setup script!"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

# Install chezmoi
if ! $HOME/.local/bin/chezmoi --version &>/dev/null; then
  echo -e "\033[1;34m[INFO]\033[0m    Installing chezmoi..."
  sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin

  if ! $HOME/.local/bin/chezmoi --version &>/dev/null; then
    echo -e "\033[1;31m[ERROR]\033[0m   Failed to install chezmoi. Please check your internet connection and try again."
    exit 1
  fi

  echo -e "\033[1;32m[SUCCESS]\033[0m chezmoi installed"
else
  echo -e "\033[1;32m[INFO]\033[0m    chezmoi already installed"
fi

# Run chezmoi init
$HOME/.local/bin/chezmoi init eyemono-moe --apply --verbose
