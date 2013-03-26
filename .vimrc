" ~/.vimrc

" prelude ----------------------------------------------------------------- {{{

set runtimepath^=~/.vim

filetype off
call pathogen#infect()
filetype plugin indent on

set nocompatible

" }}}
" basic options ----------------------------------------------------------- {{{

set encoding=utf-8
setglobal fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,latin1
set modelines=1
set scrolloff=3
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest,full
set visualbell
set cursorline
if exists('&relativenumber')
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
set shortmess=atI
set completeopt=longest,menu,preview
set foldlevelstart=99  " all folds open
set cpo+=J  " stevelosh.com/blog/2012/10/why-i-two-space/ convinced me

" wildignore {{{

set wildignore+=*.py[co],*.DS_Store,*.orig,*.swp
set wildignore+=*.o,*.obj,*.exe,*.dll,*.jar
set wildignore+=.hg,.git,_darcs,.svn,.bzr
set wildignore+=*.png,*.jpg,*.jpeg,*.gif,*.bmp

" }}}
" cursorline {{{
augroup cursor_line
    autocmd!
    autocmd WinEnter * set cursorline
    autocmd WinLeave * set nocursorline
augroup END

" }}}

" }}}
" tabs, spacing, wrapping, etc -------------------------------------------- {{{

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

" }}}
" undo, backup, and swap -------------------------------------------------- {{{

