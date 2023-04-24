" Installation notes for future me:
"   - brew install nvim
"   - install vim-plug: https://github.com/junegunn/vim-plug
"   - ln -s ~/code/dotfiles/init.vim ~/.config/nvim/init.vim
"   - :PlugInstall

set showmatch
set ignorecase
set hlsearch
set incsearch
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set autoindent
set number
set wildmode=longest,list
set cc=88
filetype plugin indent on
syntax on
" set mouse=a
set clipboard=unnamedplus
set cursorline
set ttyfast
set spell
set noswapfile
set backupdir=~/.cache/nvim

call plug#begin()
    Plug 'altercation/vim-colors-solarized'
    Plug 'scrooloose/nerdtree'
    Plug 'preservim/nerdcommenter'
call plug#end()

let g:solarized_termcolors=256
colorscheme solarized
