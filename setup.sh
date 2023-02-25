#!/bin/bash
# Setup script for a fresh Macbook pro

USER=$(whoami)

# checks if the executable exists
function is_installed() {
    echo -n "Checking if $1 is installed: "
    if command -v "$1" >/dev/null 2>&1; then
      echo "yep"
      status=0
    else
      echo "nope"
      status=1
    fi
    return $status
}

function install_homebrew() {
    is_installed brew
    status=$?
    if ! [ $status ]; then
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
      (echo; echo 'eval "$(/usr/local/bin/brew shellenv)"') >> /Users/$USER/.zprofile
      (echo; echo 'eval "$(/usr/local/bin/brew shellenv)"') >> /Users/$USER/.bash_profile
    fi
}

function install_iterm() {
    brew install --cask iterm2
}

function install_karabiner() {
    # is_installed "/Library/Application Support/org.pqrs/Karabiner-Elements/bin/karabiner_cli" || brew install --cask karabiner-elements
    brew install --cask karabiner-elements
}

function install_chrome() {
    brew install --cask google-chrome
}

# sets bash as the default shell
function set_bash() {
    if [ $SHELL != "/bin/bash" ]; then
        chsh -u $USER -s /bin/bash
    fi
}

function install_spotify() {
    brew install --cask spotify
}

function install_whatsapp() {
    brew install --cask whatsapp
}

function install_slack() {
    brew install --cask slack
}

set_bash
install_homebrew
install_iterm
install_karabiner
install_chrome
install_whatsapp
install_spotify
install_slack
