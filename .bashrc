alias ls='ls -G'

# put alias definitions here if you make more
if [ -f ~/.bash_aliases ]; then
     . ~/.bash_aliases
fi

[[ "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
