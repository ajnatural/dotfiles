#!/usr/bin/env bash
#
# Bootstrap script for setting up a new OSX machine
# 
# This should be idempotent so it can be run multiple times.
#
# Some apps don't have a cask and so still need to be installed by hand. These
# include:
#
# - If installing full Xcode, it's better to install that first from the app
#   store before running the bootstrap script. Otherwise, Homebrew can't access
#   the Xcode libraries as the agreement hasn't been accepted yet.

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
    telnet
    git
    imagemagick
    jq
    mercurial
    python
    python2
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
    bat
    prettyping
    htop
    cheat
    xsv
)

echo "Installing packages..."
brew install ${PACKAGES[@]}

brew install yarn --without-node
brew install php74 --with-pear
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
    virtualbox
    wireshark
    kap
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
brew install --HEAD universal-ctags/universal-ctags/universal-ctags

echo "Installing Python2 packages..."
PYTHON2_PACKAGES=(
    virtualenv
    virtualenvwrapper
    jedi
    flake8
    python-language-server[all]
)

sudo chown -R $(whoami) $HOME/Library/

easy_install pip
pip install ${PYTHON2_PACKAGES[@]} --ignore-installed six

echo "Installing Python3 packages..."
PYTHON3_PACKAGES=(
    virtualenv
    jedi
    flake8
)

pip3 install ${PYTHON3_PACKAGES[@]}

echo "Installing Ruby gems"
RUBY_GEMS=(
)
# gem install ${RUBY_GEMS[@]}

echo "Installing pecl packages"
PECL_PACKAGES=(
    msgpack
)
# pecl install ${PECL_PACKAGES[@]}

echo "Installing global node packages"
NPM_PACKAGES=(
    eslint
    prettier
    flow-bin
)
npm -g install ${NPM_PACKAGES[@]}

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s /bin/zsh

echo "Bootstrapping complete"
