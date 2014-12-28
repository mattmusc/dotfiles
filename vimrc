"""
""" VIM RC
""" @author matteo.muscella@usi.ch
"""
" {{{ filetype & vundle
hi clear
if exists("syntax_on")
    syntax reset
endif
filetype off
filetype plugin on
filetype plugin indent on
syntax on
" }}}
" {{{ Basic
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set nocompatible
set encoding=utf8 
set incsearch
set hlsearch
set mouse=a
set modeline
set ruler
set cursorline
set showmode
set showcmd
set backspace=2
set lazyredraw
set foldmethod=syntax
set wildmenu
set wildmode=longest,full,list
set fillchars=vert:\
set statusline=\ \%F%m%r%h%w\ \ %y\ [%{&ff}]\%=\ [%p%%:\ %l/%L]
set laststatus=2
set cmdheight=1
set colorcolumn=80
set listchars=tab:▸\ ,extends:❯,precedes:❮,trail:·
set list
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
" {{{ Colors
hi LineNr         ctermfg=238
hi CursorLine     ctermbg=236 cterm=none
hi CursorLineNr   ctermfg=3
hi StatusLine     ctermfg=8 cterm=bold
hi StatusLineNC   ctermfg=8
hi Title          ctermfg=243
hi Visual         ctermfg=146
" }}}
