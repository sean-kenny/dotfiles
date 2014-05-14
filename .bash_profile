#!/usr/bin/env bash

# Load RVM, if you are using it
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

#Prompt
function _git_prompt() {
    local git_status="`git status -unormal 2>&1`"
    if ! [[ "$git_status" =~ Not\ a\ git\ repo ]]; then
        if [[ "$git_status" =~ nothing\ to\ commit ]]; then
            local ansi=42
        elif [[ "$git_status" =~ nothing\ added\ to\ commit\ but\ untracked\ files\ present ]]; then
            local ansi=43
        else
            local ansi=45
        fi
        if [[ "$git_status" =~ On\ branch\ ([^[:space:]]+) ]]; then
            branch=${BASH_REMATCH[1]}
        else
            # Detached HEAD.  (branch=HEAD is a faster alternative.)
            branch="(`git describe --all --contains --abbrev=4 HEAD 2> /dev/null ||
                    echo HEAD`)"
        fi
        echo -n ' \[\e[0;37;'"$ansi"';1m\]'"$branch"'\[\e[0m\]'
    fi
}
function _prompt_command() {
    PS1="\A \[\033[1m\]\w\[\033[0m\]`_git_prompt`\$ "
}
PROMPT_COMMAND=_prompt_command

#History
export HISTIGNORE="&:ls:[bf]g:exit"
export HISTSIZE=5000
shopt -s cmdhist

#Aliases
alias gff="git flow feature"
alias ls="ls -G"

#Includes
if [ -f ~/.profile ]; then
    . ~/.profile
fi
if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi
if [ -d ~/.bash_completion.d ]; then
    . ~/.bash_completion.d/*
fi
