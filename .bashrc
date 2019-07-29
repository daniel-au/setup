alias ls='ls -G'

# put alias definitions here if you make more
if [ -f ~/.bash_aliases ]; then
     . ~/.bash_aliases
fi

[[ "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$Path:/opt/apache-maven-3.5.2/bin" # Add maven binary for command line
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_112.jdk/Contents/Home
# $(/usr/libexec/java_home)
