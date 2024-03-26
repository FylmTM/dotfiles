#!/bin/sh
brew tap homebrew/cask-fonts

brew install \
    awscli \
    bat \
    direnv \
    deno \
    dos2unix \
    enpass \
    entr \
    fd \
    fish \
    fzf \
    fnm \
    git-delta \
    git-lfs \
    htop \
    helm \
    iterm2 \
    jetbrains-toolbox \
    jq \
    kubectl \
    llvm \
    lsd \
    neovim \
    node \
    orbstack \
    prettyping \
    procs \
    pkg-config \
    ripgrep \
    rectangle \
    starship \
    stats \
    tokei \
    zoxide \
    visual-studio-code \
    watch \
    oven-sh/bun/bun \
    homebrew/cask-fonts/font-hack-nerd-font \
&& echo "Done!"
