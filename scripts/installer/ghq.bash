#!/usr/bin/env bash

if (type "ghq" > /dev/null 2>&1); then
  echo "ghq is already installed."
else
  go install github.com/x-motemen/ghq@latest
fi
