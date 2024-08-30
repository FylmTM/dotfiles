set fish_greeting

if test -e ~/.config/fish/environment.fish
    . ~/.config/fish/environment.fish
end

# General
alias e='exit'
alias clr='clear'
alias tree="ls --tree"
alias dot="cd ~/.dotfiles"

# Git
abbr grev 'git review'
abbr garev 'git add . ;and git commit -a --amend;and git review'
abbr gp 'git push'
abbr gl 'git pull'
abbr ga 'git add'
abbr gc 'git commit'
abbr gca 'git commit --amend'
abbr gst 'git status'
abbr gd 'git diff'
abbr gco 'git checkout'
abbr gb 'git branch'
abbr glg 'git log --stat'
abbr glog 'git log --oneline --decorate --graph'
alias gwip='git add -A; git rm (git ls-files --deleted) 2> /dev/null; git commit --no-verify -m "--wip-- [skip ci]"'
alias gunwip='git log -n 1 | grep -q -c "\-\-wip\-\-"; and git reset HEAD~1'

# Tooling
alias cat='bat --style=header'
alias ping='prettyping --nolegend'
alias top='htop'
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
alias vim='nvim'
alias find='fd'
alias z='zoxide'

# Environment
export SHELL=/opt/homebrew/bin/fish
export EDITOR=nvim

# Kubernetes
function kubectl-set-namespace
    kubectl config set-context (kubectl config current-context) --namespace=$argv
end

# Docker
function docker-stop-all --description 'Stop and remove all Docker container'
    echo 'Stopping all containers...'
    docker stop (docker ps -a -q)
    echo 'Removing all created containers...'
    docker rm (docker ps -a -q)
    echo 'Done!'
    docker ps -a -q
end

# Helpers
alias w1 'watch -n 1'

# Local utilities
set PATH $HOME/.bin $HOME/.bun/bin /opt/homebrew/bin /opt/homebrew/sbin /usr/local/bin $PATH
set PATH "$HOME/Library/Application Support/JetBrains/Toolbox/scripts" $PATH

export LIBRARY_PATH="$LIBRARY_PATH:$(brew --prefix)/lib"

# Prompt
starship init fish | source

# Direnv
direnv hook fish | source

# Zoxide
zoxide init fish | source

# Golang
set PATH $HOME/go/bin $PATH
export GOPATH=$HOME/go

# Rust
set PATH $HOME/.cargo/bin/ $PATH

# VS Code
string match -q "$TERM_PROGRAM" "vscode"
and . (code --locate-shell-integration-path fish)
