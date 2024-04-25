#!/usr/bin/env bash

BATPIPE_VIEWERS=7z

viewer_7z_supports() {
	command -v "7z" &> /dev/null || return 1

	case "$1" in
		*.7z) return 0 ;;
    *)    return 1 ;;
	esac
}

viewer_7z_process() {
  7z l "$1"; return $?
}
