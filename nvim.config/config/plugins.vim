call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'sheerun/vim-polyglot'
Plug 'https://github.com/vim-syntastic/syntastic.git'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
Plug 'zchee/deoplete-jedi'

call plug#end()
