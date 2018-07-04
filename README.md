# Dotfiles

## Install
Just clone them in home directory.

```
$ git clone git@github.com:FylmTM/dotfiles.git ~/.dotfiles
```

TL;DR;

```
git config --global core.excludesfile '~/.gitignore_global'
ln -fs ~/.dotfiles/home/gitignore_global ~/.gitignore_global
ln -fs ~/.dotfiles/home/zshrc ~/.zshrc
ln -fs ~/.dotfiles/home/tmux.<os>.conf ~/.tmux.conf
ln -fs ~/.dotfiles/home/vimrc ~/.vimrc
ln -fs ~/.dotfiles/home/ideavimrc ~/.ideavimrc
```

#### Git

```
# .gitconfig
[core]
    excludesfile = ~/.gitignore_global
    autocrlf = input
[user]
    email = <email>
    name = <name>
[color]
    ui = true
# Push current branch
[push]
    default = tracking
# Save credentials via HTTP
[credential]
    helper = cache --timeout=28800
[gui]
    encoding = utf-8
[merge]
    tool = meld
[alias]
    showaliases = config --get-regexp alias
[color "branch"]
    current = yellow reverse
    local = yellow
    remote = green
[color "diff"]
    meta = yellow bold
    frag = magenta bold
    old = red bold
    new = green bold
[color "status"]
    added = yellow
    changed = green
    untracked = cyan
```

## ZSH

Install [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh). 

Install several plugins for oh-my-zsh:
```shell
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
```

## Tools

* [Guake](https://github.com/Guake/guake)
  * Drop-down terminal (ala Quake console)
* [Tmux](https://github.com/tmux/tmux/wiki)
  * tmux is a terminal multiplexer
* [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
  * A delightful community-driven (with 1,000+ contributors) framework for managing your zsh configuration
* [Albert](https://github.com/albertlauncher/albert)
  * A fast and flexible keyboard launcher
* [fzf](https://github.com/junegunn/fzf)
  * A command-line fuzzy finder
* [HTTPie](https://github.com/jakubroztocil/httpie)
  * Modern command line HTTP client – user-friendly curl alternative
* [jq](https://github.com/stedolan/jq)
  * jq is a lightweight and flexible command-line JSON processor

