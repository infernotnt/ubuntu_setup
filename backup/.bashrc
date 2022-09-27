# Ubuntu default ==================================================
# (not everything from the Ubuntu default is here, but a lot of it is)

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
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

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# =====================================================================

# ============== iz .zshenv ==============

# Additions to PATH variable
export PATH=~/.scripts:$PATH
export PATH=~/.local/bin:$PATH

# Disables the useless "less" command history file that is usualy put in the home directory
export LESSHISTFILE="-"

# Preferences - environment variables
export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="alacritty"
export BROWSER="brave"


# ==== IZ .zshrc

# Infinite history
HISTSIZE= HISTFILESIZE=

# Disable ctrl-s and ctrl-q
stty -ixon

# Allows you to cd into a directory merly by typing the directory name. Useful for stuf like ".." for going a directory back
shopt -s autocd

alias a="sudo apt"
alias A="sudo apt -y"
alias aupdate="sudo apt update ; sudo apt upgrade"

alias sudo="sudo "
alias o="xdg-open"
alias v="$EDITOR"
alias em="emacsclient -nc"
alias e="$EDITOR"
alias mkdir="mkdir -pv"
alias mkd="mkdir -pv"
alias cp="cp -vi"
alias mv="mv -vi"
alias rm="rm -v"
alias rmdir="rmdir -v"
alias ls="ls -h --color=auto --group-directories-first"
alias grep="grep --color=auto"
alias diff="diff --color=auto"
alias tree="tree -C" # Makes it colored
alias df="df -h"
alias du="du -h"

alias g="git add . ; git commit -m "c" ; git push"

# funny star ward thing
alias starwars="telnet towel.blinkenlights.nl"

alias term="exec gnome-terminal" # Opens terminal in current directory

# Potencijalne boje (staviti u F{}) 196 160, Lex Fridman inspired
#PS1="%F{196}%~$%f "


# Fzf stuff - autocompletion **<TAB> does not work for unknown reasons
source /usr/share/doc/fzf/examples/key-bindings.bash



## Adds color to man pages
#man() {
#    LESS_TERMCAP_md=$'\e[01;31m' \
#    LESS_TERMCAP_me=$'\e[0m' \
#    LESS_TERMCAP_so=$'\e[01;44;33m' \
#    LESS_TERMCAP_se=$'\e[0m' \
#    LESS_TERMCAP_us=$'\e[01;32m' \
#    LESS_TERMCAP_ue=$'\e[0m' \
#    command man "$@"
#}

# Environment variables are in ~/.zshenv
# Path variable is in ~/.zshenv
