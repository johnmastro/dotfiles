" ~/.vimrc
"------------------------------------------------------------------------------

" basics ----------------------------------------------------------------------
set runtimepath^=~/dotfiles/.vim,C:\\Local\\dev\\dotfiles\\.vim

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
set laststatus=2
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
set textwidth=79
set formatoptions=qrn1
set colorcolumn=+1
set backspace=indent,eol,start

" undo, backup, and swap ------------------------------------------------------
set history=1000
set undofile
set undoreload=10000
" set backupskip^=/tmp/*,/private/tmp/*" " for crontab files
set undodir^=~/.vim/tmp/undo//,C:\\Local\\vim\\tmp\\undo//
set backupdir^=~/.vim/tmp/backup//,C:\\Local\\vim\\tmp\\backup//
set directory^=~/.vim/tmp/swap//,C:\\Local\\vim\\tmp\\swap//
set backup

" interface -------------------------------------------------------------------
syntax on
set background=dark
if has('gui_running')

    set columns=90 lines=50
    set guioptions-=T
    colorscheme solarized

    if has('win32') || has('win64')
        set guifont=Consolas:h9
    elseif has('gui_macvim')
        set guifont=menlo:h9
    else
        set guifont=Inconsolata\ 11
    endif

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

if has('win32') || has('win64')
    map <leader>, :NERDTreeToggle C:\\Local<CR>
else
    map <leader>, :NERDTreeToggle ~/<CR>
endif

let NERDTreeIgnore=['\~$', '.*\.pyc$']

" file / language settings
autocmd FileType python compiler pylint
let g:pylint_onwrite = 0

let g:sql_type_default = 'sqlanywhere'
nnoremap _my :SQLSetType mysql<CR>
nnoremap _sa :SQLSetType sqlanywhere<CR>
nnoremap _n :syntax off<CR> :set cc=<CR>

" status line -----------------------------------------------------------------
set statusline=%F%m%r%h%w
set statusline+=\ %#warningmsg#
set statusline+=%*
set statusline+=%=(%{&ff}/%Y)
set statusline+=\ (line\ %l\/%L,\ col\ %c)
