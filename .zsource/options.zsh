#!/usr/bin/env zsh

# Enable caching for any completions which use it and set its path.
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ${XDG_CACHE_HOME:-~/.cache}/zsh/zcompcache

# Case insensitive autocomplete and globbing.
# @see man zshcompwid -> “COMPLETION MATCHING CONTROL”
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
setopt no_case_glob

setopt auto_pushd         # Push the current directory visited on the stack.
setopt pushd_ignore_dups  # Do not store duplicates in the stack.
setopt pushd_silent       # Do not print the directory stack after pushd or popd.

setopt share_history          # Reads/writes history to keep sessions in sync.
                              # Overlaps with inc_append_history & extended_history.
setopt extended_history       # Force saves with timestamps. Could get lost on trim.
setopt hist_expire_dups_first # Drop duplicate event first when trimming history.
setopt hist_save_no_dups      # Do not write a duplicate event to the history file.
setopt hist_ignore_dups       # Don't save an event that was just saved again.
setopt hist_ignore_space      # Remove record an event starting with a space.
setopt hist_reduce_blanks     # Remove superfluous blanks from each command line.
setopt hist_find_no_dups      # Do not display a previously found event.
setopt hist_verify            # Do not execute immediately upon history expansion.

export HISTFILE=${XDG_DATA_HOME:-~/.local/share}/zsh/zhistory
export HISTSIZE=1000000
export SAVEHIST=833333    # 833333 x 1.2 = 999,999.6 | Stay under HISTSIZE.
                          # With `share_history` enabled, the history file will be
                          # trimmed and rewritten when it grows 20% of SAVEHIST.

# Enable run-help
# https://zsh.sourceforge.io/Doc/Release/User-Contributions.html#Accessing-On_002dLine-Help
export HELPDIR=/usr/share/zsh/`zsh --version | cut -d ' ' -f2`/help
unalias run-help 2>/dev/null
autoload run-help

if type nvim &>/dev/null; then
  export EDITOR=nvim
elif test -r /opt/homebrew/bin/nvim; then
  # PATH is cleared on arch switch. Make it available in x86. @see arch-toggle
  export EDITOR=/opt/homebrew/bin/nvim
else
  export EDITOR=vim
fi

# Neovim pager.
if type nvimpager &>/dev/null; then
  export PAGER=nvimpager
fi

export LESS='-RFi'
