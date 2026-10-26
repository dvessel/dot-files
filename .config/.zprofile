#!/usr/bin/env zsh

# Load order of dotfiles:
# 1. ~/.zshenv
# 2. ~/.config/.zprofile <-
# 3. ~/.config/.zshrc
# 4. ~/.config/.zlogin

# Create XDG directories.
for xdg (XDG_{CONFIG,CACHE,DATA,STATE}_HOME) mkdir -p ${(P)xdg}
unset xdg

# Powerlevel10k instant prompt.
instantprompt=$XDG_CACHE_HOME/p10k-instant-prompt-${(%):-%n}.zsh
[[ -f $instantprompt ]] && source $instantprompt
unset instantprompt

# Recommended post-install step for homebrew shell integration (through eval)
# replaced for arch switching and speed through direct sourcing.
#
# Initialize Homebrew.
#   0) Native ARM.
#   1) Translated x86.
brewshellenv=$XDG_CACHE_HOME/zsh/brew-shellenv.zsh
case $( sysctl -n sysctl.proc_translated ) in
  0) brewprefix=/opt/homebrew ;;
  1) brewprefix=/usr/local brewshellenv=${brewshellenv:r}-x86_64.zsh ;;
esac
# Rebuild from `brew shellenv` when shellenv.sh is newer.
if [[ ! $brewshellenv -nt $brewprefix/Library/Homebrew/cmd/shellenv.sh ]]
then
  mkdir -p ${brewshellenv:h}
  $brewprefix/bin/brew shellenv >| $brewshellenv
fi
source $brewshellenv
unset brewprefix brewshellenv
