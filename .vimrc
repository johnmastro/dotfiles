" ~/.vimrc
"------------------------------------------------------------------------------

" basics ----------------------------------------------------------------------
set runtimepath=~/dotfiles/.vim,$VIMRUNTIME

filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

set nocompatible
set modelines=0
set encoding=utf-8
set scrolloff=3
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest,full
set visualbell
set cursorline
set ttyfast
set ruler
set relativenumber
set splitbelow
set lazyredraw
set incsearch
set ignorecase
set smartcase
set showmatch
set hlsearch

" tabs, spacing, wrapping, etc ------------------------------------------------
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set smartindent
set wrap
set textwidth=85
set formatoptions=qrn1
" set colorcolumn=80
set backspace=indent,eol,start

" undo, backup, and swap ------------------------------------------------------
set backup
set undofile
set history=1000
set undoreload=10000
set undodir=~/.vim/tmp/undo//
set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap//

" interface -------------------------------------------------------------------
syntax on
if has('gui_running')
    set columns=90 lines=50
    set guioptions-=T
    " set guioptions-=m
    set guifont=Inconsolata\ 11
    colorscheme mustang
else
    set t_Co=256
    " let g:zenburn_high_Contrast=1
    " colorscheme zenburn
    colorscheme wombat256
endif

" key remapping ---------------------------------------------------------------
nnoremap j gj
nnoremap k gk
nnoremap ; :
let mapleader=","
map <leader>/ :noh<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
