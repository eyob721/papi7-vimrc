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
set colorcolumn=+0

" Expand tabs into spaces
set expandtab

" Number of space the <TAB> character counts for
set tabstop=4

" Number of spaces to indent for autoindent, 'cindent', or >> and << commands
set shiftwidth=0

" Indent the next line the same as the previuos line
set autoindent

" Make indenting smarter
set smartindent

" Show white spaces
set nolist

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

" Spell checking file
set spellfile="~/vim_spell_en_us.utf-8.add"

" Spell language
set spelllang=en_us

" Show partial commands and selected words or lines
set showcmd

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
inoremap kj <ESC>

" Toggle white spaces
noremap <leader>- :set list! <CR>

" Toggle spell checking
noremap <leader>= :set spell! <CR>

" Toggle wrapping
noremap <leader>0 :set wrap! <CR>

" Save file
noremap <C-s> :w<CR>

" Select all lines
nnoremap <C-a> ggVGG

" /*}}}*/

" ABBREVATIONS --------------------------------------------------------- /*{{{*/
" papi7 :)
iabbrev p7 papi7

" shebang for python files
iabbrev #!p #!/usr/bin/python3

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

" Buffer closer
Plug 'Asheq/close-buffers.vim'

" Status line plugin
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Ale - linter and analysis
Plug 'dense-analysis/ale'

" Vim surround
Plug 'tpope/vim-surround'

" CoC Auto completion Use release branch (recommended)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" /*}}}*/

" PLUGINS OPTIONS ----------------------------------------------------- /*{{{*/

" ALE settings
let g:ale_linters = {
            \   'sh': ['shellcheck'],
			\   'c': ['clang'],
			\	'python': ['pycodestyle'],
			\   'javascript': ['eslint'],
			\}
" Previous fix
" let g:ale_fixers = {
" 			\   '*': ['remove_trailing_lines', 'trim_whitespace'],
" 			\   'c': ['trim_whitespace'],
" 			\}

let g:ale_fixers = {
            \   'c': ['remove_trailing_lines', 'trim_whitespace'],
            \   'python': ['remove_trailing_lines', 'trim_whitespace'],
			\}

let g:ale_fix_on_save = 1
let g:ale_sign_column_always = 1

" Git Gutter
let g:gitgutter_realtime = 1
let g:gitgutter_eager = 1

" /*}}}*/

" COLORSCHEME ----------------------------------------------------------- /*{{{*/

" Choose colorscheme
colorscheme catppuccin-mocha

" Choose background
hi Normal guibg=NONE ctermbg=NONE

" Dim special keys (tab:→\ ,trail:.)
augroup dim_special_keys
	au!
	au VimEnter,BufReadPre,BufRead,BufNewFile,SourcePost *
				\ hi SpecialKey ctermfg=grey guifg=grey21
augroup END

" /*}}}*/

" COC CONFIG ----------------------------------------------------------- /*{{{*/

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config

" -----------------------------------------------------------------------------
" I disabled this because using <TAB> in a middle of a line is not working,
" When I am in insert mode and when i want to insert a tab in the middle of
" a line or a word, it doesn'to work
" -----------------------------------------------------------------------------

" inoremap <silent><expr> <TAB>
" 			\ coc#pum#visible() ? coc#pum#next(1) :
" 			\ CheckBackspace() ? "\<Tab>" :
" 			\ coc#refresh()
" inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" -----------------------------------------------------------------------------
" My Modification
" <C-j> - for selecting the next completion
" <C-k> - for selecting the prev completion
" NOTE: This mappings are for INSERT mode, so they do not conflict with
" 		<C-j> and <C-k> mappings for windows navigation, which are used in
" 		NORMAL mode
" -----------------------------------------------------------------------------
inoremap <silent><expr> <C-j>
			\ coc#pum#visible() ? coc#pum#next(1) :
			\ CheckBackspace() ? "\<C-j>" :
			\ coc#refresh()
inoremap <expr><C-k> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
" -----------------------------------------------------------------------------

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
			\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-@> to trigger completion
inoremap <silent><expr> <c-@> coc#refresh()

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
	if CocAction('hasProvider', 'hover')
		call CocActionAsync('doHover')
	else
		call feedkeys('K', 'in')
	endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)



" /*}}}*/

" FZF CONFIG ----------------------------------------------------------- /*{{{*/
" -----------------------------------------
" MAPPINGS
" -----------------------------------------

" Find files in the current dir
noremap <leader>ff :Files <CR>
" Find file in Alx/prjects dir
noremap <leader>fa :Files ~/Files/Alx/Workspace/projects/<CR>
" FInd buffers
noremap <leader>fb :Buffers <CR>

" Close the current buffer
nnoremap <C-w>q :Bdelete this<CR>

" Buffer menu
nnoremap <silent> <C-q> :Bdelete menu<CR>

" Navigating buffers
nnoremap <A-PageDown> :bnext<CR>
nnoremap <A-PageUp> :bprev<CR>

" Moving tabs
noremap <C-S-PageUp> :-tabmove<CR>
noremap <C-S-PageDown> :+tabmove<CR>


" /*}}}*/

" AUTOCMDS ------------------------------------------------------------ /*{{{*/

" This will make sure that every additional file opened is opened in a tab
" autocmd BufReadPost * tab ball

" Filetype options
aug filetypes
	au!
	au FileType c,cpp call SetOptionsC()
	au FileType python call SetOptionsPython()
aug END

function SetOptionsC()
	setlocal tabstop=4
	setlocal noexpandtab
endfunction

function SetOptionsPython()
	setlocal tabstop=4
	setlocal expandtab
endfunction
" /*}}}/*

" VIMSCRIPT ------------------------------------------------------------ /*{{{*/

" Vimscript to change the cursor shape when entering insert mode
aug cursor_shape
	if has("autocmd")
		au!
		au VimEnter,InsertLeave * silent execute '!echo -ne "\e[1 q"' | redraw!
		au InsertEnter,InsertChange *
					\ if v:insertmode == 'i' |
					\   silent execute '!echo -ne "\e[5 q"' | redraw! |
					\ elseif v:insertmode == 'r' |
					\   silent execute '!echo -ne "\e[3 q"' | redraw! |
					\ endif
		au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
	endif
aug END

" /*}}}/*

" STATUS LINE ---------------------------------------------------------- /*{{{*/

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

let g:airline_theme='catppuccin'

" Custom config to show tab or space and tabwidth
aug show_tabs_and_width
	au TabEnter,BufRead *
				\ if &expandtab == 0 |
				\   let g:airline_section_y = 'tabs: %{&tabstop}' |
				\ else |
				\   let g:airline_section_y = 'spaces: %{&tabstop}' |
				\ endif |
				\ execute 'AirlineRefresh!'
aug END

" My preference for lines, rows, columns, ...
let g:airline_section_z = '%l/%L  Ln %l, Col %c   %p%%'

"/*}}}*
