# Dotfiles

## Install

```
git clone git@github.com:FylmTM/dotfiles.git ~/.dotfiles

ln -fs ~/.dotfiles/home/gitignore_global ~/.gitignore_global
ln -fs ~/.dotfiles/home/fishrc ~/.config/fish/config.fish
ln -fs ~/.dotfiles/home/tmux.<os>.conf ~/.tmux.conf
ln -fs ~/.dotfiles/home/vimrc ~/.vimrc
ln -fs ~/.dotfiles/home/ideavimrc ~/.ideavimrc
```

## Git config

```
# .gitconfig
[core]
    excludesfile = ~/.gitignore_global
    autocrlf = input
    safecrlf = true
[user]
    email = dmitry@vrublevsky.me
    name = Dmitry Vrublevsky
[color]
    ui = true
[push]
    default = nothing
[credential]
    helper = cache --timeout=28800
[gui]
    encoding = utf-8
[alias]
    showaliases = config --get-regexp alias
    review = push origin HEAD:refs/for/master
    amend = commit --amend --no-edit --date=now
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
[pager]
    diff = diff-so-fancy | less --tabs=1,5 -RFX
    show = diff-so-fancy | less --tabs=1,5 -RFX
[merge]
    ff = only
[pull]
    ff = only
```

## Software

*Personal:*

- Chrome
- Enpass

*Tooling:*

- Guake
- Fish
- Tmux
- FZF
- Docker
- Docker Compose
- HTTPie
- jq
- bat
- htop
- prettyping
- tldr
- exa
- pretty-diff

*Development:*

- VIM
- Jetbrains Toolbox
  - IntelliJ IDEA Ultimate

