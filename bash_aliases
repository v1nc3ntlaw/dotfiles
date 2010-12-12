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
alias glg='git log --graph --oneline --all'
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
if [ $OSTYPE = 'darwin10.0' ]; then
  alias ls='ls -G'
else
  alias ls='ls --color=auto'
fi
alias ll='ls -l'
alias lla='ls -lFa'
alias la='ls -A'
alias l='ls -CF'

# Setup Amazon EC2 Command-Line Tools
if [ -d ~/.ec2 ]; then
  export EC2_HOME=~/.ec2
  export EC2_URL=https://ap-southeast-1.ec2.amazonaws.com
  export PATH=$PATH:$EC2_HOME/bin
  export EC2_PRIVATE_KEY=`ls $EC2_HOME/pk-*.pem`
  export EC2_CERT=`ls $EC2_HOME/cert-*.pem`
  if [ $OSTYPE = 'darwin10.0' ]; then
    export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home/
  else
    export JAVA_HOME=/usr/lib/jvm/java-6-openjdk
  fi
fi

# Displaying GIT Branch Name in Console
function git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# colorful bash prompt
PS1='\[\033[1;33m\]\u\[\033[1;37m\]@\[\033[1;32m\]\h\[\033[1;37m\]:\[\033[1;31m\]\w\[\033[1;36m\]$(git_branch)\$ \[\033[0m\]'
