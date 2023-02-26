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

function _add_dock_item() {
    defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>$1</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
}

# setup the dock https://developer.apple.com/documentation/devicemanagement/dock
function setup_dock() {
    defaults write com.apple.dock autohide true
    defaults write com.apple.dock orientation bottom
    defaults write com.apple.dock show-recents false
    # set the items in the dock
    defaults write com.apple.dock persistent-apps -array  # clear it first
    _add_dock_item "/System/Applications/App Store.app"
    _add_dock_item "/System/Applications/Notes.app"
    _add_dock_item "/Applications/Google Chrome.app"
    _add_dock_item "/System/Applications/System Settings.app"
    _add_dock_item "/Applications/iTerm.app"
    _add_dock_item "/Applications/Slack.app"
    _add_dock_item "/Applications/Spotify.app"
    _add_dock_item "/Applications/WhatsApp.app"
    killall Dock
}

# this is meant for github setup
# https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
function setup_private_key() {
    ALGORITHM="ed25519"
    echo -n "What is your github email? "
    read email
    ssh-keygen -t $ALGORITHM -C $email
    eval "$(ssh-agent -s)"
    touch ~/.ssh/config
    echo -e "Host github.com\n  AddKeysToAgent yes\n  IdentityFile ~/.ssh/id_$ALGORITHM" >> ~/.ssh/config
    ssh-add --apple-use-keychain ~/.ssh/id_$ALGORITHM
}

function install_homebrew() {
    is_installed brew
    status=$?
    if [ $status -eq 1 ]; then
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
setup_rsa_key
install_homebrew
install_iterm
install_karabiner
install_chrome
install_whatsapp
install_spotify
install_slack
setup_dock
