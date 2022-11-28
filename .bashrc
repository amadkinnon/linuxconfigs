# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Set pass as the vault backend
export AWS_VAULT_BACKEND=pass

setenv ()
{
    eval $1=\"$2\"
    export $1
}


set -o vi
setenv EDITOR vim
export TERM=xterm-256color
export TERMCAP=
export CXX=g++
export CC=gcc

#if ! [[ -z $TMUX ]]; then
#    powerline-config tmux setup
#fi

if [ -f /bin/bash ]; then
    setenv SHELL /bin/bash
fi

if command pass &> /dev/null; then
    export GITHUB_OAUTH_TOKEN=$(pass github/PAT)
fi

# Remap caps lock to escape
#setxkbmap -option 'caps:ctrl_modifier'
#xcape -e 'Caps_Lock=Escape'

# avoid duplicates..
export HISTCONTROL=ignoredups:erasedups

# Set GPG_TTY
export GPG_TTY=$(tty)

# append history entries..
shopt -s histappend

# After each command, save and reload history
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

setenv LS_COLORS 'di=36:ex=32:ln=01;36:or=05;43;34;7'
LS_OPTIONS='--color=auto'
export LS_OPTIONS

alias cd=cd_func
alias df='df -h'
alias dr='cd ~/dev;ls'
alias gdr='cd ~/go/src/github.com;ls'
alias h='history'
alias kc='kubectl'
alias kcb='kubectl -n backstage'
alias la='ls -a'
alias ldpath="perl -e 'print \"\$_\n\" for (split(/:/,\$ENV{LD_LIBRARY_PATH}))'"
alias logs='cd /var/tmp'
alias ls='ls $LS_OPTIONS'
alias lss='ls -ltr | sort -n -k 5 | more'
alias pa='php artisan'
alias path="perl -e 'print \"\$_\n\" for (split(/:/,\$ENV{PATH}))'"
alias pl='aws-vault exec sb-amackinnon -- kubectl logs --namespace=backstage -f $(aws-vault exec sb-amackinnon -- kubectl get pods -n backstage | grep backstage | grep -v terminating | awk '\''{print $1}'\'')'
alias sb='source ~/.bashrc'
alias sp='source ~/.profile'
alias tmx="tmux a -d || tmux new-session \; split-window -h \; send-keys 'powerline-config tmux setup;clear' C-m \; resize-pane -R 1 \; select-pane -t 0 \;"
alias vi='vim -X'
alias www='cd /var/www;ls'
alias dcln='docker rm $(docker ps -aq -f status=exited -f status=created) && docker rmi -f $(docker images | grep -v node | awk '\''{print $3}'\'')'
alias subs='cp ~/tmpbackstage/dev-secrets.yaml ~/dev/backstage/k8s/backstage && cp ~/tmpbackstage/app-config.yaml ~/dev/backstage/'
alias pomo='alacritty -e tomatoshell &'
alias fact81='BT_FACTFETCHER_FETCHINTERVAL=10h BT_AUTHTYPE=PAT BT_PLAYGROUND=true BT_LOGLEVEL=debug BT_MODE=debug BT_SERVER_PORT=8081 BT_HEALTH_PORT=8084 BT_METRICS_PORT=8085 dist/factorium server'

# Git aliases
alias gitl='git log --pretty=oneline --abbrev-commit'
alias gitfp='git fetch && git pull'
alias gitfpm='git checkout master && git fetch && git pull'
alias gitfpmn='git checkout main && git fetch && git pull'

cd_func ()
{
    if [ "$2" != "" ]; then
        gcd "$@"
        return
    fi
    $builtin cd $*

    GIT_BRANCH=$(git symbolic-ref --short HEAD 2>/dev/null)
    if [ "$GIT_BRANCH" != "" ]; then
        GIT_BRANCH="[git:$GIT_BRANCH]"
    fi

    titlebar_start='\[\e[0;'
    titlebar_end='\[\007[0;'
    fgs='\[\e[38;5;'
    bgs='\[\e[48;5;'
    fge='\[\e[m\]'
    bold='\[\e[1m\]'
    workingDir="$bold${fgs}228m\][\w]$fge"
    gitInfo="${fgs}117m\]${GIT_BRANCH}$fge"
    userInfo="$bold${fgs}31m\]\u${fge}"
    hostInfo="${fgs}215m\][\h]${fge}"
    PS1="$workingDir$gitInfo\n$userInfo $ "
}

gcd ()
{
    cd `pwd | sed -e "s;$1;$2;"`
}

cdup ()
{
    n=$1
    while [ $n != 0 ]; do
        cd ..
        n=$(expr $n - 1)
    done
    pwd
}

cd .

# User specific aliases and functions

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Enable jfrog cli completion
source /home/adam/.jfrog/jfrog_bash_completion
