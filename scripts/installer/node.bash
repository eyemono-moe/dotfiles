#!/usr/bin/env bash

if (type "node" > /dev/null 2>&1); then
  echo "node is already installed."
else
  # https://github.com/tj/n#installation
  sudo curl -fsSL https://raw.githubusercontent.com/tj/n/master/bin/n | sudo bash -s lts
  npm install -g n
  sudo n stable
fi
