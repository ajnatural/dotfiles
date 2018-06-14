alias httpserver='python -m SimpleHTTPServer'
alias gl='git log --graph --pretty=format:'\''%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'\'' --abbrev-commit --all'
alias v='nvim `fzf`'
alias vim='nvim'
alias vi='vim'

alias gfh='git-file-history'
git-file-history() {
		for r in `git rev-list --all -- $1 | head -$2 `; do; git --no-pager show --unified=0 --pretty=fuller $r ; done;
}

