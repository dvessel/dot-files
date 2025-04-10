#!/usr/bin/env zsh

() {
  if [[ ! -s $1 ]]; then
    mkdir -p $1:h
    # Initialize Homebrew.
    #   0) Native ARM.
    #   1) Translated x86.
    case `sysctl -n sysctl.proc_translated` in
      0) /opt/homebrew/bin/brew shellenv ;;
      1) /usr/local/bin/brew shellenv ;;
    esac 2>/dev/null >| $1
  fi
  source $1
} $XDG_CACHE_HOME/zsh/brew-shellenv-`uname -m`.zsh
