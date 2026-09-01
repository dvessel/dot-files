#!/usr/bin/env zsh

# Load order of dotfiles:
# 1. ~/.zshenv
# 2. ~/.zprofile
# 3. ~/.zshrc
# 4. ~/.zlogin <-

# Store persistent dirstack.
if [[ -f $XDG_CACHE_HOME/zdirs && ${#dirstack} < 1 ]]
then
  dirstack=( ${(uf)"$( < $XDG_CACHE_HOME/zdirs )"} )
fi
function chpwd {
  dirs -pl >! $XDG_CACHE_HOME/zdirs
}

