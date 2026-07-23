#!/usr/bin/env zsh

# Load order of dotfiles:
# 1. ~/.zshenv
# 2. ~/.config/zsh/.zprofile
# 3. ~/.config/zsh/.zshrc
# 4. ~/.config/zsh/.zlogin <-

# Store persistent dirstack.
if [[ -f $XDG_CACHE_HOME/zdirs && ${#dirstack} < 1 ]]
then
  dirstack=( ${(uf)"$( < $XDG_CACHE_HOME/zdirs )"} )
fi
function chpwd {
  dirs -pl >! $XDG_CACHE_HOME/zdirs
}

