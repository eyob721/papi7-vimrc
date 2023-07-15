# Options

There are two types of options in vim

1.  Boolean
2.  Options with value

Boolean options can be either false or true, (off or on)

Options with value take a value

# List of options

Only use the highlighted options, leave the others to their defaults

NOTE:

- "" = empty string
- off = false
- on = true

| Option | Default | My preference | Description |
| --- | --- | --- | --- |
| number | off | on  | Shows line numbers |
| relativenumber | off | on  | Show line numbers relative to the line which the cursor is on |
| numberwidth | 4   | Default | Width of the line number column on the left-hand side |
| wrap | on  | off | Changes how the text is displayed, it doesn't change the text in the buffer. |
| textwidth | 0   | 80  | Maximum width of text that can be written on a line, when inserting text.<br>A longer line will be broken after white space.<br>Zero value disables this option.<br>**NOTE:** It only works when inserting text, doesn't work on an already written text |
| colorcolumn | 0   | +1  | 'colorcolumn' is a comma-separated list of screen columns that are<br>highlighted with ColorColumn \|hl-ColorColumn\|. Useful to align<br>text. Will make screen redrawing slower.<br>The screen column can be an absolute number (like 80), or a number preceded with<br>'+' or '-', which is added to or subtracted from 'textwidth'. ><br>`:set cc=+1 " highlight column after 'textwidth'`<br>`:set cc=+1,+2,+3 " highlight three columns after 'textwidth'`<br>`:hi ColorColumn ctermbg=lightgrey guibg=lightgre` |
| shiftround | off | Default | Round indent to multiple of 'shiftwidth'. Applies to > and < commands.<br>CTRL-T and CTRL-D in Insert mode always round the indent to<br>a multiple of 'shiftwidth' (this is Vi compatible). |
| tabstop | 8   | 4   | Number of spaces that the &lt;TAB&gt; character counts for |
| shiftwidth | 8   | 0   | Number of spaces to use for each step of autoindent.<br>Also used for 'cindent', >> and << commands.<br>When Zero value is set, shiftwidth takes the value of tabstop |
| expandtab | off | Default | Expand tabs into spaces |
| autoindent |     |     |     |
| smartindent |     |     |     |
| cindent |     |     |     |
| wildmenu | off | on  | When 'wildmenu' is on, command-line completion operates in an enhanced mode.<br>It shows a menu for auto completion |
| incsearch | off | on  | With Vim incremental search, you can see the search results as you start typing the search word. It highlights all the text that matches what you have entered so far. |
| confirm | off | on  | When 'confirm' is on, certain operations that would normally<br>fail because of unsaved changes to a buffer, e.g. ":q" and ":e",<br>instead raise a \|dialog\| asking if you wish to save the current<br>file(s). |
| mouse | ""  | a   | Enable the use of the mouse.<br>The mouse can be enabled for different modes:<br>\- n Normal mode and Terminal modes<br>\- v Visual mode<br>\- i Insert mode<br>\- c Command-line mode<br>\- h all previous modes when editing a help file<br>\- a all previous modes<br>\- r for \|hit-enter\| and \|more-prompt\| prompt |
| clipboard | unnamed | unnamedplus | In linux OS, you have two clipboards<br>\- system clipboard (unnamedplus, or "+)<br>\- selection clipboard (unnamed, or "*)<br>Vim uses by default the selection clipboard, to use the system clipboard use `:set clipboard=unnamedplus`<br>Now you can<br>\- `Ctrl C` in other programs and put in Vim with `p` on all three platforms,<br>\- yank in Vim with `y` and `Ctrl V` in other programs on all three platforms.<br>Be aware that copying/pasting from the system clipboard **will not work if `:echo has('clipboard')` returns 0**.<br>In this case, vim is not compiled with the `+clipboard` feature and you'll have to install a different version or recompile it.<br>Some linux distros supply a minimal vim installation by default, but if you **install the `vim-gtk` or `vim-gtk3` package** you can get the extra features nonetheless. |
| backspace | ""  | "indent,eol,start" | Influences the working of &lt;BS&gt;, &lt;Del&gt;, CTRL-W and CTRL-U in Insert<br>mode. This is a list of items, separated by commas. Each item allows<br>a way to backspace over something:<br>indent  = allow backspacing over autoindent<br>eol  = allow backspacing over line breaks (join lines)<br>start  = allow backspacing over the start of insert; CTRL-W and CTRL-U stop once at the start of insert.<br>nostop = like start, except CTRL-W and CTRL-U do not stop at the start of insert.<br>When the value is empty, Vi compatible backspacing is used, none of<br>the ways mentioned for the items above are possible. |
| syntax | ""  | enable | Enable syntax highlighting |
| splitright | off | on  | When on, splitting a window will put the new window right of the current one. `:vsplit` |
| splitbelow | off | on  | When on, splitting a window will put the new window below of the current one. `:split` |
| backup | off | Default | Make a backup before overwriting a file. Leave it around after the file has been successfully written. |
| scrolloff | 0   | 7   | Minimal number of screen lines to keep above and below the cursor.<br>This will make some context visible around where you are working. If<br>you set it to a very large value (999) the cursor line will always be<br>in the middle of the window (except at the start or end of the file or<br>when long lines wrap). |
| signcolumn | auto | yes | Whether or not to draw the signcolumn. Valid values are:<br>"auto" = only when there is a sign to display<br>"no" = never<br>"yes" = always<br>"number" = display signs in the 'number' column. If the number column is not present, then behaves like "auto". |