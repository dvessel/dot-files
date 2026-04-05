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

# Docker config home.
export DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.config/docker}
