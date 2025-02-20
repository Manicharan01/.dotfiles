# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ];then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Loas zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::command-not-found

# Load Completions
autoload -U compinit && compinit

zinit cdreplay -q

# Prompt

# Personal Keybindings
bindkey -s ^f "tmux-sessionizer\n"
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# Personal Aliases
alias -g vim="nvim"
alias -g hotspot="nmcli con up Hotspot"
alias -g ls="eza --color=always --icons=always --group-directories-first"

# Personal Exports and PATH variables
export PATH="$PATH":"$HOME/.local/scripts/"
export EDITOR=nvim
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/usr/local/jdk-23/bin
export PATH=$PATH:/opt/gradle/gradle-8.10.1/bin
export XCURSOR_PATH=$XCURSOR_PATH:/home/charan/.local/share/icons
export PATH=$PATH:/usr/local/zig
export PATH=$PATH:/home/charan/.local/bin/ghostty
export SWAY_SCREENSHOT_DIR="/home/charan/Pictures"
export QT_QPA_PLATFORMTHEME=qt6ct
export PATH=$PATH:/home/charan/Personal/go/bin
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always --icons=always {} | head -200'"
export GHOSTTY_RESOURCES_DIR="/home/charan/Personal/ghostty/zig-out/share/ghostty/"
. /opt/asdf-vm/asdf.sh

# Evals & fzf
eval "$(fzf --zsh)"

_fzf_comprun() {
    local command=$1
    shift

    case "$command" in
        cd) fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
        export|unset) fzf --preview "eval 'echo $'{}" "$@" ;;
        ssh) fzf --preview 'dig {}' "$@" ;;
        *) fzf --preview "bat -n --color=always --line-range :400 {}" "$@" ;;
    esac
}

# zoxide
eval "$(zoxide init --cmd cd zsh)"

# Yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

function unzip_to_folder() {
    unzip "$1" -d "${1%.*}"
}

# pnpm
export PNPM_HOME="/home/charan/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

. "/home/charan/.deno/env"

if [[ -n $GHOSTTY_RESOURCES_DIR ]]; then
  source "$GHOSTTY_RESOURCES_DIR"/shell-integration/zsh/ghostty-integration
fi

# Created by `pipx` on 2024-09-28 23:27:34
export PATH="$PATH:/home/charan/.local/bin"

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls $realpath'
eval "$(oh-my-posh init zsh --config /home/charan/.config/ohmyposh/tj.toml)"
