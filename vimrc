"""
""" VIM RC
""" @author matteo.muscella@usi.ch
"""
" {{{ functions

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" }}}
" {{{ filetype & vundle

set nocompatible
hi clear
if exists("syntax_on")
    syntax reset
endif
filetype off

set rtp+=~/.vim/vundle/
call vundle#begin('~/.vim/bundle')

Bundle 'gmarik/vundle'
"Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-markdown'
Bundle 'altercation/vim-colors-solarized'
Bundle 'jlanzarotta/bufexplorer'
Bundle 'morhetz/gruvbox'
Bundle 'noahfrederick/vim-hemisu'
"Plugin 'bling/vim-airline'
Plugin 'octol/vim-cpp-enhanced-highlight'

call vundle#end()

filetype plugin indent on

" }}}
" {{{ look

" Use spaces instead of tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
set preserveindent

" Help with search
set hlsearch
set incsearch
set ignorecase
set smartcase

" Encoding
set encoding=utf8

" Auto read changed files
set autoread

" Show line numbers and length
set number
set ruler
set tw=79
set nowrap
"set colorcolumn=80
"highlight ColorColumn ctermbg=210
set cursorline
set fillchars+=stl:\ ,stlnc:\

" Command line
set showmode
set showcmd
set cmdheight=1

" Mouse support
set mouse=a
set backspace=2

" Screen not redrawn while macros or commands
set lazyredraw
"
" Enable code folding
set foldmethod=marker

" Completion for command mode
set wildmenu
set wildmode=longest,full,list

" }}}
" {{{ colors

" https://github.com/altercation/vim-colors-solarized
set t_Co=265
syntax enable
set background=light
colorscheme hemisu
"hi CursorLineNr term=bold ctermfg=Yellow gui=bold guifg=Yellow

" }}}
" {{{ statusline

"set laststatus=2
"set statusline=\ \%f%m%r%h%w\ \ %y\ [%{&ff}]\%=\ [%p%%:\ %l/%L]

"--------------------------
"Airline Settings
"--------------------------
let g:airline_symbols = {}
let g:airline_powerline_fonts                     = 1
let g:airline_left_sep                            = '⮀'
let g:airline_left_alt_sep                        = '⮁'
let g:airline_right_sep                           = '⮂'
let g:airline_right_alt_sep                       = '⮃'
let g:airline_theme                               = 'solarized'
let g:airline_toggle_whitespace                   = 1
"let g:airline#extensions#tabline#enabled          = 1
"let g:airline#extensions#tabline#show_buffers     = 1
"let g:airline#extensions#tabline#show_tabs        = 1
"let g:airline#extensions#tabline#formatter        = 'unique_tail_improved'
"let g:airline#extensions#tabline#buffer_min_count = 0
let g:airline_symbols.branch                      = '⭠'
let g:airline_symbols.readonly                    = '⭤'
let g:airline_symbols.linenr                      = '⭡'

let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'c'  : 'C',
      \ 'v'  : 'V',
      \ 'V'  : 'V',
      \ 's'  : 'S',
      \ 'S'  : 'S',
      \ ' ' : 'S',
      \ }

" unicode symbols
"let g:airline_left_sep          = '»'
"let g:airline_left_sep          = '▶'
"let g:airline_right_sep         = '«'
"let g:airline_right_sep         = '◀'
"let g:airline_symbols.linenr    = '␊'
"let g:airline_symbols.linenr    = '␤'
"let g:airline_symbols.linenr     = '¶'
"let g:airline_symbols.branch    = '⎇'
"let g:airline_symbols.paste      = 'ρ'
"let g:airline_symbols.paste     = 'Þ'
"let g:airline_symbols.paste     = '∥'
"let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
"let g:airline_left_sep          = ''
"let g:airline_left_alt_sep      = ''
"let g:airline_right_sep         = ''
"let g:airline_right_alt_sep     = ''
"let g:airline_symbols.branch    = ''
"let g:airline_symbols.readonly  = ''
"let g:airline_symbols.linenr    = ''

" }}}
" {{{ autocmd

autocmd filetype html,xml set listchars-=tab:>.
autocmd filetype haskell  set tabstop=2 softtabstop=2 shiftwidth=2
autocmd filetype c,cpp,vim,xml,html,xhtml set foldmethod=syntax
autocmd filetype vim,sh set foldmethod=marker

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

let mapleader=","
" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
nmap <silent> ,/ :nohlsearch<CR>
set pastetoggle=<leader>p
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

" }}}
" {{{ abbreviations

ab atauthor @author matteo.muscella@usi.ch

" }}}

