#!/usr/bin/env zsh

# Initialize Homebrew.
#   0) Native ARM.
#   1) Translated x86.
case `sysctl -n sysctl.proc_translated` in
  0) eval "$(/opt/homebrew/bin/brew shellenv 2>/dev/null)" ;;
  1) eval "$(/usr/local/bin/brew shellenv 2>/dev/null)"    ;;
esac
