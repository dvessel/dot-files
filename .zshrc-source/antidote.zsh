type antidote &>/dev/null || return

# mattmc3/zephyr plugins:zfunctions
ZFUNCDIR=~/.local/zfunctions

# mattmc3/zephyr plugins:zman
ZMAN_URL=https://zsh-manual.netlify.app

# zsh-users/zsh-history-substring-search
for k in '^[[A' '^P'; bindkey $k history-substring-search-up
for k in '^[[B' '^N'; bindkey $k history-substring-search-down
HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1
HISTORY_SUBSTRING_SEARCH_FUZZY=1
