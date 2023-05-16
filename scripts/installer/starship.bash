#!/usr/bin/env bash

if (type "starship" > /dev/null 2>&1); then
  echo "starship is already installed."
else
  curl -sS https://starship.rs/install.sh | sh
fi
