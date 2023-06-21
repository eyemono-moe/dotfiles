#!/usr/bin/env bash

if (type "deno" >/dev/null 2>&1); then
  echo "deno is already installed."
else
  echo "deno is not installed. Install deno..."
  export DENO_INSTALL="${DENO_INSTALL:-$XDG_DATA_HOME/deno}"
  curl -fsSL https://deno.land/x/install/install.sh | /bin/sh

  echo "Install Deno completions..."
  mkdir -p "$XDG_DATA_HOME/zsh/completions"
  "$DENO_INSTALL/bin/deno" completions zsh >"$XDG_DATA_HOME/zsh/completions/_deno"
  echo "Successfully installed deno."
fi
