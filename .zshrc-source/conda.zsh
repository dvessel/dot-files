type brew &>/dev/null || return

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$("`brew --prefix`/Caskroom/miniconda/base/bin/conda" 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "`brew --prefix`/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "`brew --prefix`/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    elif [ -d "`brew --prefix`/Caskroom/miniconda/base/bin" ]; then
        export PATH="`brew --prefix`/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
