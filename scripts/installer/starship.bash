#!/usr/bin/env bash

if (type "ghq" > /dev/null 2>&1); then
  echo "ghq is already installed."
else
  curl -sS https://starship.rs/install.sh | sh
fi
