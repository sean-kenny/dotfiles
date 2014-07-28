if [ -d ~/.zsh/git-prompt ]; then
    source ~/.zsh/git-prompt/zshrc.sh
    PROMPT='%B%m%~%b$(git_super_status) %# '
fi

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory extendedglob notify
unsetopt beep
bindkey -v
zstyle :compinstall filename '/home/sean/.zshrc'

autoload -Uz compinit
compinit

if [ -e ~/.shell_aliases ]; then
    source ~/.shell_aliases
fi

source ~/.fzf.zsh
