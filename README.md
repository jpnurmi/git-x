# Git X

Git extensions with ato-completion for Bash.

## Installation

```sh
$ git clone https://github.com/jpnurmi/git-x.git ~/.git-x
$ echo 'source ~/.git-x/git-x.sh' >> ~/.bashrc
```

## Usage

### `git-remote-dup`

Duplicates a Git remote. Commonly used remote names can be specified via the
`GIT_REMOTE_DUP` environment variable.

```sh
$ git remote -v
origin	git@github.com:jpnurmi/git-x.git (fetch)
origin	git@github.com:jpnurmi/git-x.git (push)

$ export GIT_REMOTE_DUP="foo bar"

$ git remote-dup origin <TAB><TAB>
bar      foo      -h       --help   --https  --ssh

$ git remote-dup origin foo
foo	git@github.com:foo/git-x.git (fetch)
foo	git@github.com:foo/git-x.git (push)
origin	git@github.com:jpnurmi/git-x.git (fetch)
origin	git@github.com:jpnurmi/git-x.git (push)

$ git-remote-dup --https origin bar
bar	https://github.com/bar/git-x.git (fetch)
bar	https://github.com/bar/git-x.git (push)
foo	git@github.com:foo/git-x.git (fetch)
foo	git@github.com:foo/git-x.git (push)
origin	git@github.com:jpnurmi/git-x.git (fetch)
origin	git@github.com:jpnurmi/git-x.git (push)
```

### `git-remote-tidy`

Batch-deletes matching remote branches and tags.

```sh
$ git remote-tidy origin f* bar
To github.com:jpnurmi/git-x.git
 - [deleted]         foo
 - [deleted]         bar
```
