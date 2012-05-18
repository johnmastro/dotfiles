" ~/.vimrc

" prelude
" =======
set runtimepath^=~/.vim,C:\\Local\\dotfiles\\.vim

filetype off
call pathogen#infect()
filetype plugin indent on

set nocompatible


" basic options
" =============
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
set cursorline
if v:version >= 703
   set relativenumber
else
   set number
endif
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

augroup cursor_line
    autocmd!
    autocmd WinEnter * set cursorline
    autocmd WinLeave * set nocursorline
augroup END


" tabs, spacing, wrapping, etc
" ============================
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set smartindent
set wrap
set textwidth=79
set formatoptions=qrn1
set backspace=indent,eol,start
set list
set listchars=tab:▸\ ,extends:»,precedes:«,trail:·


" undo, backup, and swap
" ======================
set history=1000
set directory^=~/.tmp/vim/swap//,C:\\Local\\tmp\\vim\\swap//
set backupdir^=~/.tmp/vim/backup//,C:\\Local\\tmp\\vim\\backup//
set backupskip=/tmp/*,/private/tmp/* " For crontab files
set backup
if v:version >= 703
    set undodir^=~/.tmp/vim/undo//,C:\\Local\\tmp\\vim\\undo//
    set undofile
    set undolevels=1000
    set undoreload=10000
endif


" interface
" =========
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
    set t_Co=256
    let g:solarized_termcolors=256
    colorscheme solarized
endif


" key (re-)mapping
" ================
let mapleader=","
nnoremap ; :
inoremap jj <ESC>
nnoremap j gj
nnoremap k gk
noremap H ^
noremap L g_
nnoremap vv ^vg_
nnoremap Y y$
nnoremap / /\v
vnoremap / /\v
inoremap <TAB> <C-R>=TabCompletion()<CR>

nnoremap <silent> <leader>/ :nohlsearch<CR>
nnoremap <silent> <leader>l :setlocal list!<CR>

" remote trailing whitespace
nnoremap <silent> <leader>w mz:%s/\s\+$//<CR>:let @/=''<CR>`z

if has('win32') || has('win64')
    nnoremap <silent> <leader>rc :e c:\Local\dotfiles\.vimrc<CR>
else
    nnoremap <silent> <leader>rc :e ~/.vimrc<CR>
endif

imap <silent> <C-o> _

" window & buffer navigation
" --------------------------
nnoremap <leader>v :vnew<CR>
nnoremap <leader>s :new<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <silent> <leader>z :bp<CR>
nnoremap <silent> <leader>x :bn<CR>


" plugin settings / mappings
" ==========================
" nerdtree
" --------
let NERDTreeIgnore=['\~$', '.*\.pyc$']
if has('win32') || has('win64')
    map <leader>, :NERDTreeToggle C:\\Local<CR>
else
    map <leader>, :NERDTreeToggle ~/<CR>
endif

" syntastic
" ---------
if has('win32') || has('win64')
    " disable syntastic on windows
    let g:loaded_syntastic_plugin = 1
else
    map <leader>c :SyntasticCheck<CR> :Errors<CR>
endif

" ack
" ---
map <leader>a :Ack!

" ctrlp
" -----
let g:ctrlp_working_path_mode = 1


" file / language settings
" ========================
if v:version >= 703
    autocmd FileType python,javascript,bash,zsh,rst setlocal colorcolumn=80
endif

augroup ft_html
    autocmd!
    autocmd BufNewFile,BufRead *.html setlocal filetype=htmljinja
    autocmd FileType htmljinja setlocal et sw=2 ts=2 sts=2
augroup END

let g:sql_type_default = 'postgresql'


" status line
" ===========
set statusline=%f                             " path
set statusline+=%m                            " modified flag
set statusline+=%r                            " Readonly flag
set statusline+=%w                            " preview window flag
set statusline+=\                             " space
set statusline+=%=                            " right align
set statusline+=(
set statusline+=%{&ff}                        " format (unix/DOS)
set statusline+=/
set statusline+=%{strlen(&fenc)?&fenc:&enc}   " encoding (utf-8)
set statusline+=/
set statusline+=%{&ft}                        " filetype
set statusline+=)
set statusline+=\ (line\ %l\/%L,\ col\ %03c)  " line & column info


" custom function(s)
" ==================
" use tab for autocompletion when mid-word:
function! TabCompletion()
    if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
        return "\<C-N>"
    else
        return "\<TAB>"
    endif
endfunction
