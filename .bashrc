# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

######################################

# \u: username
# \h: hostname
# \w: full path of the current working directory
# \t: current time in the hh:mm:ss format
# \@: hh:mm am/pm

# \e[: begin of color prompt
# x;ym: color code.
# \e[m: end of color prompt

color_black='\e[0;30m';
color_red='\e[0;31m';
color_green='\e[0;32m';
color_yellow='\e[0;33m';
color_blue='\e[0;34m';
color_purple='\e[0;35m';
color_cyan='\e[0;36m';
color_white='\e[0;37m';
color_end='\e[0m'
export PS1="${color_cyan}PC-\t:${color_yellow} \w${color_end}\n\$ "

# some more ls aliases
alias ls='ls --color=auto'
alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'

export home="/home/jayyoung"

alias cdawesome="cd $home/.config/awesome"
alias cdd="cd /media/d"
alias cdc="cd /media/c"
alias cdwin="cd /media/c/Users/JayYoung/Desktop"

alias vimbashrc="vim $home/.bashrc"
alias vimvimrc="sudo vim /etc/vim/vimrc"
alias vimtmux="sudo vim $home/.tmux.conf"
alias vimawesomerc="sudo vim $home/.config/awesome/rc.lua"

alias eclipse="/opt/eclipse/eclipse"

alias reload="source $home/.bashrc"
alias httpserver="python -m SimpleHTTPServer"
alias httpserver2='python $home/nutstore/simplehttpserver.py'

alias md2html="python -m markdown -x markdown.extensions.toc -x markdown.extensions.codehilite -x markdown.extensions.tables -x markdown.extensions.smarty -x mathjax"

alias findd='find -type d -name'        #find dir
alias findf='find -type f -name'        #find file

alias jc='ps -ef | grep'
alias k9='kill -9'  # kill 进程
alias sz='du -sh'


# alias tarhelp='echo -e "打包压缩: tar -zcvf dir.tar.gz dir\n解包解压: tar -zxvf dir.tar.gz"'
alias shellhelp="ls $HOME/shellhelp"
alias shellhelp-tar="more $HOME/shellhelp/tar.txt"
alias shellhelp-gzip="more $HOME/shellhelp/gzip.txt"
alias shellhelp-sort="more $HOME/shellhelp/sort.txt"
alias shellhelp-find="more $HOME/shellhelp/find.txt"
alias shellhelp-cat="more $HOME/shellhelp/cat.txt"
alias shellhelp-tee="more $HOME/shellhelp/tee.txt"
alias shellhelp-tr="more $HOME/shellhelp/tr.txt"
alias shellhelp-xargs="more $HOME/shellhelp/xargs.txt"
alias shellhelp-uniq="more $HOME/shellhelp/uniq.txt"
alias shellhelp-awk="more $HOME/shellhelp/awk.txt"
alias shellhelp-cut="more $HOME/shellhelp/cut.txt"
alias shellhelp-xila="more $HOME/shellhelp/xila.txt"
alias shellhelp-split="more $HOME/shellhelp/split.txt"
alias shellhelp-csplit="more $HOME/shellhelp/csplit.txt"
alias shellhelp-rename="more $HOME/shellhelp/rename.txt"
alias shellhelp-comm="more $HOME/shellhelp/comm.txt"
alias shellhelp-tree="more $HOME/shellhelp/tree.txt"
alias shellhelp-re="more $HOME/shellhelp/re.txt"
alias shellhelp-grep="more $HOME/shellhelp/grep.txt"
alias shellhelp-sed="more $HOME/shellhelp/sed.txt"
alias shellhelp-wget="more $HOME/shellhelp/wget.txt"
alias shellhelp-du-df="more $HOME/shellhelp/du-df.txt"
alias shellhelp-import="more $HOME/shellhelp/import.txt"
alias shellhelp-convert="more $HOME/shellhelp/convert.txt"

alias pythonhelp-str-format="more $HOME/pythonhelp/str.format.txt"
alias pythonhelp-strftime="more $HOME/pythonhelp/strftime.txt"
alias vimhelp-re="more $HOME/vimhelp/re.txt"

alias cman='man -M /usr/local/zhman/share/man/zh_CN'
# set -o vi
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000000
HISTFILESIZE=2000000

set term=xterm-256color

######################################

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

export NVM_DIR="/home/jayyoung/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
