if status is-interactive
and not set -q TMUX
    exec tmux
end

if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
    fisher add matchai/spacefish
end

set fish_greeting

if test -e ~/.config/fish/environment.fish
    . ~/.config/fish/environment.fish
end

function fish_user_key_bindings
    fzf_key_bindings
end

# General
alias e='exit'
alias clr='clear'
alias hosts='sudo vim /etc/hosts'

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
alias ls='exa'
alias ll='exa --long'
alias la='exa --long --all'
alias lst='exa --tree'
alias vim='nvim'

# Environment
export EDITOR=nvim
export BROWSER=google-chrome-stable

# Kubernetes
function kubectl-set-context
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

# Theme
export SPACEFISH_DIR_TRUNC=0
export SPACEFISH_PACKAGE_SHOW=false
export SPACEFISH_DOCKER_SHOW=false
export SPACEFISH_RUBY_SHOW=false
export SPACEFISH_NODE_SHOW=false
export SPACEFISH_GOLANG_SHOW=false
export SPACEFISH_BATTERY_SHOW=false
export SPACEFISH_EXIT_CODE_SHOW=true
