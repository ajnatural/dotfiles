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

# Check for Homebrew, install if we don't have it
if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
brew update

# Install GNU core utilities (those that come with OS X are outdated)
brew tap homebrew/core

PACKAGES=(
    coreutils
    gnu-sed
    gnu-tar
    gnu-indent
    gnu-which
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
    vim
    wget
    nvm
    rsync
    watch
    watchman
    zsh
    zsh-completions
    sbdchd/skim/skim
    pgcli
    mycli
    mysql
    postgres
)

echo "Installing packages..."
brew install ${PACKAGES[@]}

echo "Cleaning up..."
brew cleanup

CASKS=(
    firefox
    flux
    google-chrome
    gpgtools
    iterm2
    macvim
    spectacle
    vlc
    tunnelblick
    macvim
    dashlane
    ngrok
    alfred
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

echo "Installing Python packages..."
PYTHON_PACKAGES=(
    virtualenv
    virtualenvwrapper
)

sudo chown -R $(whoami) /Users/ajain/Library/

sudo -H easy_install pip
sudo -H pip install ${PYTHON_PACKAGES[@]} --ignore-installed six

echo "Installing Ruby gems"
RUBY_GEMS=(
)
# sudo gem install ${RUBY_GEMS[@]}

echo "Bootstrapping complete"
