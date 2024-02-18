#!/bin/sh

export PATH="$(dirname "${BASH_SOURCE[0]:-$0}"):$PATH"

_complete_git_remote_dup() {
    local cur=${COMP_WORDS[COMP_CWORD]}
    local opts="-h --help --https --ssh"
    local remotes="$GIT_REMOTE_DUP"
    COMPREPLY=($(compgen -W "$opts $remotes" -- $cur))
}
complete -F _complete_git_remote_dup git-remote-dup
