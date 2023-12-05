#!/usr/bin/env bash

if (type "bun" >/dev/null 2>&1); then
  echo "bun is already installed."
else
  echo "bun is not installed. Install deno..."
  export BUN_INSTALL="${BUN_INSTALL:-$XDG_DATA_HOME/bun}"
  curl -fsSL https://bun.sh/install | bash
  echo "Successfully installed bun."
fi
