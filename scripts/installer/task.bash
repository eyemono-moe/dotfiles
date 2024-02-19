#!/usr/bin/env bash

if (type "task" > /dev/null 2>&1); then
  echo "task is already installed."
else
  # https://taskfile.dev/installation/#build-from-source
  go install github.com/go-task/task/v3/cmd/task@latest
fi
