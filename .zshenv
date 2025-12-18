#!/usr/bin/env zsh

# Load order of dotfiles:
# 1. ~/.zshenv <-
# 2. ~/.config/zsh/.zprofile
# 3. ~/.config/zsh/.zshrc
# 4. ~/.config/zsh/.zlogin

# zsh dotfile directory.
export ZDOTDIR=${ZDOTDIR:-$HOME/.config/zsh}

# https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
export XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
export XDG_STATE_HOME=${XDG_STATE_HOME:-$HOME/.local/state}

() {
  local xdg
  for xdg in $@; [[ -d ${(P)xdg} ]] || mkdir -p ${(P)xdg}
} XDG_{CONFIG,CACHE,DATA,STATE}_HOME

# Docker config home.
export DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.config/docker}

# Autoloading zfunctions and zcompletions.
export ZFUNCDIR=${ZFUNCDIR:-$HOME/.local/zfunctions}

# Homebrew options.
export HOMEBREW_NO_ENV_HINTS=1
export HOMEBREW_AUTO_UPDATE_SECS=3600

# Disable session persistence when running Terminal.app.
# It leaves behind .zsh_sessions which can turn to bloat.
if [[ $TERM_PROGRAM == Apple_Terminal ]]; then
  export SHELL_SESSIONS_DISABLE=1
fi
