" ViM Config
" @author matteo.muscella@usi.ch
"
" {{{ init

" Reload .vimrc file every time gets saved
autocmd! bufwritepost .vimrc source %

set nocompatible

" Install ViM Plug if necessary
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

" Make sure you use single quotes
" Colors
Plug 'chriskempson/base16-vim'
Plug 'altercation/vim-colors-solarized'
Plug 'noahfrederick/vim-hemisu'
Plug 'morhetz/gruvbox'
Plug 'dylanaraps/wal.vim'

" Editor features
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rhysd/vim-clang-format'
Plug 'scrooloose/nerdcommenter'
Plug 'terryma/vim-multiple-cursors'
Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tmux-plugins/vim-tmux'
Plug 'reedes/vim-pencil'
Plug 'reedes/vim-wordy'
Plug 'reedes/vim-lexical'
Plug 'reedes/vim-litecorrect'
Plug 'vim-scripts/sessionman.vim'
Plug 'vim-scripts/restore_view.vim'
Plug 'mhinz/vim-signify'
Plug 'mhinz/vim-startify'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'bling/vim-bufferline'
Plug 'majutsushi/tagbar'
Plug 'mbbill/undotree'
Plug 'jiangmiao/auto-pairs'
Plug 'godlygeek/tabular'

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
Plug 'kien/ctrlp.vim'

" Highlight colors
Plug 'lilydjwg/colorizer'

" Distraction free writing
Plug 'junegunn/goyo.vim'

" Snippets
Plug 'mattn/emmet-vim'
Plug 'msanders/snipmate.vim'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

call plug#end()

filetype plugin indent on

" }}}
" {{{ look

" Tabs and indenting
set tabstop=4                             " Set the size of tabs
set softtabstop=4                         " Set the number of spaces for indeting
set shiftwidth=4                          " Set the size of autoindent
set shiftround                            " Indent relative to beginning of line
set expandtab                             " Make sure our tabs are spaces
set preserveindent                        " Preserve as much of the indent structure
set modelines=3                           " Number of lines of modeline
set backspace=2                           " Set backspace to 'indent,eol,start'

" Help with search
set hlsearch                              " Set incremental search highlight
set incsearch                             " Set incremental search
set ignorecase                            " Set case-insensitive search
set smartcase                             " Override ignore-case option

" Encoding
set encoding=utf8                         " Set character encoding

" Auto read changed files
set autoread                              " Read again a file if changed outside of Vim

" Show line numbers and length
set relativenumber                        " Show line numbers in relative
set number                                " But for current line
set ruler                                 " Show line,column number
set textwidth=119                         " Set max width of text
set nowrap                                " No wrapping of text
set colorcolumn=120                       " Highlight entire column
set nocursorline                          " Highlight current line
set fillchars+=stl:\ ,stlnc:\             " Characters to fill the statuslines
set linespace=1                           " Set line height
set guicursor+=a:blinkon0                 " Disable all blinking cursor
set list                                  " Displaying listchars

" Command line
set noshowmode                            " Show the current mode we are in
set showcmd                               " Show command in the last line of the screen
set cmdheight=1                           " Set number of screen lines for command-line

" Mouse support
set mouse=a                               " Enable the mouse in all modes

" Screen draw
set lazyredraw                            " Screen is not redrawn when in macros

" Code folding
set foldmethod=marker                     " Set preferred method to look for folds

" Completion for command mode
set wildmenu                              " Set comamnd-line completion enhanced mode
set wildchar=<Tab>                        " Character to start wildcard expansion
set wildignore+=*.bak,*.swp,*.swo
set wildignore+=*.a,*.o,*.so,*.pyc,*.class
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.pdf
set wildignore+=*/.git*,*.tar,*.zip
set wildmenu
set wildmode=longest:full,list:full
set completeopt=menu,preview,longest      " Insert mode completion

" Files
set autochdir                                                       " Always use curr. dir.
set confirm                                                         " Confirm changed files

