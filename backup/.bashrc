# ============== IZ .zshenv ==============

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

alias d="sudo dnf"
alias D="sudo dnf -y"

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

# funny star ward thing
alias starwars="telnet towel.blinkenlights.nl"

alias term="exec alacritty&" # Opens terminal in current directory

# Potencijalne boje (staviti u F{}) 196 160, Lex Fridman inspired
PS1="%F{196}%~$%f "


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




