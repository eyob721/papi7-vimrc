" Greeting ASCII-art cat
" echo ">^.^<"

" FIXES ---------------------------------------------------------------- /*{{{*/
" Fix for the ALT key + small letters
" e.g. <A-j>
let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw

" Fix for the ALT key + CAPITAL letters
" e.g. <A-J>
let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
let c = nr2char(1+char2nr(c))
endw

set timeout ttimeoutlen=50

" To allow backspacing over everything in insert mode
"set backspace=indent,eol,start

" Fix compatibility issues with Vi
"set nocompatible

" /*}}}*/

" OPTIONS -------------------------------------------------------------- /*{{{*/
" Show line numbers
set number

" Show relative line numbers
set relativenumber

" Wrap long lines in display, doesnt change the line in the buffer
set nowrap

" Maximum width of a line
set textwidth=80

" Show one plus the textwidth limit using a color column
set colorcolumn=+1

" Number of space the <TAB> character counts for
set tabstop=4

" Number of spaces to indent for autoindent, 'cindent', or >> and << commands
set shiftwidth=0

" Show a menu for autocompletion for commands
set wildmenu

" Highlight all the text that matches what you have typed, as you search
set incsearch

" Ask if you want to exit without saving or not when using ':q' or ':e'
set confirm

" Enable mouse in all modes
set mouse=a

" Turn on syntax highlighting
syntax on

" Minimal number of lines to keep above or below the cursor.
set scrolloff=7 

" Use the system clipboard
set clipboard=unnamedplus

" Split windows to the right or below
set splitright
set splitbelow

" Set the fold method to marker for now
set foldmethod=marker

" /*}}}*/

" MAPPINGS ------------------------------------------------------------- /*{{{*/
" Set leader key
let mapleader = " "
let maplocalleader = " "

" Open my vimrc file in a vertical split for editing
noremap <leader>ev :vsplit $MYVIMRC<CR>

" Source my vimrc file, for changes to take effect
noremap <leader>sv :source $MYVIMRC<CR>

" Move lines up or down in NORMAL mode
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==

" Move lines up or down in INSERT mode
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi

" Move lines up or down in VISUAL mode
vnoremap <A-j> :m '>+1<CR>==gv
vnoremap <A-k> :m '<-2<CR>==gv

" Indent selected lines and stay in visual mode
vnoremap > >gv
vnoremap < <gv

" Better windows naviagtion
nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Disable Arrow keys to practice hjkl
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Right> <nop>
noremap <Left> <nop>

inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Right> <nop>
inoremap <Left> <nop>

" Better way of exiting insert mode
inoremap jk <ESC>

" /*}}}*/

" ABBREVATIONS --------------------------------------------------------- /*{{{*/
" papi7 :)
iabbrev p7 papi7

" For c documentation
iabbrev /** /**<CR> * <CR> * <CR> * <CR> */

" /*}}}*/

" PLUGINS -------------------------------------------------------------- /*{{{*/







" /*}}}*/

