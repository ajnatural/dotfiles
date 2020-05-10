#!/usr/bin/env bash

[ "$UID" -eq 0 ] || exec sudo bash "$0" "$@"

BASE_DIR=$HOME
echo "Starting bootstrapping"

sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_18.04/ /' > /etc/apt/sources.list.d/home:manuelschneid3r.list"

sudo apt-get update
sudo apt-get upgrade

PACKAGES=(
    albert
    jq
    mercurial
    tree
    zsh
    python3-pip
    python-pip
    neovim
    htop
    compizconfig-settings-manager
    # firefox, chrome
)

echo "Installing packages..."
sudo apt install ${PACKAGES[@]}

# Install FZF
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

wget https://github.com/BurntSushi/ripgrep/releases/download/0.10.0/ripgrep_0.10.0_amd64.deb -O /tmp/deb.deb
sudo dpkg -i /tmp/deb.deb

wget https://github.com/sharkdp/bat/releases/download/v0.10.0/bat_0.10.0_amd64.deb -O /tmp/deb.deb
sudo dpkg -i /tmp/deb.deb

echo "Installing Python2 packages..."
PYTHON2_PACKAGES=(
    virtualenv
    virtualenvwrapper
    jedi
    flake8
    python-language-server[all]
)

pip install ${PYTHON2_PACKAGES[@]} --ignore-installed six

echo "Installing Python3 packages..."
PYTHON3_PACKAGES=(
    pgcli
    mycli
    virtualenv
    virtualenvwrapper
    jedi
    flake8
    jupyterlab
)

pip3 install ${PYTHON3_PACKAGES[@]}

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sudo chsh -s /bin/zsh

echo "Bootstrapping complete"
