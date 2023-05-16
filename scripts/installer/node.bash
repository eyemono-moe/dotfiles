#!/usr/bin/env bash

if (type "node" > /dev/null 2>&1); then
  echo "node is already installed."
else
  sudo apt update
  sudo apt -y install nodejs npm
  sudo npm -g install n
  sudo n stable
  sudo apt -y purge nodejs npm
  sudo apt -y autoremove
fi
