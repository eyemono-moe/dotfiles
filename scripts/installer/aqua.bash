#!/usr/bin/env bash

if (type "aqua" > /dev/null 2>&1); then
  echo "aqua is already installed."
else
  go install github.com/aquaproj/aqua/v2/cmd/aqua@v2.29.0
fi
