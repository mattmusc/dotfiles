" ---"---"--------------------------------------------------------------------
" VIM RC
" @author matteo.muscella@usi.ch
" ---"---"--------------------------------------------------------------------
" {{{ filetype & vundle

set nocompatible
hi clear
if exists("syntax_on")
    syntax reset
endif
filetype off

set rtp+=~/.vim/vundle/Vundle.vim
call vundle#begin('~/.vim/bundle/')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim', {'pinned' : 1}

Plugin 'airblade/vim-gitgutter'

Plugin 'altercation/vim-colors-solarized'
Plugin 'noahfrederick/vim-hemisu'
Plugin 'chriskempson/base16-vim'
Plugin 'morhetz/gruvbox'

Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'rhysd/vim-clang-format'
Plugin 'terryma/vim-multiple-cursors'

Plugin 'urso/haskell_syntax.vim'

call vundle#end()

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
set modelines=1                 " Number of lines of modeline
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
set number                      " Show line numbers
set ruler                       " Show line,column number
set textwidth=79                " Set max width of text
set nowrap                      " No wrapping of text
set colorcolumn=80              " Highlight entire column
set cursorline                  " Highlight current line
set fillchars+=stl:\ ,stlnc:\   " Characters to fill the statuslines
set linespace=6                 " Set line height

" Command line
set showmode                    " Show the current mode we are in
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
set guifont=Menlo:h13           " Set GUI font for my MacVim

" }}}
" {{{ colors

"set t_Co=265
syntax enable                          " Enable syntax highlighting
set background=light                   " Set the colorscheme background
colorscheme hemisu                     " Set the colorscheme

" Additional cpp highlighting
let g:cpp_class_scope_highlight=1
let g:cpp_experimental_template_highlight=1

" Syntax highlighting groups
"hi CursorLineNr term=bold ctermfg=Yellow gui=bold guifg=Yellow
"hi Comment      ctermfg=7
"hi VertSplit	ctermfg=0 ctermbg=none
"hi StatusLine	ctermfg=0 ctermbg=none
"hi StatusLineNC	ctermfg=0 ctermbg=none

"hi Pmenu ctermfg=7 ctermbg=0
"hi PmenuSel ctermfg=0 ctermbg=15
"hi LineNr ctermfg=0 ctermbg=none
"hi CursorLine ctermfg=none ctermbg=none cterm=none
"hi CursorLineNr ctermfg=none ctermbg=0
"hi CursorColumn ctermfg=none ctermbg=0

" }}}
" {{{ statusline

set laststatus=0                       " Set statusline: 0,1,2

" }}}
" {{{ autocmd

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %
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

let mapleader=","                      " Set the leader key

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
nmap <silent> ,/ :nohlsearch<CR>
set pastetoggle=<leader>p

if has("gui_running")                  " Remap Ctrl-Space to completion
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

" }}}
" {{{ abbreviations

ab atauthor @author matteo.muscella@usi.ch

" }}}

