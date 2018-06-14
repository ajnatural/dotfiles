#!/usr/bin/env bash
#
# Bootstrap script for setting up a new OSX machine
# 
# This should be idempotent so it can be run multiple times.
#
# Some apps don't have a cask and so still need to be installed by hand. These
# include:
#
# - Twitter (app store)
# - Postgres.app (http://postgresapp.com/) # # Notes:
#
# - If installing full Xcode, it's better to install that first from the app
#   store before running the bootstrap script. Otherwise, Homebrew can't access
#   the Xcode libraries as the agreement hasn't been accepted yet.
#
# Reading:
#
# - http://lapwinglabs.com/blog/hacker-guide-to-setting-up-your-mac
# - https://gist.github.com/MatthewMueller/e22d9840f9ea2fee4716
# - https://news.ycombinator.com/item?id=8402079
# - http://notes.jerzygangi.com/the-best-pgp-tutorial-for-mac-os-x-ever/

echo "Starting bootstrapping"

xcode-select --install

# Check for Homebrew, install if we don't have it
if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
brew update

# Install GNU core utilities (those that come with OS X are outdated)
brew tap homebrew/core
brew tap homebrew/homebrew-php

PACKAGES=(
    coreutils
    gnu-sed
    gnu-tar
    gnu-indent
    gnu-which
    gcc@5
    findutils
    bash
    ack
    git
    imagemagick
    jq
    mercurial
    python
    python3
    ripgrep
    tmux
    tree
    wget
    nvm
    rsync
    watch
    watchman
    zsh
    zsh-completions
    fzf
    pgcli
    mycli
    mysql
    postgres
    neovim
		# fln specific
		lsyncd
)

echo "Installing packages..."
brew install ${PACKAGES[@]}

brew install yarn --without-node
brew install php71
brew install composer

echo "Cleaning up..."
brew cleanup

# fzf keybindings
$(brew --prefix)/opt/fzf/install

CASKS=(
    firefox
    flux
    google-chrome
    iterm2
    spectacle
    vlc
    tunnelblick
    dashlane
    ngrok
    alfred
    java
    onivim
)

echo "Installing cask apps..."
brew cask install ${CASKS[@]}

echo "Installing fonts..."
brew tap caskroom/fonts
FONTS=(
    font-roboto
    font-clear-sans
)
brew cask install ${FONTS[@]}

echo "Installing Python2 packages..."
PYTHON2_PACKAGES=(
    virtualenv
    virtualenvwrapper
    flake8
)

sudo chown -R $(whoami) /Users/ajain/Library/

sudo -H easy_install pip
sudo -H pip install ${PYTHON2_PACKAGES[@]} --ignore-installed six

echo "Installing Python3 packages..."
PYTHON3_PACKAGES=(
    virtualenv
    flake8
)

sudo -H pip3 install ${PYTHON3_PACKAGES[@]}

echo "Installing Ruby gems"
RUBY_GEMS=(
)
# sudo gem install ${RUBY_GEMS[@]}

echo "Bootstrapping complete"
