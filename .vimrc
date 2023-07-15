" Greeting ASCII-art cat
echo ">^.^<"

" FIXES ----------------------------------------------------------------------
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

" OPTIONS --------------------------------------------------------------------
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

" MAPPINGS -------------------------------------------------------------------
" Move lines up or down in NORMAL mode
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==

" Move lines up or down in INSERT mode
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi

" Move lines up or down in VISUAL mode
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Disable Arrow keys to practice hjkl
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Right> <nop>
noremap <Left> <nop>

