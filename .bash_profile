if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"
export CONFIGURE_OPTS="--with-openssl=$(brew --prefix openssl@1.1)"
export PKG_CONFIG_PATH="/usr/local/opt/openssl@1.1/lib/pkgconfig"

eval "$(/usr/local/bin/brew shellenv)"
