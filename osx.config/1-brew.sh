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
    neovim
    mysql
    postgres
    bat
    yarn
    prettyping
    htop
    cheat
    composer
    xsv
)

echo "Installing packages..."
brew install ${PACKAGES[@]}


echo "Cleaning up..."
brew cleanup

# fzf keybindings
$(brew --prefix)/opt/fzf/install

CASKS=(
    firefox
    flux
    google-chrome
    ticktick
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
    skype
    phpstorm
    figma
    notion
    slack
    vagrant
    vagrant-manager
    php@7.4
)

echo "Installing cask apps..."
brew cask install ${CASKS[@]}

echo "Installing fonts..."
brew tap homebrew/cask-fonts
FONTS=(
    font-roboto
    font-clear-sans
)
brew cask install ${FONTS[@]}
brew install --HEAD universal-ctags/universal-ctags/universal-ctags

sudo chown -R $(whoami) $HOME/Library/Python

echo "Installing Python3 packages..."
PYTHON3_PACKAGES=(
    virtualenv
    jedi
    flake8
    neovim
)

pip3 install ${PYTHON3_PACKAGES[@]}

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
