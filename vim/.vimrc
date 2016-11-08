" ViM Config
" @author matteo.muscella@usi.ch
"
" {{{ init

" reload .vimrc file every time gets saved
autocmd! bufwritepost .vimrc source % | AirlineRefresh | AirlineRefresh

set nocompatible

" install ViM Plug if necessary
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" Make sure you use single quotes

" Colors
Plug 'chriskempson/base16-vim'
Plug 'altercation/vim-colors-solarized'
Plug 'noahfrederick/vim-hemisu'
Plug 'morhetz/gruvbox'

" Editor features
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'rhysd/vim-clang-format'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdcommenter'

" Syntax
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'urso/haskell_syntax.vim'
Plug 'baskerville/vim-sxhkdrc'
Plug 'neo4j-contrib/cypher-vim-syntax'
Plug 'chrisbra/csv.vim'
Plug 'vim-scripts/phtml.vim/'
Plug 'derekwyatt/vim-scala'
Plug 'tikhomirov/vim-glsl'

" File browser
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'

" Highlight colors
Plug 'lilydjwg/colorizer'

" Distraction free writing
Plug 'junegunn/goyo.vim'

" Snippets
Plug 'mattn/emmet-vim'
Plug 'msanders/snipmate.vim'

Plug 'tpope/vim-surround'
Plug 'plasticboy/vim-markdown'

call plug#end()

filetype plugin indent on

" }}}
" {{{ look

" Tabs and indenting
set tabstop=4                   " Set the size of tabs
set softtabstop=4               " Set the number of spaces for indeting
set shiftwidth=4                " Set the size of autoindent
set shiftround                  " Indent relative to beginning of line
set expandtab                   " Make sure our tabs are spaces
set preserveindent              " Preserve as much of the indent structure
set modelines=3                 " Number of lines of modeline
set backspace=2                 " Set backspace to 'indent,eol,start'

" Help with search
set hlsearch                    " Set incremental search highlight
set incsearch                   " Set incremental search
set ignorecase                  " Set case-insensitive search
set smartcase                   " Override ignore-case option

" Encoding
set encoding=utf8               " Set character encoding

" Auto read changed files
set autoread                    " Read again a file if changed outside of Vim

" Show line numbers and length
set relativenumber              " Show line numbers
set ruler                       " Show line,column number
set textwidth=79                " Set max width of text
set nowrap                      " No wrapping of text
set colorcolumn=80              " Highlight entire column
set cursorline                  " Highlight current line
set fillchars+=stl:\ ,stlnc:\   " Characters to fill the statuslines
set linespace=1                 " Set line height
set guicursor+=a:blinkon0       " Disable all blinking cursor

" Command line
set noshowmode                  " Show the current mode we are in
set showcmd                     " Show command in the last line of the screen
set cmdheight=1                 " Set number of screen lines for command-line

" Mouse support
set mouse=a                     " Enable the mouse in all modes

" Screen draw
set lazyredraw                  " Screen is not redrawn when in macros

" Code folding
set foldmethod=marker           " Set preferred method to look for folds

" Completion for command mode
set wildmenu                    " Set comamnd-line completion enhanced mode
set wildmode=longest,full,list  " Till longest, Next full, list all matches
set wildchar=<Tab>              " Character to start wildcard expansion

" GUI Font
"set guifont=Inconsolata\ for\ Powerline:h12
set guifont=agave:h14

" }}}
" {{{ statusline

set laststatus=0                       " Set statusline: 0,1,2

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" powerline symbols
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
"let g:airline_symbols.branch = ''
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = ''

let g:airline_exclude_preview = 0

let g:airline_mode_map = {
            \ '__' : '-',
            \ 'n'  : 'N',
            \ 'i'  : 'I',
            \ 'r'  : 'R',
            \ 'R'  : 'R',
            \ 'c'  : 'C',
            \ 'v'  : 'V',
            \ 'V'  : 'V',
            \ '' : 'V',
            \ 's'  : 'S',
            \ 'S'  : 'S',
            \ '' : 'S',
            \ }
