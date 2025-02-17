#!/usr/bin/env zsh

# Enable caching for any completions which use it and set its path.
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ${XDG_CACHE_HOME:-~/.cache}/zsh/zcompcache

# Case insensitive autocomplete and globbing.
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
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
export HISTFILE=~/.zhistory

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
