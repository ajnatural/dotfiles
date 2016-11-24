BASE_DIR=$(dirname $(readlink -f $0))

alias=$BASE_DIR/alias.sh
zshrc=$BASE_DIR/zshrc

# Customize to your needs...
if [[ -e $alias ]]; then
    source $alias
fi

if [[ -e $zshrc ]]; then
    source $zshrc
fi
