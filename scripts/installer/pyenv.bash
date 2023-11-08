#!/usr/bin/env bash

if (type "pyenv" > /dev/null 2>&1); then
  echo "pyenv is already installed."
else
  apt update
  sudo apt install -y \
    build-essential \
    curl \
    libbz2-dev \
    libffi-dev \
    liblzma-dev \
    libncursesw5-dev \
    libreadline-dev \
    libsqlite3-dev \
    libssl-dev \
    libxml2-dev \
    libxmlsec1-dev \
    tk-dev \
    xz-utils \
    zlib1g-dev

  curl https://pyenv.run | bash
fi
