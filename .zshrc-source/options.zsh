
# https://zsh.sourceforge.io/Doc/Release/Options.html

# Case insensitive autocomplete and globbing.
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
setopt no_case_glob

setopt share_history          # Reads from history when it changes and write to 
                              # it after every command. Output is the same as
                              # extended_history. inc_append_history not needed.
setopt hist_expire_dups_first # Drop duplicate event first when trimming history.
setopt hist_ignore_dups       # Don't save an event that was just saved again.
setopt hist_find_no_dups      # Do not display a previously found event.
setopt hist_ignore_space      # Do not record an event starting with a space.
setopt hist_verify            # Do not execute immediately upon history expansion.
setopt hist_beep              # Beep when accessing non-existent history.

# If the internal history needs to be trimmed to add the current command line,
# setting hist_expire_dups_first will cause the oldest history event that has a
# duplicate to be lost before losing a unique event from the list. You should be
# sure to set the value of HISTSIZE to a larger number than SAVEHIST in order to
# allow some room for the duplicated events, otherwise this option will behave
# just like hist_ignore_all_dups once the history fills up with unique events.
HISTSIZE=12000
SAVEHIST=10000
