#!/usr/bin/env zsh

# Case insensitive autocomplete and globbing.
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
setopt no_case_glob

setopt AUTO_PUSHD         # Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS  # Do not store duplicates in the stack.
setopt PUSHD_SILENT       # Do not print the directory stack after pushd or popd.

# PATH is cleared on arch switch. Make it available in x86. @see arch-toggle
# fallback to OS provided vim.
if type nvim &>/dev/null; then
  export EDITOR=nvim
elif [[ -r /opt/homebrew/bin/nvim ]]; then
  export EDITOR=/opt/homebrew/bin/nvim
else
  export EDITOR=vim
fi
export LESS='-R'
