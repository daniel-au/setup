if [[ "$OSTYPE" == "darwin"* ]]; then
    alias ls='ls -G'
elif [[ "$OSTYPE" == "linux-gnu" ]]; then
    alias ls='ls --color'
fi

alias ll='ls-alF'
alias l='ls-CF'

# show or hide hidden files
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO'
