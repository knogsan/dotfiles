#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

## Aliasの設定
# core
alias ls='ls -G'
alias l='ls'
alias ll='ls -la'
alias rm='rm -i'

# git
alias gs='git status'
alias gst='git status'
alias gl='git log --graph'
alias glog='git log --graph'
alias gch='git checkout'
alias gcb='git checkout -b'
alias gbr='git branch'
alias gad='git add'
alias gadd='git add'
alias gco='git commit'
alias gcom='git commit -m'
alias gd='git diff'
alias gdf='git diff'
alias gdc='git diff --cached'
alias gds='git diff --staged'
alias gfetch='git fetch'
alias gpll='git pull'
alias gpsh='git push'
alias gshow='git show'
alias gclean='git clean'
alias gstash='git stash'
alias greset='git reset'
alias gresetsoft='git reset --soft HEAD^'
alias gresethard='git reset --hard HEAD^'
alias gcpick='git cherry-pick'

# related to rails
alias be='bundle exec'
alias rs='bundle exec rails s'
alias rc='bundle exec rails c'
alias rdb='bundle exec rails dbconsole'
