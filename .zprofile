#!/usr/bin/env zsh

# Initialize Homebrew.
#   0) Native ARM.
#   1) Translated x86.
case `sysctl -n sysctl.proc_translated` in
  0) eval "$(/opt/homebrew/bin/brew shellenv 2>/dev/null)" ;;
  1) eval "$(/usr/local/bin/brew shellenv 2>/dev/null)"    ;;
esac

# Disable session persistence when running Terminal.app.
# It leaves behind ~/.zsh_sessions which can turn to bloat.
if [[ $TERM_PROGRAM == Apple_Terminal ]]; then
  export SHELL_SESSIONS_DISABLE=1
fi
