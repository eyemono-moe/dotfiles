#!/bin/bash
set -euxo pipefail

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export AQUA_ROOT_DIR="$XDG_DATA_HOME/aquaproj-aqua"
export AQUA_GLOBAL_CONFIG="$XDG_CONFIG_HOME/aquaproj-aqua/aqua.yaml"
export PATH="$HOME/.local/bin:$PATH"

if command -v aqua &>/dev/null; then
  echo "[+] Installing tools with aqua..."
  aqua install
fi