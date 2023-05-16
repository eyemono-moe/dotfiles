#!/usr/bin/env bash
# shellcheck source=./scripts/common.bash
source "$(dirname "$0")/common.bash"

/bin/bash "$CUR_DIR/installer/ghq.bash"
/bin/bash "$CUR_DIR/installer/poetry.bash"
/bin/bash "$CUR_DIR/installer/pyenv.bash"
/bin/bash "$CUR_DIR/installer/starship.bash"
/bin/bash "$CUR_DIR/installer/win32yank.bash"
