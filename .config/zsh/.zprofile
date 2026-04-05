#!/usr/bin/env zsh

# Load order of dotfiles:
# 1. ~/.zshenv
# 2. ~/.config/zsh/.zprofile <-
# 3. ~/.config/zsh/.zshrc
# 4. ~/.config/zsh/.zlogin

# Powerlevel10k instant prompt.
test ! -f $XDG_CACHE_HOME/p10k-instant-prompt-${(%):-%n}.zsh \
|| source $XDG_CACHE_HOME/p10k-instant-prompt-${(%):-%n}.zsh

# Homebrew options.
export HOMEBREW_NO_ENV_HINTS=1
export HOMEBREW_AUTO_UPDATE_SECS=3600

() {
  local xdg
  for xdg in $@; [[ -d ${(P)xdg} ]] || mkdir -p ${(P)xdg}
} XDG_{CONFIG,CACHE,DATA,STATE}_HOME

() {
  local prefix
  # Initialize Homebrew.
  #   0) Native ARM.
  #   1) Translated x86.
  case `sysctl -n sysctl.proc_translated` in
    0) prefix=/opt/homebrew ;;
    1) prefix=/usr/local ;;
  esac
  # Rebuild from `brew shellenv` when shellenv.sh is newer.
  if test ! $1 -nt $prefix/Library/Homebrew/cmd/shellenv.sh; then
    mkdir -p $1:h
    $prefix/bin/brew shellenv 2>&1 >| $1
  fi
  source $1
} $XDG_CACHE_HOME/zsh/brew-shellenv-`uname -m`.zsh
