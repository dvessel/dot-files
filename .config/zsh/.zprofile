#!/usr/bin/env zsh

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
