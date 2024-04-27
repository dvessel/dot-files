
# https://zsh.sourceforge.io/Doc/Release/Options.html

# Case insensitive autocomplete and globbing.
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
setopt no_case_glob

# Word boundaries for keyboard traversal. Defaults: *?_-.[]~=/&;!#$%^(){}<>
WORDCHARS='*?_-.[]~&:;!#$%^<>'

setopt share_history          # Reads/writes history to keep sessions in sync.
                              # inc_append_history not needed.
setopt extended_history       # Extended format required when the history file
                              # is trimed. share_history shares the same format.
setopt hist_expire_dups_first # Drop duplicate event first when trimming history.
setopt hist_ignore_dups       # Don't save an event that was just saved again.
setopt hist_find_no_dups      # Do not display a previously found event.
setopt hist_ignore_space      # Do not record an event starting with a space.
setopt hist_verify            # Do not execute immediately upon history expansion.
setopt hist_beep              # Beep when accessing non-existent history.

# If the history needs to be trimmed to add the current command line, setting
# hist_expire_dups_first will cause the oldest duplicate history to be lost
# before losing a unique entry from the list. Be sure to set the value of
# HISTSIZE to a larger number than SAVEHIST in order to allow room for the
# duplicated events, otherwise this option will behave like hist_ignore_all_dups
# once the history fills up with unique events.
HISTSIZE=6000
SAVEHIST=5000

setopt AUTO_PUSHD         # Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS  # Do not store duplicates in the stack.
setopt PUSHD_SILENT       # Do not print the directory stack after pushd or popd.

VISUAL=nvim
EDITOR=nvim
