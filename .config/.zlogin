#!/usr/bin/env zsh

# Load order of dotfiles:
# 1. ~/.zshenv
# 2. ~/.config/.zprofile
# 3. ~/.config/.zshrc
# 4. ~/.config/.zlogin <-

# Load dirstack.
if [[ -f $XDG_STATE_HOME/zdirstack && ${#dirstack} < 1 ]]
then dirstack=( ${(uf)"$( < $XDG_STATE_HOME/zdirstack )"} )
fi
# zsh hook function called on cd. Writes to persistent dirstack.
function chpwd {
  print -l -- ${(fu)"$( dirs -pl )"} >! $XDG_STATE_HOME/zdirstack
}

