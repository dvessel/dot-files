#!/usr/bin/env zsh

# Load order of dotfiles:
# 1. ~/.zshenv
# 2. ~/.config/zsh/.zprofile
# 3. ~/.config/zsh/.zshrc
# 4. ~/.config/zsh/.zlogin <-

# Store persistent dirstack.
if [[ -f $XDG_CACHE_HOME/zdirs && ${#dirstack} < 1 ]]; then
  dirstack=( ${(uf)"$( < $XDG_CACHE_HOME/zdirs )"} )
fi
function chpwd {
  dirs -pl >! $XDG_CACHE_HOME/zdirs
}

# Disable session persistence when running Terminal.app.
# It leaves behind .zsh_sessions which can turn to bloat.
if [[ $TERM_PROGRAM == Apple_Terminal ]]; then
  export SHELL_SESSIONS_DISABLE=1
fi
