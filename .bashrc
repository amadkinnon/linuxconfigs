# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=
export CVSROOT=adam.mackinnon@cvs.newpace.ca:/var/lib/cvs
export CVS_RSH=ssh

setenv ()
{
    eval $1=\"$2\"
    export $1
}

set -o vi
setenv EDITOR vim
export TERM=xterm-256color
export TERMCAP=

#if ! [[ -z $TMUX ]]; then
#    powerline-config tmux setup
#fi

if [ -f /bin/bash ]; then
    setenv SHELL /bin/bash
fi

# Remap caps lock to escape
#setxkbmap -option 'caps:ctrl_modifier'
#xcape -e 'Caps_Lock=Escape'

setenv LS_COLORS 'di=36:ex=32:ln=01;36:or=05;43;34;7'
#setenv LS_COLORS 'no=00:fi=00:di=01;94:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'
#export LS_COLORS

# Do any arch specific stuff

LS_OPTIONS='--color=auto'
export LS_OPTIONS

alias df='df -h'
alias h='history'
alias la='ls -a'
alias ldpath="perl -e 'print \"\$_\n\" for (split(/:/,\$ENV{LD_LIBRARY_PATH}))'"
alias logs='cd /var/tmp'
alias ls='ls $LS_OPTIONS'
alias lss='ls -ltr | sort -n -k 5 | more'
alias path="perl -e 'print \"\$_\n\" for (split(/:/,\$ENV{PATH}))'"
alias sb='source ~/.bashrc'
alias sp='source ~/.profile'
alias vi='vim -X'
alias pa='php artisan'
alias www='cd /var/www;ls'
alias cd=cd_func
alias godev='cd ~/go/src/sigmastcomms.com/user;ls'
alias npf='cd ~/newpace/NPFrameQA/;ls'

setenv PATH ${PATH}:/usr/sbin
setenv PATH ${PATH}:/usr/local/bin:/usr/local/pgsql/bin:$ORACLE_HOME/bin:~/.composer/vendor/bin

GIT_BRANCH=""

getGitBranch ()
{
   GIT_BRANCH=`git branch 2>/dev/null | grep '*'`
   if [ "$GIT_BRANCH" != "" ]; then
       GIT_BRANCH=${GIT_BRANCH:2}
       GIT_BRANCH="${git_fg}[branch:$GIT_BRANCH]"
   fi
}

cd_func ()
{
    if [ "$2" != "" ]; then
        gcd "$@"
        return
    fi
    $builtin cd $*

    getGitBranch

    fgs='\[\e[38;5;'
    bgs='\[\e[48;5;'
    fge='\[\e[m\]'
    bold='\[\e[1m\]'
    workingDir="$bold${fgs}228m\][\w]$fge"
    gitInfo="${fgs}117m\]${GIT_BRANCH}$fge"
    userInfo="$bold${fgs}31m\]\u${fge}"
    hostInfo="${fgs}215m\][\h]${fge}"
    PS1="$workingDir$gitInfo\n$userInfo$hostInfo $ "
}
getawsarn ()
{
    aws sts get-caller-identity | perl -n -e'print "$1\n" if /Arn.*(arn.*)"/'
}
getawstk ()
{
    unset AWS_ACCESS_KEY_ID;
    unset AWS_SECRET_ACCESS_KEY;
    unset AWS_SESSION_TOKEN;
    if [ "$1" == "" ]; then
        echo "Requires a MFA Token: eg: getawstk 123456";
        return;
    fi;
    TOKEN=$1;
    DURATION=$2;
    test 0$DURATION -lt 3600 && DURATION=3600;
    RESPONSE=$(aws sts get-session-token --output text --serial-number $(aws iam list-mfa-devices --output text --user-name $(id -un) |cut -f 3) --token-code ${TOKEN} --duration-seconds ${DURATION});
    export AWS_ACCESS_KEY_ID=$(echo ${RESPONSE} | grep CREDENTIALS | awk '{print $2}');
    export AWS_SECRET_ACCESS_KEY=$(echo ${RESPONSE} | grep CREDENTIALS | awk '{print $4}' );
    export AWS_SESSION_TOKEN=$(echo ${RESPONSE} |grep CREDENTIALS | awk '{print $5}' )
}

gcd ()
{
    cd `pwd | sed -e "s;$1;$2;"`
}

cdup ()
{
    n=$1
    while [ $n != 0 ];
    do
        cd ..
        n=$(expr $n - 1)
    done
    pwd
}

cd .

# User specific aliases and functions
