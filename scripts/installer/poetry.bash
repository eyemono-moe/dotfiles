#!/usr/bin/env bash

if (type "ghq" > /dev/null 2>&1); then
  echo "ghq is already installed."
else
  curl -sSL https://install.python-poetry.org | python3 -
fi
