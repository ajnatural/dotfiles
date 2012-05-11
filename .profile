PS1="`/bin/hostname` % " PS2='> '
export PS1 PS2
umask 027
export MAIL VIEWER PS1 PS2 CHECKMAIL # just in case
alias ls="ls --color"
set -o vi
