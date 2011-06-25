setup-nginx-aliases() {
  NGINX_DICT="${HOME}/opt/nginx"
  NGINX_EXEC="${NGINX_DICT}/sbin/nginx"
  NGINX_CONF="${NGINX_DICT}/conf/nginx.conf"
  NGINX_PID_PATH="${NGINX_DICT}/logs"
  NGINX_PID_FILE="${NGINX_PID_PATH}/nginx.pid"

  alias nginx-start="${NGINX_EXEC} -c ${NGINX_CONF}"
  alias nginx-stop="killall nginx"
  alias nginx-restart="nginx-stop && nginx-start"
  alias nginx-reload="${NGINX_EXEC} -s reload"
  alias nginx-check="${NGINX_EXEC} -t -c ${NGINX_CONF}"
}

# Displaying GIT Branch Name in Console
showup-git-branch() {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# git aliases
alias ga='git add'
alias gb='git branch'
alias gc='git checkout'
alias gcp='git cherry-pick'
alias gd='git diff'
alias gdc='git diff --cached'
alias gl='git log'
alias glr='git shortlog -n -s --no-merges'
alias glo='git log --pretty=oneline'
alias glp='git log -p'
alias gls='git log --stat'
alias glg='git log --pretty=oneline --abbrev-commit --graph --decorate --all'
alias gm='git commit'
alias gmf='git commit --amend'
alias gmr='git commit -C HEAD -a --amend'
alias gpl='git pull'
alias gps='git push'
alias gr='git rebase'
alias grf='git reset HEAD'
alias grc='git reset HEAD^'
alias grs='git reset --soft HEAD^'
alias grh='git reset --hard HEAD^'
alias gs='git status'
alias gst='git stash'

# cmd aliases
if [ $OSTYPE = 'darwin10.0' ]; then
  alias ls='ls -G'
  alias dp1='du -h -d 1'
  alias nginx-restart="kill \`cat /usr/local/var/run/nginx.pid\`"
else
  alias ls='ls --color=auto'
  alias dp1='du -h --max-depth=1'
  alias open='nautilus'
  setup-nginx-aliases
fi
alias ll='ls -l'
alias lla='ls -lFa'
alias la='ls -A'
alias l='ls -CF'
alias clr='clear'
alias fxg='find .|xargs grep'

# use mac TextEdit from command line
if [ $OSTYPE = 'darwin10.0' ]; then
  edit() {
    /Applications/TextEdit.app/Contents/MacOS/TextEdit $@ 2>/dev/null
  }
fi

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

# colorful bash prompt
PS1='\[\033[1;33m\]\u\[\033[1;37m\]@\[\033[1;32m\]\h\[\033[1;37m\]:\[\033[1;31m\]\w\[\033[1;36m\]$(showup-git-branch)\$ \[\033[0m\]'
