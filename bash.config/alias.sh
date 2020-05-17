alias httpserver='python -m SimpleHTTPServer'

alias gco='git checkout'
alias gb='git branch'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gl='git log --graph --pretty=format:'\''%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'\'' --abbrev-commit --all'
alias gh='git checkout'
alias grs='git reset'
alias grv='git revert'
alias gm='git merge'
alias gd='git diff'
alias gp='git push'

alias v='nvim `fzf`'
alias vim='nvim'
alias cat='bat'

alias gfh='git-file-history'
alias ping='prettyping --nolegend'
alias top="sudo htop"

git-file-history() {
		for r in `git rev-list --all -- $1 | head -$2 `; do; git --no-pager show --unified=0 --pretty=fuller $r ; done;
}

function hs() {
    ( cd ~/Homestead && vagrant $* )
}

