#!/usr/bin/env zsh

# Core zsh behavior: history, plugins, completions, keybindings, and prompt.

# ==============================================================================
# History
# ==============================================================================

HISTFILE="$HOME/.histfile"
HISTSIZE=10000
SAVEHIST=10000

setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY
setopt HIST_VERIFY

# ==============================================================================
# Plugins
# ==============================================================================

source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh
antidote load "${ZDOTDIR:-$HOME}/.zsh_plugins.txt"

# ==============================================================================
# Tool Integrations
# ==============================================================================

source <(fzf --zsh)
eval "$(zoxide init zsh)"

# ==============================================================================
# Completion
# ==============================================================================

zstyle :compinstall filename '/home/rasmus105/.zshrc'

typeset -U fpath
fpath=(
  "$HOME/.local/share/zsh/site-functions"
  $fpath
)

autoload -Uz compinit
compinit

# ==============================================================================
# Keybindings
# ==============================================================================

KEYTIMEOUT=1
bindkey -e

# ==============================================================================
# Prompt
# ==============================================================================

autoload -Uz vcs_info

precmd() {
  vcs_info
}

zstyle ':vcs_info:git:*' formats '%b'

setopt PROMPT_SUBST
PROMPT='%F{blue}%~ %(?.%F{green}✓.%F{red}✗ %?)%f %F{green}(${vcs_info_msg_0_})%f %F{white}$ '
