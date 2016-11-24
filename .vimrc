set nocompatible                "Don't try to be vi compatible
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Productivity plugins
Plugin 'https://github.com/Lokaltog/vim-easymotion.git'
Plugin 'https://github.com/vim-scripts/HTML-AutoCloseTag.git'
Plugin 'https://github.com/vim-scripts/matchit.zip.git'
Plugin 'https://github.com/tpope/vim-surround.git'
Plugin 'https://github.com/terryma/vim-multiple-cursors.git'
Plugin 'https://github.com/kien/ctrlp.vim.git'
Plugin 'https://github.com/ivalkeen/vim-ctrlp-tjump.git'
Plugin 'https://github.com/FelikZ/ctrlp-py-matcher.git'
Plugin 'https://github.com/scrooloose/nerdcommenter.git'
Plugin 'https://github.com/Shougo/neosnippet.vim.git'
Plugin 'https://github.com/Shougo/neosnippet-snippets'
Plugin 'https://github.com/Shougo/neocomplcache.vim.git'
Plugin 'https://github.com/scrooloose/syntastic'
" Plugin 'https://github.com/mhinz/vim-grepper.git'

" Utility plugins
Plugin 'https://github.com/gmarik/Vundle.vim.git'
Plugin 'https://github.com/scrooloose/nerdtree.git'
Plugin 'https://github.com/bling/vim-airline.git'
Plugin 'https://github.com/mhinz/vim-signify.git'
Plugin 'https://github.com/tpope/vim-fugitive.git'
Plugin 'https://github.com/terryma/vim-smooth-scroll.git'
Plugin 'https://github.com/majutsushi/tagbar.git'
Plugin 'https://github.com/xolox/vim-misc.git'
Plugin 'https://github.com/xolox/vim-notes.git'
Plugin 'https://github.com/tpope/vim-dispatch.git'
Plugin 'https://github.com/vim-scripts/EasyGrep.git'

" Extra File Type Support
Plugin 'https://github.com/elzr/vim-json.git'
Plugin 'https://github.com/vobornik/vim-mql4.git'
Plugin 'https://github.com/solarnz/thrift.vim'

Plugin 'https://github.com/isRuslan/vim-es6.git'

call vundle#end()            " required
filetype plugin indent on    " required

" Put your non-Plugin stuff after this line
set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set ruler                       "Show file stats
set encoding=utf-8

" Turn on syntax highlighting
syntax on

" ================ Search Settings  =================

set incsearch        "Find the next match as we type the search
set hlsearch         "Hilight searches by default
set viminfo='100,f1  "Save up to 100 marks, enable capital marks

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.

" set undodir=~/.vim/backups
" set undofile

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

"
" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1
