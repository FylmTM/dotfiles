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
ln -fs ~/.dotfiles/home/tmux.conf ~/.tmux.conf
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
* [Autojump](https://github.com/joelthelion/autojump)
* [HTTPie](https://github.com/jakubroztocil/httpie)
* [fzf](https://github.com/junegunn/fzf)

