#!/usr/bin/env bash

if (type "nvim" > /dev/null 2>&1); then
  echo "nvim is already installed."
else
  curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
  chmod u+x nvim.appimage
  ./nvim.appimage
fi
