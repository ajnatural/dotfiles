BASE_DIR=$(dirname $(readlink -f $0))

ZSH=$BASE_DIR/oh-my-zsh
ZSH_THEME="candy"

DISABLE_UPDATE_PROMPT=true
export UPDATE_ZSH_DAYS=5

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
export DISABLE_UNTRACKED_FILES_DIRTY="true"

export EDITOR=vim

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(jsontools globalias extract npm osx pip python sudo web-search wd virtualenvwrapper yarn gitfast colored-man-pages dotenv urltools rsync)

source $ZSH/oh-my-zsh.sh

# Lines configured by zsh-newuser-install
HISTFILE=$HOME/.histfile
HISTSIZE=5000
SAVEHIST=5000
setopt appendhistory beep nomatch notify
unsetopt autocd extendedglob
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename "$HOME.zshrc"
autoload -Uz compinit
compinit
# End of lines added by compinstall
