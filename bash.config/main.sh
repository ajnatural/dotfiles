BASE_DIR="$HOME/dotfiles/bash.config"

alias=$BASE_DIR/alias.sh
zshrc=$BASE_DIR/zshrc.sh

# Customize to your needs...
if [[ -e $alias ]]; then
    source $alias
fi

if [[ -e $zshrc ]]; then
    source $zshrc
fi