set history=1000
set directory^=~/.tmp/vim/swap//
set backupdir^=~/.tmp/vim/backup//
set backupskip=/tmp/*,/private/tmp/* " For crontab files
set backup
if exists('&undodir')
    set undodir^=~/.tmp/vim/undo//
    set undofile
    set undolevels=1000
    set undoreload=10000
endif

" }}}
" interface --------------------------------------------------------------- {{{

syntax enable
set background=dark

" gvim / macvim {{{

if has('gui_running')
    set columns=90 lines=50
    set guioptions-=T
    set guioptions-=m
    set guioptions-=l
    set guioptions-=L
    set guioptions-=r
    set guioptions-=R
    let g:solarized_italic=0
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
endif

" }}}

colorscheme solarized

" }}}
" key (re-)mapping -------------------------------------------------------- {{{

let mapleader=','
let maplocalleader='\'
nnoremap ; :
inoremap jj <esc>

" move by screen (as opposed to file) lines
nnoremap j gj
nnoremap k gk

" more convenient beginning / end of line movements
noremap H ^
noremap L g_

" visually select the line, excluding indentation and newline
nnoremap vv ^vg_

" yank from the cursor to the end of the line
nnoremap Y y$

" maintain the selection when indenting/outdenting in visual mode
vnoremap > >gv
vnoremap < <gv

" more compatible regular expressions
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v

" don't outdent comments
inoremap # X<bs>#

" shell/emacs-style ctrl-a in command mode
cnoremap <c-a> <home>

" conditional tab completion
"inoremap <TAB> <C-R>=TabCompletion()<CR>

" system clipboard interaction
noremap <leader>y "*y
noremap <leader>p :set paste<cr>"*p<cr>:set nopaste<cr>
noremap <leader>P :set paste<cr>"*P<cr>:set nopaste<cr>
vnoremap <leader>y "*ygv

" clear search highlighting
nnoremap <silent> <leader>/ :nohlsearch<cr>

" toggle whether whitespace characters are shown
nnoremap <silent> <leader>l :setlocal list!<cr>

" remove trailing whitespace
nnoremap <silent> <leader>w mz:%s/\s\+$//<cr>:let @/=''<cr>`z

" toggle whether trailing whitespace is shown
nnoremap <silent> <leader>T :call TrailingToggle()<cr>
nnoremap <silent> <leader>N :call RelativeNumberingToggle()<cr>

" window & buffer navigation {{{

nnoremap <leader>v :vnew<cr>
nnoremap <leader>s :new<cr>
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <silent> <leader>z :bp<cr>
nnoremap <silent> <leader>x :bn<cr>

" }}}
" folding {{{

" toggle folds with <space>
nnoremap <space> za
vnoremap <space> za

" recursively open a folded region
nnoremap zO zCzO

" }}}

" }}}
" plugin settings / mappings ---------------------------------------------- {{{

" nerdtree {{{

let NERDTreeIgnore=['\~$', '.*\.pyc$']
let NERDTreeMinimalUI = 1

if has('win32') || has('win64')
    map <leader>, :NERDTreeToggle C:\\Local<cr>
else
    map <leader>, :NERDTreeToggle ~/<cr>
endif

" }}}
" syntastic {{{

let g:syntastic_mode_map = { 'mode': 'passive',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': [] }

" }}}
" ack {{{

map <leader>a :Ack!<space>

" }}}
" ctrlp {{{

map <leader>f :CtrlP<cr>
map <leader>b :CtrlPBuffer<cr>
let g:ctrlp_working_path_mode = 'rc'
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = '~/.tmp/vim/ctrlp'

" }}}
" supertab {{{

let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabContextDefaultCompletionType = '<c-n>'
let g:SuperTabLongestEnhanced = 1
let g:SuperTabLongestHighlight = 1
let g:SuperTabClosePreviewOnPopupClose = 1

autocmd Filetype *
    \ if &omnifunc != '' |
    \     call SuperTabChain(&omnifunc, '<c-n>') |
    \     call SuperTabSetDefaultCompletionType('<c-x><c-u>') |
    \ endif

" }}}
" slimv / paredit {{{

let g:slimv_leader = '\'
"let g:slimv_repl_simple_eval = 0
let g:slimv_repl_name = 'SLIMV.REPL'
let g:slimv_repl_split = 4
let g:paredit_leader = '\'
let g:paredit_electric_return = 0

" }}}

" }}}
" file / language settings ------------------------------------------------ {{{

" colorcolumn {{{

augroup color_column
    autocmd!
    autocmd Filetype python,javascript,sh,zsh,vim,rst,markdown
        \ if exists('&colorcolumn') |
        \     setlocal colorcolumn=+1 |
        \ endif
augroup END

" }}}
" vim {{{

augroup ft_vim
    autocmd!
    autocmd Filetype vim setlocal foldmethod=marker foldlevel=0
augroup END

" }}}
" slimv {{{

augroup ft_slimv
    autocmd!
    autocmd BufWinEnter SLIMV.REPL setlocal nolist
augroup END

" }}}
" ruby {{{

augroup ft_ruby
    autocmd!
    autocmd Filetype ruby setlocal et sw=2 ts=2 sts=2
augroup END

" }}}
" gitcommit {{{

augroup ft_gitcommit
    autocmd!
    autocmd Filetype gitcommit setlocal formatoptions+=t textwidth=72
augroup END

" }}}
" yaml {{{

augroup ft_yaml
    autocmd!
    autocmd Filetype yaml setlocal et sw=2 ts=2 sts=2
augroup END

" }}}
" html {{{

augroup ft_html
    autocmd!
    autocmd BufNewFile,BufRead *.html setlocal filetype=htmljinja
    autocmd Filetype htmljinja setlocal et sw=2 ts=2 sts=2
augroup END

" }}}
" c {{{

augroup ft_c
    autocmd!
    autocmd Filetype c setlocal noet sw=8 ts=8 sts=8
augroup END

" }}}
" make {{{

augroup ft_make
    autocmd!
    autocmd Filetype make setlocal noet sw=8 ts=8 sts=8
augroup END

" }}}
" rst {{{

augroup ft_rst
    autocmd!
    autocmd Filetype rst,markdown setlocal textwidth=72
augroup END

" }}}
" markdown {{{

augroup ft_markdown
    autocmd!
    autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
    autocmd Filetype markdown setlocal textwidth=72
augroup END

" }}}
" sql {{{

let g:sql_type_default = '_pgsql'

" }}}

" }}}
" status line ------------------------------------------------------------- {{{

set statusline=%f                             " path
set statusline+=%m                            " modified flag
set statusline+=%r                            " readonly flag
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

" }}}
" custom function(s) ------------------------------------------------------ {{{

" use tab for autocompletion when mid-word:
"function! TabCompletion()
"    if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
"        return "\<C-N>"
"    else
"        return "\<TAB>"
"    endif
"endfunction

function! TrailingToggle()
    if &list == 1
        if &listchars =~ 'trail:·'
            setlocal listchars-=trail:·
        else
            setlocal listchars+=trail:·
        endif
    else
        echom "TrailingToggle: option '&list' not set"
    endif
endfunction

function! RelativeNumberingToggle()
    if exists('&relativenumber')
        if &relativenumber == 1
            setlocal number
        else
            setlocal relativenumber
        endif
    else
        echom "RelativeNumberingToggle: relative numbering not available"
    endif
endfunction

" Show the stack of syntax highlighting classes affecting whatever's
" under the cursor.
" (From https://bitbucket.org/sjl/dotfiles/src/tip/vim/vimrc)
function! SynStack()
    echo join(map(synstack(line('.'), col('.')),
        \ 'synIDattr(v:val, "name")'), " > ")
endfunction

" }}}
