" Installation notes for future me:
"   - brew install nvim
"   - install vim-plug: https://github.com/junegunn/vim-plug
"   - ln -s ~/code/dotfiles/init.vim ~/.config/nvim/init.vim
"   - :PlugInstall

filetype plugin indent on
syntax on
let mapleader=' '
set showmatch
set ignorecase
set hlsearch
set incsearch
set textwidth=0
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set autoindent
set nojoinspaces
set number
set numberwidth=3
set wildmode=longest,list
set cc=88
" set mouse=a
set clipboard=unnamedplus
set cursorline
set spell
set noswapfile
set nobackup
set nowritebackup
set undodir=~/.cache/nvim
set splitbelow
set splitright
set visualbell
set magic
set shortmess+=c
set listchars=tab:»·,nbsp:+,trail:·,extends:→,precedes:←
set completeopt=menu,menuone,noinsert
set wildmode=longest:list,full

call plug#begin()
    Plug 'altercation/vim-colors-solarized'
    Plug 'tpope/vim-rsi'
    Plug 'scrooloose/nerdtree'
    Plug 'preservim/nerdcommenter'
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'
call plug#end()

let g:solarized_termcolors=256
colorscheme solarized
