#!/bin/sh

export PATH="$(dirname "${BASH_SOURCE[0]:-$0}"):$PATH"

_comp_idx() {
    local idx=0
    for ((i = 1; i < COMP_CWORD; i++)); do
        arg="${COMP_WORDS[i]}"
        if [[ $arg != -* ]]; then
            ((idx++))
            break
        fi
    done
    echo $idx
}

_complete_git_remote_dup() {
    local cur=${COMP_WORDS[COMP_CWORD]}
    local opts="-h --help --fetch --https --ssh"
    local remotes=""
    if [ "$(_comp_idx)" -eq 0 ]; then
        remotes="$(git remote)"
    else
        remotes="$(git config x.remotes)"
    fi
    COMPREPLY=($(compgen -W "$opts $remotes" -- $cur))
}
complete -F _complete_git_remote_dup git-remote-dup

_complete_git_remote_tidy() {
    local cur=${COMP_WORDS[COMP_CWORD]}
    local opts="-h --help --no-branches --no-tags"
    local remotes="$(git remote)"
    COMPREPLY=($(compgen -W "$opts $remotes" -- $cur))
}
complete -F _complete_git_remote_tidy git-remote-tidy
