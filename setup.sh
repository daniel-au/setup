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

function _add_dock_item() {
    defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>$1</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
}

# setup the dock https://developer.apple.com/documentation/devicemanagement/dock
function setup_dock() {
    defaults write com.apple.dock autohide -bool true
    defaults write com.apple.dock orientation bottom
    defaults write com.apple.dock show-recents -bool false
    # set the items in the dock
    defaults write com.apple.dock persistent-apps -array  # clear it first
    _add_dock_item "/System/Applications/App Store.app"
    _add_dock_item "/System/Applications/Notes.app"
    _add_dock_item "/Applications/Google Chrome.app"
    _add_dock_item "/Applications/iTerm.app"
    _add_dock_item "/Applications/Slack.app"
    _add_dock_item "/Applications/Spotify.app"
    _add_dock_item "/Applications/WhatsApp.app"
    _add_dock_item "/System/Applications/System Settings.app"
    killall Dock
}

function setup_trackpad() {
    # trackpad speed
    defaults write .GlobalPreferences com.apple.trackpad.scaling -int 3

    # tap to click
    defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
    defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true

    # 3 finger drag
    defaults write com.apple.AppleMultitouchTrackpad Dragging -bool true
    defaults write com.apple.driver.AppleBluetoothMultitouchTrackpad Dragging -bool true
    defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true
    defaults write com.apple.driver.AppleBluetoothMultitouchTrackpad TrackpadThreeFingerDrag -bool true

    # Swipe between full screen applications
    defaults write com.apple.AppleMultitouchTrackpad TrackpadFourFingerHorizSwipeGesture -int 2
    defaults write com.apple.driver.AppleBluetoothMultitouchTrackpad TrackpadFourFingerHorizSwipeGesture -int 2

    # Show Desktop
    defaults write com.apple.AppleMultitouchTrackpad TrackpadFourFingerPinchGesture -int 2
    defaults write com.apple.driver.AppleBluetoothMultitouchTrackpad TrackpadFourFingerPinchGesture -int 2

    # idk what this does but it's set
    defaults write com.apple.AppleMultitouchTrackpad TrackpadFiveFingerPinchGesture -int 2
    defaults write com.apple.driver.AppleBluetoothMultitouchTrackpad TrackpadFiveFingerPinchGesture -int 2

    # App Expose
    defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerVertSwipeGesture -int 0
    defaults write com.apple.driver.AppleBluetoothMultitouchTrackpad TrackpadThreeFingerVertSwipeGesture -int 0

    # notifications bar
    defaults write com.apple.AppleMultitouchTrackpad TrackpadTwoFingerFromRightEdgeSwipeGesture -int 3
    defaults write com.apple.driver.AppleBluetoothMultitouchTrackpad TrackpadTwoFingerFromRightEdgeSwipeGesture -int 3
}

function setup_keyboard() {
    defaults write -g InitialKeyRepeat -int 10  # normal minimum is 15 (225 ms)
    defaults write -g KeyRepeat -int 1  # normal minimum is 2 (30 ms)
}

function activate_settings() {
    /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
}

# this is meant for github setup
# https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
# This should be called after homebrew is installed since the command line tools are a dependency
function setup_private_key() {
    private_key_path="$HOME/.ssh/id_$ALGORITHM"
    if [ -f "$private_key_path" ]; then
        echo "Private key already exists. Exiting."
        return
    fi
    ALGORITHM="ed25519"
    echo -n "What is your name? "
    read name
    echo -n "What is your github email? "
    read email
    ssh-keygen -t $ALGORITHM -C $email
    eval "$(ssh-agent -s)"
    touch ~/.ssh/config
    echo -e "Host github.com\n  AddKeysToAgent yes\n  IdentityFile ~/.ssh/id_$ALGORITHM" >> ~/.ssh/config
    ssh-add --apple-use-keychain ~/.ssh/id_$ALGORITHM
    git config --global user.name $name
    git config --global user.email $email
}

set_bash
install_homebrew
install_iterm
install_karabiner
install_chrome
install_whatsapp
install_spotify
install_slack
setup_dock
setup_trackpad
setup_keyboard
activate_settings
setup_private_key
