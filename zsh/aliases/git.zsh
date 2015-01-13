#!/bin/zsh

alias -g groot='"$(git rev-parse --show-toplevel)"'
alias repo='basename groot'
alias chg='git status --porcelain | cut -c 4- | grep -v lock'
alias lastchange='git diff-tree --no-commit-id --name-only -r HEAD | grep -v lock'
alias ochg='(cd groot && vim $(chg))'
alias olast='(cd groot && vim $(lastchange))'
alias last-tag="git tag --sort=v:refname | egrep '^[v]*\d+(?:\.\d+)*' | tail -n 1"