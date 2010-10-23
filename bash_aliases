# git aliases
alias ga='git add'
alias gb='git branch'
alias gc='git checkout'
alias gd='git diff'
alias gdc='git diff --cached'
alias gl='git log'
alias glo='git log --pretty=oneline'
alias glp='git log -p'
alias gls='git log --stat'
alias gm='git commit'
alias gmf='git commit --amend'
alias gmr='git commit -C HEAD -a --amend'
alias gpl='git pull'
alias gps='git push'
alias grf='git reset HEAD'
alias grc='git reset HEAD^'
alias grs='git reset --soft HEAD^'
alias grh='git reset --hard HEAD^'
alias gs='git status'

# ls aliases
alias ls='ls -G'
alias ll='ls -l'
alias lla='ls -lFa'
alias la='ls -A'
alias l='ls -CF'

# Displaying GIT Branch Name in Console
function git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

PS1='\[\033[1;33m\]\u\[\033[1;37m\]@\[\033[1;32m\]\h\[\033[1;37m\]:\[\033[1;31m\]\w\[\033[1;36m\]$(git_branch)\$ \[\033[0m\]'