"let g:airline_section_x = ''
"let g:airline_section_y = ''

let g:airline#extensions#hunks#enabled = 0

" }}}
" {{{ colors

syntax enable                          " Enable syntax highlighting
if !empty(glob("~/.custom.vim"))
    source ~/.custom.vim
endif

" Additional cpp highlighting
let g:cpp_class_scope_highlight=1
let g:cpp_experimental_template_highlight=1

" GitGutter custom colors
highlight clear SignColumn
highlight GitGutterAdd          ctermfg=green   guifg=#7aab7d
highlight GitGutterChange       ctermfg=yellow  guifg=#e0a82a
highlight GitGutterDelete       ctermfg=red     guifg=#d83925
highlight GitGutterChangeDelete ctermfg=magenta guifg=#c07998

" vim-gitgutter will use Sign Column to set its color, reload it.
call gitgutter#highlight#define_highlights()

" }}}
" {{{ backup files

" Save your backups to a less annoying place than the current directory.
" If you have .vim-backup in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/backup or . if all else fails.
if isdirectory($HOME . '/.vim/backup') == 0
    :silent !mkdir -p ~/.vim/backup >/dev/null 2>&1
endif
set backupdir-=.
set backupdir+=.
set backupdir-=~/
set backupdir^=~/.vim/backup/
set backupdir^=./.vim-backup/
set backup

" Save your swp files to a less annoying place than the current directory.
" If you have .vim-swap in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/swap, ~/tmp or .
if isdirectory($HOME . '/.vim/swap') == 0
    :silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
endif
set directory=./.vim-swap//
set directory+=~/.vim/swap//
set directory+=~/tmp//
set directory+=.

" viminfo stores the the state of your previous editing session
set viminfo+=n~/.vim/viminfo

if exists("+undofile")
    " undofile - This allows you to use undos after exiting and restarting
    " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
    " :help undo-persistence
    " This is only present in 7.3+
    if isdirectory($HOME . '/.vim/undo') == 0
        :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
    endif
    set undodir=./.vim-undo//
    set undodir+=~/.vim/undo//
    set undofile
endif

" }}}
" {{{ keys

" Set the leader key
let mapleader=","

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
nmap <silent> ,/ :nohlsearch<CR>
set pastetoggle=<leader>p

" Remap Ctrl-Space to completion
if has("gui_running")
    " C-Space seems to work under gVim on both Linux and win32
    inoremap <C-Space> <C-n>
else " no gui
    if has("unix")
        inoremap <Nul> <C-n>
    else
        " I have no idea of the name of Ctrl-Space elsewhere
    endif
endif

" Invoke Clang Format for current buffer
nnoremap <Leader>f      :ClangFormat<CR><CR>

" Delete trailing whitespaces
nnoremap <Leader>rtw    :%s/\s\+$//e<CR>

" Substitute all occurrences of the word under the cursor
nnoremap <Leader>s      :%s/\<<C-r><C-w>\>//g<Left><Left>

" Git gutter
nnoremap <Leader>ha     <Plug>GitGutterStageHunk
nnoremap <Leader>hu     <Plug>GitGutterRevertHunk

" Nerdtree
map <C-b> :NERDTreeToggle<CR>

" Toggle background color between light and dark
map <Leader>bg :let &background=(&background == "dark"? "light" : "dark")<CR>

" Toggle syntax highlighting with a key
function! ToggleSyntax()
    if exists("g:syntax_on")
        syntax off
    else
        syntax enable
    endif
endfunction
nmap <silent> <Leader>s :call ToggleSyntax()<CR>

" Remap Esc
inoremap jk <esc>

" Cd to current file wd
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

" }}}
" {{{ abbreviations

ab ata   @author matteo.muscella@usi.ch
ab pcode <pre><code class="php"><CR><TAB><CR></pre></code>

" }}}

