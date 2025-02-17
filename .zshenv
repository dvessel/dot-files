#!/usr/bin/env zsh

# https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
export XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
export XDG_STATE_HOME=${XDG_STATE_HOME:-$HOME/.local/state}

# Disable session persistence when running Terminal.app.
# It leaves behind ~/.zsh_sessions which can turn to bloat.
if [[ $TERM_PROGRAM == Apple_Terminal ]]; then
  export SHELL_SESSIONS_DISABLE=1
fi
