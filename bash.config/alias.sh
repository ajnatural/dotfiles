alias httpserver='python -m SimpleHTTPServer'
alias gl='git log --graph --pretty=format:'\''%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'\'' --abbrev-commit --all'

vi() {
    if [[ $# > 0 ]]; then
        vim $@;
    elif [[ $(which fzf) ]]; then

        FILES="";

        if [ -n "$TMUX" ]; then
            FILES=$(fzf-tmux -m);
        else
            FILES=$(fzf -m);
        fi

        if [ $FILES ]; then
            vim $FILES;
        fi

    fi
}
alias v="vi"
