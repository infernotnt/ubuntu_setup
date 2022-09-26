## .bash_profile
#
## Get the aliases and functions
#if [ -f ~/.bashrc ]; then
#	. ~/.bashrc
#fi
#
## User specific environment and startup programs

# ============== IZ .zshenv ==============

# Additions to PATH variable
export PATH=~/.scripts:$PATH
export PATH=~/.local/bin:$PATH

# Disables the useless "less" command history file that is usualy put in the home directory
export LESSHISTFILE="-"

# Preferences - environment variables
export EDITOR=nvim
#export VISUAL=nvim
export TERMINAL=alacritty
export BROWSER=brave

