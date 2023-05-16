#!/usr/bin/env bash

if (type "nvim" > /dev/null 2>&1); then
  echo "nvim is already installed."
else
  # see https://github.com/neovim/neovim/wiki/Installing-Neovim#appimage-universal-linux-package
  curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
  chmod u+x nvim.appimage
  ./nvim.appimage --appimage-extract
  ./squashfs-root/AppRun --version

  # Optional: exposing nvim globally.
  sudo mv squashfs-root /
  sudo ln -s /squashfs-root/AppRun /usr/bin/nvim
fi
