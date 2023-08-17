#!/usr/bin/env bash

if (type "pnpm" > /dev/null 2>&1); then
  echo "pnpm is already installed."
else
  # https://pnpm.io/ja/installation#posix-%E3%82%B7%E3%82%B9%E3%83%86%E3%83%A0%E3%81%AE%E5%A0%B4%E5%90%88
  sudo curl -fsSL https://get.pnpm.io/install.sh | sh -
fi

