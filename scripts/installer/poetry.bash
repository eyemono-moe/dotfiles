#!/usr/bin/env bash

if (type "poetry" > /dev/null 2>&1); then
  echo "poetry is already installed."
else
  curl -sSL https://install.python-poetry.org | python3 -
fi