" }}}
" {{{ statusline

set laststatus=2                          " Set statusline: 0,1,2

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.whitespace = 'Ξ'

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

syntax enable                                                       " Enable syntax highlighting
if !empty(glob("~/.custom.vim"))
    source ~/.custom.vim
endif

" Additional cpp highlighting
let g:cpp_class_scope_highlight=1
let g:cpp_experimental_template_highlight=1

set background=dark                                                 " We're using a dark bg

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
        inoremap <C-Space> <C-n>
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

" Toogle highlighting of the current line
nnoremap H :set cursorline! cursorcolumn!<CR>

" Buffers, preferred over tabs now with bufferline.
nnoremap gn :bnext<cr>
nnoremap gp :bprevious<cr>
nnoremap gd :bdelete<cr>
nnoremap gf <C-^>

" Visual mode pressing # searches for the current selection
vnoremap <silent> # :<C-u>call VisualSelection('', '')<cr>?<C-R>=@/<cr><cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tw :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<cr>
au TabLeave * let g:lasttab = tabpagenr()

"" Helper functions

" Don't close window, when deleting a buffer {{{
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction
" }}}

" Toggle text wrapping, wrap on whole words {{{
function! WrapToggle()
    if &wrap
        set list
        set nowrap
    else
        set nolist
        set wrap
    endif
endfunction
nnoremap <leader>w :call WrapToggle()<cr>
" }}}

" Remove multiple empty lines {{{
function! DeleteMultipleEmptyLines()
    g/^\_$\n\_^$/d
endfunction
nnoremap <leader>ld :call DeleteMultipleEmptyLines()<cr>
" }}}

" Split to relative header/source {{{
function! SplitRelSrc()
    let s:fname = expand("%:t:r")

    if expand("%:e") == "h"
        set nosplitright
        exe "vsplit" fnameescape(s:fname . ".cpp")
        set splitright
    elseif expand("%:e") == "cpp"
        exe "vsplit" fnameescape(s:fname . ".h")
    endif
endfunction
nnoremap <leader>le :call SplitRelSrc()<cr>
" }}}

" Strip trailing whitespace, return to cursor at save {{{
function! StripTrailingWhitespace()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfunction

augroup StripTrailingWhitespace
    autocmd!
    autocmd FileType c,cpp,cfg,conf,css,html,perl,python,sh,tex,yaml
        \ autocmd BufWritePre <buffer> :call
        \ StripTrailingWhitespace()
augroup END
" }}}

" }}}
" {{{ abbreviations

ab ata   @author matteo.muscella@usi.ch
ab pcode <pre><code class="php"><CR><TAB><CR></pre></code>

" }}}
" {{{ plugin configs

" NerdTree {
let g:NERDTreeWinPos = "right"
let g:NERDTreeWinSize = 35
let NERDTreeShowHidden = 0
let NERDTreeIgnore = ['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark
map <leader>nf :NERDTreeFind<cr>
" }

" Syntastic {
let g:syntastic_mode_map = {
    \ 'mode': 'passive',
    \ 'active_filetypes':
        \ ['c', 'cpp'] }
let g:syntastic_check_on_wq = 0
noremap <silent><leader>ll :SyntasticCheck<cr>
noremap <silent><leader>lo :Errors<cr>
noremap <silent><leader>lc :lclose<cr>
" }

" Pencil {
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
                            \ | call lexical#init()
                            \ | call litecorrect#init()
augroup END
"}

" Session {
set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize
nmap <leader>sl :SessionList<cr>
nmap <leader>ss :SessionSave<cr>
nmap <leader>sc :SessionClose<cr>
" }

" TagBar {
set tags=tags;/
let g:tagbar_left = 0
let g:tagbar_width = 30
nnoremap <silent> <leader>tt :TagbarToggle<cr>
" }

" UndoTree {
let g:undotree_SetFocusWhenToggle=1
nnoremap <Leader>u :UndotreeToggle<cr>
" }

" }}}

