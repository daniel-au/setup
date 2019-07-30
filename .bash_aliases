alias pip=pip3.6
alias python=python3

if [[ "$OSTYPE" == "darwin"* ]]; then
    alias ls='ls -G'
elif [[ "$OSTYPE" == "linux-gnu" ]]; then
    alias ls='ls --color'
fi

alias ll='ls-alF'
alias l='ls-CF'
