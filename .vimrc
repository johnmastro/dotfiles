" ~/.vimrc


" Basics ----------------------------------------------------------------------
set runtimepath^=~/dotfiles/.vim,C:\\Local\\dotfiles\\.vim

filetype off
call pathogen#infect()
filetype plugin indent on

set nocompatible
set encoding=utf-8
setglobal fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,latin1
set modelines=0
set scrolloff=3
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest,full
set wildignore+=.hg,.git,*.pyc,.DS_Store
set visualbell
if v:version >= 703
   set relativenumber
else
   set number
endif
set cursorline
set ttyfast
set ruler
set laststatus=2
set splitbelow
set lazyredraw
set incsearch
set ignorecase
set smartcase
set showmatch
set hlsearch
set gdefault


" Tabs, spacing, wrapping, etc ------------------------------------------------
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set smartindent
set wrap
set textwidth=79
if v:version >= 703
    set colorcolumn=+1
endif
set formatoptions=qrn1
set backspace=indent,eol,start
set list
" set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set listchars=tab:▸\ ,extends:❯,precedes:❮


" Undo, backup, and swap ------------------------------------------------------
set history=1000
set directory^=~/.vim/tmp/swap//,C:\\Local\\vim\\tmp\\swap//
set backupdir^=~/.vim/tmp/backup//,C:\\Local\\vim\\tmp\\backup//
set backupskip=/tmp/*,/private/tmp/* " For crontab files
set backup
if v:version >= 703
    set undodir^=~/.vim/tmp/undo//,C:\\Local\\vim\\tmp\\undo//
    set undofile
    set undolevels=1000
    set undoreload=10000
endif


" Interface -------------------------------------------------------------------
syntax on
set background=dark

if has('gui_running')
    colorscheme solarized
    set columns=90 lines=50
    set guioptions-=T
    if has('gui_macvim')
        set guifont=menlo:h11
    elseif has('win32') || has('win64')
        set guifont=Consolas:h9
    else
        set guifont=Inconsolata\ 11
    endif
else
    let g:solarized_termcolors=256
    colorscheme solarized
endif


" Key remapping ---------------------------------------------------------------
nnoremap ; :
inoremap jj <ESC>
nnoremap j gj
nnoremap k gk
nnoremap / /\v
vnoremap / /\v
inoremap <TAB> <C-R>=TabCompletion()<CR>

let mapleader=","
map <leader>/ :noh<CR>

" Window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <leader>v :vnew<CR>

" Plugin settings / mappings
let NERDTreeIgnore=['\~$', '.*\.pyc$']
if has('win32') || has('win64')
    map <leader>, :NERDTreeToggle C:\\Local<CR>
else
    map <leader>, :NERDTreeToggle ~/<CR>
endif

if has('win32') || has('win64')
    " disable syntastic on windows
    let g:loaded_syntastic_plugin = 1
endif
map <leader>s :SyntasticCheck<CR> :Errors<CR>

map <leader>a :Ack!

let g:ctrlp_working_path_mode = 1


" File / language settings ----------------------------------------------------
let g:sql_type_default = 'sqlanywhere'

" autocomands
augroup trailing
    autocmd!
    autocmd InsertEnter * :set listchars-=trail:⌴
    autocmd InsertLeave * :set listchars+=trail:⌴
augroup END

augroup ft_sql
    autocmd!
    if v:version >= 703
        autocmd FileType sql setlocal cc=
    endif
augroup END

augroup ft_html
    autocmd!
    autocmd FileType html,htmldjango set filetype=htmljinja
    autocmd FileType htmljinja setlocal et sw=2 ts=2 sts=2
augroup END


" Status line -----------------------------------------------------------------
set statusline=%f                             " Path.
set statusline+=%m                            " Modified flag.
set statusline+=%r                            " Readonly flag.
set statusline+=%w                            " Preview window flag.
set statusline+=\                             " Space.
set statusline+=%=                            " Right align.
set statusline+=(
set statusline+=%{&ff}                        " Format (unix/DOS).
set statusline+=/
set statusline+=%{strlen(&fenc)?&fenc:&enc}   " Encoding (utf-8).
set statusline+=/
set statusline+=%{&ft}                        " Type (python).
set statusline+=)
set statusline+=\ (line\ %l\/%L,\ col\ %03c)  " Line & column info.


" Custom function(s) ----------------------------------------------------------
" Remap Tab to Ctrl-N (autocomplete) when used mid-word:
function! TabCompletion()
    if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
        return "\<C-N>"
    else
        return "\<TAB>"
    endif
endfunction

