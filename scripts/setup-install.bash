#!/usr/bin/env bash
# shellcheck source=./scripts/common.bash
source "$(dirname "$0")/common.bash"

/bin/bash "$CUR_DIR/installer/ghq.bash"
/bin/bash "$CUR_DIR/installer/deno.bash"
/bin/bash "$CUR_DIR/installer/docker.bash"
/bin/bash "$CUR_DIR/installer/neovim.bash"
/bin/bash "$CUR_DIR/installer/node.bash"
/bin/bash "$CUR_DIR/installer/poetry.bash"
/bin/bash "$CUR_DIR/installer/pyenv.bash"
/bin/bash "$CUR_DIR/installer/rust.bash"
/bin/bash "$CUR_DIR/installer/starship.bash"
/bin/bash "$CUR_DIR/installer/win32yank.bash"
