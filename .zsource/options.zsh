#!/usr/bin/env zsh

# Enable caching for any completions which use it and set its path.
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ${XDG_CACHE_HOME:-~/.cache}/zsh/zcompcache

# Case insensitive autocomplete and globbing.
# @see man zshcompwid -> “COMPLETION MATCHING CONTROL”
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
setopt no_case_glob

setopt share_history          # Reads/writes history to keep sessions in sync.
                              # inc_append_history not needed.
setopt extended_history       # Extended format required when the history file
                              # is trimed. share_history shares the same format.
setopt hist_expire_dups_first # Drop duplicate event first when trimming history.
setopt hist_ignore_all_dups   # Delete an old recorded event if a new event is a duplicate.
setopt hist_ignore_dups       # Don't save an event that was just saved again.
setopt hist_find_no_dups      # Do not display a previously found event.
setopt hist_ignore_space      # Do not record an event starting with a space.
setopt hist_reduce_blanks     # Remove extra blanks from commands added to the history list.
setopt hist_save_no_dups      # Do not write a duplicate event to the history file.
setopt hist_verify            # Do not execute immediately upon history expansion.
setopt hist_beep              # Beep when accessing non-existent history.

# If the history needs to be trimmed to add the current command line, setting
# hist_expire_dups_first will cause the oldest duplicate history to be lost
# before losing a unique entry from the list. Be sure to set the value of
# HISTSIZE to a larger number than SAVEHIST in order to allow room for the
# duplicated events, otherwise this option will behave like hist_ignore_all_dups
# once the history fills up with unique events.
export HISTSIZE=10000
export SAVEHIST=100000
export HISTFILE=${XDG_DATA_HOME:-~/.local/share}/zsh/zhistory

setopt auto_pushd         # Push the current directory visited on the stack.
setopt pushd_ignore_dups  # Do not store duplicates in the stack.
setopt pushd_silent       # Do not print the directory stack after pushd or popd.

# Enable run-help
# https://zsh.sourceforge.io/Doc/Release/User-Contributions.html#Accessing-On_002dLine-Help
export HELPDIR=/usr/share/zsh/`zsh --version | cut -d ' ' -f2`/help
unalias run-help 2>/dev/null
autoload run-help

# https://github.com/sharkdp/bat?tab=readme-ov-file#man
if type bat &>/dev/null; then
  export MANPAGER="sh -c 'sed -u -e \"s/\\x1B\[[0-9;]*m//g; s/.\\x08//g\" | bat -p -lman'"
fi

# PATH is cleared on arch switch. Make it available in x86. @see arch-toggle
# fallback to OS provided vim.
if type nvim &>/dev/null; then
  export EDITOR=nvim
elif test -r /opt/homebrew/bin/nvim; then
  export EDITOR=/opt/homebrew/bin/nvim
else
  export EDITOR=vim
fi
export LESS='-Ri'
