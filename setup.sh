#!/bin/bash
# Setup script for a fresh Macbook pro

USER=$(whoami)
PYTHON_VERSION=3.11.2

set_bash
setup_bash
install_homebrew
install_iterm
install_karabiner
install_chrome
install_whatsapp
install_spotify
install_slack
install_1password
setup_computer
setup_private_key
setup_vim
setup_neovim
setup_dev_env
