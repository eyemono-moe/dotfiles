### ls-colors ###
export LS_COLORS="di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32"

### Aliases ###
alias la='ls -A'

alias ll="exa -l -h -@ -mU --icons --time-style=long-iso --color=automatic --group-directories-first"
alias l="ll -aa"

alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

### shortcut ###
fcd() {
  local dir
  dir=$(find "${1:-.}" -path '*/\.*' -prune -o -path '*/node_modules/*' -prune -o -type d -print 2> /dev/null | fzf-tmux -p 80% +m --preview="fzf-preview-file {}") && cd "$dir"
}

# https://zenn.dev/yamo/articles/5c90852c9c64ab
function select-git-switch() {
  target_br=$(
    git branch -a |
      fzf-tmux -p 80% --exit-0 --layout=reverse --info=hidden --no-multi --prompt="CHECKOUT BRANCH > " --preview="echo {} | tr -d ' *' | xargs git lg --color=always" |
      head -n 1 |
      perl -pe "s/\s//g; s/\*//g; s/remotes\/origin\///g"
  )
  if [ -n "$target_br" ]; then
    BUFFER="git switch $target_br"
    zle accept-line
  fi
}
zle -N select-git-switch
bindkey "^g^s" select-git-switch # 「control + G + S」で実行

# https://zenn.dev/kaityo256/articles/open_command_on_wsl
function open() {
    if [ $# != 1 ]; then
        /mnt/c/windows/explorer.exe .
    else
        if [ -e $1 ]; then
            /mnt/c/windows/system32/cmd.exe /c start $(wslpath -w $1) 2> /dev/null
        else
            echo "open: $1 : No such file or directory" 
        fi
    fi
}

# https://www.m3tech.blog/entry/dotfiles-bonsai#Tmux編
# Gitリポジトリを列挙する
widget::ghq::source() {
    local session color icon green="\e[32m" blue="\e[34m" reset="\e[m" checked="󰄲" unchecked="󰄱"
    local sessions=($(tmux list-sessions -F "#S" 2>/dev/null))

    ghq list | sort | while read -r repo; do
        session="${repo//[:. ]/-}"
        color="$blue"
        icon="$unchecked"
        if (( ${+sessions[(r)$session]} )); then
            color="$green"
            icon="$checked"
        fi
        printf "$color$icon %s$reset\n" "$repo"
    done
}
# GitリポジトリをFZFで選択する
widget::ghq::select() {
    local root="$(ghq root)"
    widget::ghq::source | fzf-tmux -p 80% --exit-0 --preview="fzf-preview-git ${(q)root}/{+2}" | cut -d' ' -f2-
}
# FZFで選択されたGitリポジトリにTmuxセッションを立てる
widget::ghq::session() {
    local selected="$(widget::ghq::select)"
    if [ -z "$selected" ]; then
        return
    fi

    local repo_dir="$(ghq list --exact --full-path "$selected")"
    local session_name="${selected//[:. ]/-}"

    if [ -z "$TMUX" ]; then
        # Tmuxの外にいる場合はセッションにアタッチする
        BUFFER="tmux new-session -A -s ${(q)session_name} -c ${(q)repo_dir}"
        zle accept-line
    elif [ "$(tmux display-message -p "#S")" = "$session_name" ] && [ "$PWD" != "$repo_dir" ]; then
        # 選択されたGitリポジトリのセッションにすでにアタッチしている場合はGitリポジトリのルートディレクトリに移動する
        BUFFER="cd ${(q)repo_dir}"
        zle accept-line
    else
        # 別のTmuxセッションにいる場合はセッションを切り替える
        tmux new-session -d -s "$session_name" -c "$repo_dir" 2>/dev/null
        tmux switch-client -t "$session_name"
    fi
    zle -R -c # refresh screen
}
zle -N widget::ghq::session

# C-g で呼び出せるようにする
bindkey "^g" widget::ghq::session

### zsh plugins ###
zinit wait lucid blockf light-mode for \
  atload'async_init' @'mafredri/zsh-async' \
  @'zsh-users/zsh-autosuggestions' \
  @'zsh-users/zsh-completions' \
  @'zdharma-continuum/fast-syntax-highlighting'

### Editor ###
export EDITOR="vi"
(( ${+commands[vim]} )) && EDITOR="vim"
export GIT_EDITOR="$EDITOR"

### FZF ###
[ -f "${XDG_CONFIG_HOME}"/fzf/fzf.zsh ] && source "${XDG_CONFIG_HOME}"/fzf/fzf.zsh
FZF_DEFAULT_OPTS+=' --border'
FZF_DEFAULT_OPTS+=' --ansi'
FZF_DEFAULT_OPTS+=' --bind "ctrl-d:print-query"'
FZF_DEFAULT_OPTS+=' --bind "ctrl-p:replace-query"'
FZF_DEFAULT_OPTS+=' --preview-window=right:60%'
export FZF_DEFAULT_OPTS
export FZF_DEFAULT_COMMAND='fd --hidden --color=always'

### bat ###
if (( ${+commands[bat]} )); then
  export MANPAGER="sh -c 'col -bx | bat --color=always --language=man --plain'"

  alias cat='bat --paging=never'
fi

### bun ###
[ -s "$BUN_INSTALL/_bun" ] && source "$BUN_INSTALL/_bun"

### Node.js ###
export NODE_REPL_HISTORY="$XDG_STATE_HOME/node_history"

### PostgreSQL ###
export PSQL_HISTORY="$XDG_STATE_HOME/psql_history"

### completion styles ###
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

### Tmux ###
tmux source $XDG_CONFIG_HOME/tmux/tmux.conf

### zeno ###
export ZENO_HOME="$XDG_CONFIG_HOME/zeno"
export ZENO_ENABLE_SOCK=1
# export ZENO_DISABLE_BUILTIN_COMPLETION=1
export ZENO_GIT_CAT="bat --color=always"
export ZENO_GIT_TREE="exa --tree"

__zeno_atload() {
   bindkey ' '  zeno-auto-snippet
   bindkey '^M' zeno-auto-snippet-and-accept-line
   bindkey '^P' zeno-completion
}

zinit wait lucid light-mode for \
    atload'__zeno_atload' \
    @'yuki-yano/zeno.zsh'

### browser(vivaldi) ###
# https://blog.1q77.com/2024/01/open-browser-in-wsl/
if [[ -x /mnt/c/Users/eyemono/AppData/Local/Vivaldi/Application/vivaldi.exe ]]; then
  ln -sf /mnt/c/Users/eyemono/AppData/Local/Vivaldi/Application/vivaldi.exe "$HOME/.local/bin/vivaldi"
  export BROWSER="$HOME/.local/bin/vivaldi"
fi

### local ###
if [ -f "$ZDOTDIR/local.zsh" ]; then
  source "$ZDOTDIR/local.zsh"
fi

sheldon::load lazy