# put alias definitions here if you make more
if [ -f ~/.bash_aliases ]; then
     . ~/.bash_aliases
fi

# bash prompt - colors and format
black="\[\033[0m\]"
red="\[\033[0;31m\]"
green="\[\033[0;32m\]"
yellow="\[\033[0;33m\]"
blue="\[\033[1;34m\]"
purple="\[\033[1;35m\]"
PS1="[$green\t$black][$blue\h$yellow:\W$black] $black\$ "

# color of paths for 'ls' command
if [[ "$OSTYPE" == "darwin"* ]]; then
    export LSCOLORS='ExfxcxdxCxegedabagacad';
fi

if [[ "$HOME/.profile" ]]; then
    source "$HOME/.profile" # Load the default .profile
fi

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_112.jdk/Contents/Home
# $(/usr/libexec/java_home)
