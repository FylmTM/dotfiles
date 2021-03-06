####
#### Sensible Bash configuration
#### Adapted from https://github.com/mrzool/bash-sensible/blob/master/sensible.bash
####

## General ##

# Prevent file overwrite on stdout redirection
# Use `>|` to force redirection to an existing file
set -o noclobber

# Update window size after every command
shopt -s checkwinsize

# Automatically trim long paths in the prompt (requires Bash 4.x)
PROMPT_DIRTRIM=10

# Enable history expansion with space
# E.g. typing !!<space> will replace the !! with your last command
bind Space:magic-space

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Perform file completion in a case insensitive fashion
bind "set completion-ignore-case on"

# Display matches for ambiguous patterns at first tab press
bind "set show-all-if-ambiguous on"

# Immediately add a trailing slash when autocompleting symlinks to directories
bind "set mark-symlinked-directories on"

## History ##

# Append to the history file, don't overwrite it
shopt -s histappend

# Save multi-line commands as one command
shopt -s cmdhist

# Record each line as it gets issued
PROMPT_COMMAND='history -a'

# Huge history. Doesn't appear to slow things down, so why not?
HISTSIZE=500000
HISTFILESIZE=100000

# Avoid duplicate entries
HISTCONTROL="erasedups:ignoreboth"

# Don't record some commands
export HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:clear"

# Use standard ISO 8601 timestamp
# %F equivalent to %Y-%m-%d
# %T equivalent to %H:%M:%S (24-hours format)
HISTTIMEFORMAT='%F %T '

# Enable incremental history search with up/down arrows (also Readline goodness)
# Learn more about this here: http://codeinthehole.com/writing/the-most-important-command-line-tip-incremental-history-searching-with-inputrc/
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\e[C": forward-char'
bind '"\e[D": backward-char'

## Navigation ##

# Prepend cd to directory names automatically
shopt -s autocd 2> /dev/null
# Correct spelling errors during tab-completion
shopt -s dirspell 2> /dev/null
# Correct spelling errors in arguments supplied to cd
shopt -s cdspell 2> /dev/null

# This allows you to bookmark your favorite places across the file system
# Define a variable containing a path and you will be able to cd into it regardless of the directory you're in
shopt -s cdable_vars

export work="/c/work"

####
#### Config
####

export EDITOR=vim

####
#### Git aliases
####

alias gst="git status"
alias ga="git add"
alias gl="git pull"
alias gp="git push"
alias gc="git commit"
alias gco="git checkout"
alias gd="git diff"
alias glog="git log"

####
#### Helpful aliases
####

alias e=exit
alias open=explorer
alias direnv-load="eval \"\$(direnv export bash)\""

####
#### Prompt
####

export PS1="\n\[\033[33m\]\w\[\033[36m\]\[\033[0m\]\n$ "

####
#### Conditional environment loads
####

if test -f ~/.env.bash; then
    source ~/.env.bash
fi

####
#### winpty wrapper for some non-msys2 applications
#### Explanation: https://github.com/git-for-windows/build-extra/blob/master/ReleaseNotes.md
####

alias node="winpty $(which node)"
alias gradlew="winpty ./gradlew.bat"

