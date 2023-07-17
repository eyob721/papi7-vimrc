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
set nocompatible

" /*}}}*/

" OPTIONS -------------------------------------------------------------- /*{{{*/
" Show line numbers
set number

" Show relative line numbers
set relativenumber

" Show the signcoumn
set signcolumn=yes

" Faster completion
set updatetime=300

" Enable type file detection. Vim will be able to try to detect the type of file is use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

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

" Indent the next line the same as the previuos line
set autoindent

" Make indenting smarter
set smartindent

" Show white spaces
set list

" Define whitespace characters
set listchars=tab:➛\ ,trail:·
" set listchars=tab:»\ ,trail:·

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

" Enable terminal gui colors
set termguicolors

" Do not make swap files, it is just clutter
set noswapfile

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

" Toggle white spaces
noremap <leader><Tab> :set list! <CR>


" Fuzzy Finder Key Mappings
noremap <leader>ff :Files<CR>

" Moving buffers
noremap <C-S-PageUp> :-tabmove<CR>
noremap <C-S-PageDown> :+tabmove<CR>

" /*}}}*/

" ABBREVATIONS --------------------------------------------------------- /*{{{*/
" papi7 :)
iabbrev p7 papi7

" For c documentation
iabbrev /** /**<CR> * <CR> * <CR> * <CR> */

" /*}}}*/

" PLUGINS -------------------------------------------------------------- /*{{{*/
" Use vim-plug plugin manager for vim
call plug#begin('~/.vim/plugged')
	" Colorscheme
	Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

	" Autoparis plugin for quotes
	Plug 'vim-scripts/Auto-Pairs'

	" For displaying git signs
	Plug 'airblade/vim-gitgutter'
	Plug 'tpope/vim-fugitive'

	" To comment multiple lines
	Plug 'tpope/vim-commentary'

	" Fuzzy Finder
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'

	" Status line plugin
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'

	"Ale
	" Enable completion where available.
	" This setting must be set before ALE is loaded.
	"
	" You should not turn this setting on if you wish to use ALE as a completion
	" source for other completion plugins, like Deoplete.
	let g:ale_completion_enabled = 1

	Plug 'dense-analysis/ale'

	" Vim surround
	Plug 'tpope/vim-surround'

call plug#end()

" Plugin OPTIONS
" Colorscheme
colorscheme catppuccin-mocha
hi Normal guibg=NONE ctermbg=NONE

" Ale settings
let g:ale_linters = {
\   'c': ['clang'],
\   'javascript': ['eslint'],
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'c': ['trim_whitespace'],
\}
let g:ale_fix_on_save = 1
let g:ale_sign_column_always = 1
" /*}}}*/

" VIMSCRIPT ------------------------------------------------------------ /*{{{*/

" This will make sure that every additional file opened is opened in a tab
" autocmd BufReadPost * tab ball

" Dim special keys (tab:→\ ,trail:.)
autocmd VimEnter * hi SpecialKey ctermfg=grey guifg=grey21
autocmd BufReadPre * hi SpecialKey ctermfg=grey guifg=grey21
autocmd BufRead * hi SpecialKey ctermfg=grey guifg=grey21
autocmd BufNewFile * hi SpecialKey ctermfg=grey guifg=grey21

" /*}}}/*

" STATUS LINE ---------------------------------------------------------- /*{{{*/

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme='catppuccin'

" Custom config to show tab or space and tabwidth
let expand = &expandtab
let size = &tabstop
if expand == 0
	let g:airline_section_y = 'tabs: %{size}'
else
	let g:airline_section_y = 'spaces: %{size}'
endif

" My preference for lines, rows, columns, ...
let g:airline_section_z = '%l/%L  Ln %l, Col %c   %p%%'


"/*}}}*/
