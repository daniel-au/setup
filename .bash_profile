if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# using openssl@3 from homebrew
export LDFLAGS="-L/usr/local/opt/openssl@3/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@3/include"
export CONFIGURE_OPTS="--with-openssl=$(brew --prefix openssl@3)"
export PKG_CONFIG_PATH="/usr/local/opt/openssl@3/lib/pkgconfig"
export PATH="/usr/local/opt/openssl@3/bin:$PATH"

# libpq - postgresql
# export LDFLAGS="-L/usr/local/opt/libpq/lib"
# export CPPFLAGS="-I/usr/local/opt/libpq/include"
# export PKG_CONFIG_PATH="/usr/local/opt/libpq/lib/pkgconfig"

# homebrew
eval "$(/usr/local/bin/brew shellenv)"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
pyenv virtualenvwrapper
export PATH="/usr/local/opt/libpq/bin:$PATH"
