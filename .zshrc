# ------------
fpath=(/usr/share/zsh/functions $fpath)
# ------------

# Lines configured by zsh-newuser-install
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.histfile
# bindkey -e      # Emacs
# End of lines configured by zsh-newuser-install

# ZSH Key Mode
bindkey -v      # Vim mode
export KEYTIMEOUT=1     # For error with vi mode and autofill

# The following lines were added by compinstall
zstyle :compinstall filename '/home/eyob721/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall


# My Custom config
# -------------------------------------------------------------
# Default zsh prompt
# PS1='%m%#'

autoload -Uz promptinit colors && colors
promptinit

# Prompt Variables
HOST="%{$fg[green]%}%n"
COLON="%{$reset_color%}:"
CUR_DIR="%{$fg[blue]%}%1~"
DOLLAR="%{$reset_color%}$"

# My prompt
PS1="${HOST}${COLON}${CUR_DIR}${DOLLAR} "

# Prompt Theme
# prompt bigfade

# Starship prompt theme
eval "$(starship init zsh)"


# System aliases
alias ls='ls --color=auto -l'
alias l='ls --color=auto -l'
alias grep='grep --color=auto'
alias pacman='pacman --color auto'
#
# Alx aliases
alias alx_work='cd ~/Files/Alx/Workspace'
alias alx_projects='cd ~/Files/Alx/Workspace/projects'
alias alx_learning='cd ~/Files/Alx/Workspace/learning'
alias gcc_alx='gcc -Wall -Wextra -Werror -pedantic -std=gnu89 -g'
alias val_full='valgrind --show-leak-kinds=all --track-origins=yes -s'
alias betty_ch='betty *.[ch]'
alias mv_tests='mv *main.py *main.c tests/'
alias ghidra='/home/eyob721/Files/Alx/Workspace/tools/ghidra/ghidra_10.3.3_PUBLIC/ghidraRun'

# -------------------------------------------------------------
# End of My Custom config
#

# Luke's config for the Zoomer Shell

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Load aliases and shortcuts if existent.
[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
Load earlier comments...
Tip
ghost commented on Dec 1, 2019 • 
You inspired me to do a rangercd:

rangercd () {
    tmp="$(mktemp)"
    ranger --choosedir="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ --datadir "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"                                               
    fi
}
so you just have to switch
last-dir-path with --choosedir and -d with --datadir

another plugin you could very appreciate is zsh-autosuggestions or fzf (fuzzy finder for ZSH)

also: does lf have an imagepreview?

@gregops
Tip
gregops commented on Dec 2, 2019 • 
Is it possible to have the beam shape cursor without blinking? I tried changing \e[5 q to \e[0 q (this turns off blinking according to the ascii table), but that doesn't seem to work.

Yes, use '\e[2 q' (instead of 1), and '\e[6 q' (instead of 5). That'll give you beam and block cursors respectively, without blinking. Mix and match as desired.

@TomasDrozdik
Tip
TomasDrozdik commented on Dec 12, 2019
Hi, the code which changes your cursor seems to be breaking my tmux.
After running it it immediately exits.
Haven't looked further into it just wanna know if anybody else has been experiencing similar issue?

p.s. this happens only in simple terminal which I have only default version of from your st-luke-git AUR repo

@snamjoshi
Tip
snamjoshi commented on Dec 17, 2019 • 
None of the shortcuts appear to work for me... I have copied the entire script except lines 3-5 (colors) 68-69 (aliases/shortcuts).

I cannot leave insert mode in zsh vi mode. If I press ESC, nothing happens. Or sometimes, can't exactly tell why, it attempts to enter the man page for the command I'm typing. Ctrl+e does nothing and Ctrl+o does nothing. I have lf installed and can run it normally in the terminal.

@okapia
Tip
okapia commented on Dec 17, 2019
I'd also remove line 21 (setting KEYTIMEOUT). Setting it to 1 is not a good idea anyway. The default of 20 is perhaps too high (I use 5). Setting it to 1 gets widely perpetuated as advice for vi mode. At some point, it alleviated one problem while creating a different problem, but since around zsh 5.1 the original problem has been fixed properly.

Make sure you've really got vi mode. What is escape bound to - run bindkey '\e'

The man page printing is the run-help widget which is typically bound to F1. Given that F1 is right next to Escape, could you be sometimes hitting that by mistake.

How are you invoking the "script"? It needs to be sourced or included in .zshrc. Running it as a script will use a subshell which is no help at all.

@SpawnAtis
Tip
SpawnAtis commented on Jan 11, 2020 • 
You inspired me to do a rangercd:

rangercd () {
    tmp="$(mktemp)"
    ranger --choosedir="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ --datadir "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"                                               
    fi
}
so you just have to switch
last-dir-path with --choosedir and -d with --datadir

another plugin you could very appreciate is zsh-autosuggestions or fzf (fuzzy finder for ZSH)

also: does lf have an imagepreview?

I don't understand this part [ --datadir "$dir" ]. It causes an error. I think, u need to leave it as in the original script.
[ -d "$dir" ] means " $dir file exists and is a directory".

@duncan-f
Tip
duncan-f commented on Jan 18, 2020
Hi, the code which changes your cursor seems to be breaking my tmux.
After running it it immediately exits.
Haven't looked further into it just wanna know if anybody else has been experiencing similar issue?

p.s. this happens only in simple terminal which I have only default version of from your st-luke-git AUR repo

Just change your termname variable in your st config.h file: termname = "screen-256color";

@allesklar
Tip
allesklar commented on Apr 18, 2020
Came here via your video and the code to change the cursor in normal vs insert is fantastic.

@dm17
Tip
dm17 commented on Jun 14, 2020 • 
I think my keyboard may be different but this is making the DELETE button non-functional. Is it intentional that DELETE causes some strange mode that causes any letter it is typed on to become capitalized? Having a pain figuring out why home, end, pageup, pagedown work fine in all apps except the terminals. (I have installed larbs.sh btw.)
END works in bash but not zsh, but DELETE does for neither.

@timescam
Tip
timescam commented on Jun 17, 2020
I think my keyboard may be different but this is making the DELETE button non-functional. Is it intentional that DELETE causes some strange mode that causes any letter it is typed on to become capitalized? Having a pain figuring out why home, end, pageup, pagedown work fine in all apps except the terminals. (I have installed larbs.sh btw.)
END works in bash but not zsh, but DELETE does for neither.

found the fix: https://stackoverflow.com/a/8645267

@duncan-f
Tip
duncan-f commented on Jun 17, 2020
I think my keyboard may be different but this is making the DELETE button non-functional. Is it intentional that DELETE causes some strange mode that causes any letter it is typed on to become capitalized? Having a pain figuring out why home, end, pageup, pagedown work fine in all apps except the terminals. (I have installed larbs.sh btw.)
END works in bash but not zsh, but DELETE does for neither.

I think this is due to st suckless terminal, but i'm not sure.

@fayefossegrim
Tip
fayefossegrim commented on Jun 26, 2020 • 
You may also enjoy using url-quote-magic
https://github.com/zsh-users/zsh/blob/master/Functions/Zle/url-quote-magic

it gives me this error. I did all the steps from here

https://stackoverflow.com/questions/20357441/zsh-on-10-9-widgets-can-only-be-called-when-zle-is-active#comment33992880_20357441

and still, same error when opening the shell. Can u help me please/ im alo a noobie and im not 100% what all of this means but i want to make my shell practical & lit af xD

thank you so much for your effort on writing this code for us :( i wish i would've been smarter to understand what im doing wrong

@fayefossegrim
Tip
fayefossegrim commented on Jun 26, 2020
THAAAAAAAAAAANNNNNNNNNNNKKKKKKKKKKKIIIIIIIIIIIEEEESSSSSSS <3 <3
now my shell looks sooooo faaannncyyyyyy <3 <3 <3

@zaid-g
Tip
zaid-g commented on Aug 19, 2020
Also have the same problem as @Arjentix , this for some reason changes my cursor inside actual Vim to always look like it's in insert.

@dm17
Tip
dm17 commented on Aug 19, 2020
Also have the same problem as @Arjentix , this for some reason changes my cursor inside actual Vim to always look like it's in insert.

There is a vim emulation somewhere in this zsh config I think.

@zaid-g
Tip
zaid-g commented on Aug 19, 2020 • 
@dm17 are you referring to bindkey -v? I know there are vi keybindings in zsh, why would that break the actual Vim cursor though (and how to fix)? The # Change cursor shape for different vi modes. block is the one that breaks the cursor in Vim.

@corneliusroemer
Tip
corneliusroemer commented on Oct 13, 2020
The code to change the cursor based on vi mode works perfectly, thanks so much! I've been trying loads of suggestions from SO but they all had bugs.

Wit this table, one can customise the type of cursor one gets as requested by @yochem and suggested by @gregops:

Replace number in '\e[5 q' with number below for customisation:
CSI Ps SP q
          Set cursor style (DECSCUSR), VT520.
            Ps = 0  ⇒  blinking block.
            Ps = 1  ⇒  blinking block (default).
            Ps = 2  ⇒  steady block.
            Ps = 3  ⇒  blinking underline.
            Ps = 4  ⇒  steady underline.
            Ps = 5  ⇒  blinking bar, xterm.
            Ps = 6  ⇒  steady bar, xterm.
(source: https://invisible-island.net/xterm/ctlseqs/ctlseqs.html)

@JDeepD
Tip
JDeepD commented on Oct 25, 2020
I'd also remove line 21 (setting KEYTIMEOUT). Setting it to 1 is not a good idea anyway. The default of 20 is perhaps too high (I use 5). Setting it to 1 gets widely perpetuated as advice for vi mode. At some point, it alleviated one problem while creating a different problem, but since around zsh 5.1 the original problem has been fixed properly.

Make sure you've really got vi mode. What is escape bound to - run bindkey '\e'

The man page printing is the run-help widget which is typically bound to F1. Given that F1 is right next to Escape, could you be sometimes hitting that by mistake.

How are you invoking the "script"? It needs to be sourced or included in .zshrc. Running it as a script will use a subshell which is no help at all.

Setting KEYTIMEOUT=1 or deleting it will create problems as you will not be able to bind the jj key to Esc. The minimum KEYTIMEOUT for making jj work is 20ms. So if someone wants to map jj to Esc , he has to set KEYTIMEOUT=20

@therajat08
Tip
therajat08 commented on Nov 4, 2020
turn CTRL+z into a toggle switch

ctrlz() {
  if [[ $#BUFFER == 0 ]]; then
    fg >/dev/null 2>&1 && zle redisplay
  else
    zle push-input
  fi
}
zle -N ctrlz
bindkey '^Z' ctrlz
what is this used for?

@rod-stuchi
Tip
rod-stuchi commented on Nov 5, 2020
hi @therajat08 it's for alternate your processes in background.
Try this:

open vim, then ctrl+z (back to terminal), then ctrl+z (back to vim)

@Blugil
Tip
Blugil commented on Dec 31, 2020
Both the bindkey -s '^o' 'lfcd\n' and bindkey '^e' edit-command-line keybinds don't work for me. I saw someone above that had a similar issue and I've tried my best to look up how to do this on my own. I've made sure there are no conflicting keybinds but I've also set a myriad of different keybinds besides ^o and ^e just in case but to no avail. Let me know if anyone else has had this issue and how you fixed it or if you know the fix.

@souvikhaldar
Tip
souvikhaldar commented on Dec 31, 2020
hi @therajat08 it's for alternate your processes in background.
Try this:

open vim, then ctrl+z (back to terminal), then ctrl+z (back to vim)

Ctrl+z did take me to terminal from vim, but pressing ctrl+z from terminal did not take me back to vim, I ran ‘fg’ for that.

@dm17
Tip
dm17 commented on Dec 31, 2020
starship.rs might be a candidate to replace a bit of this... Thoughts?

@RichardBronosky
Tip
RichardBronosky commented on Feb 17, 2021
@Arjentix @zaid-g
It turns out that, unless told to do otherwise, vim will just use whatever cursor shaped your terminal/shell is currently using. And when you type vim and hit <return> (even if you hit <esc> to enter vi-mode and then hit <return>) you are in main or viins mode/keymap in your shell and the zle-keymap-select function has used echo -ne '\e[5 q' to set your cursor to "blinking vertical bar". You can overcome this by doing:

echo -ne "\e[1 q"; vim
Or in vim you can do:

:!echo -ne "\e[1 q";
That is not convenient, but if it's possible, then it has to be scriptable! Sure enough, armed with that info, I was able to find this…

Taken from https://vim.fandom.com/wiki/Change_cursor_shape_in_different_modes#For_Terminal_on_macOS adding this to my ~/.vim/vimrc gave me the same behavior in vim as in zsh.

"Mode Settings

let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

"Cursor settings:

"  1 -> blinking block
"  2 -> solid block 
"  3 -> blinking underscore
"  4 -> solid underscore
"  5 -> blinking vertical bar
"  6 -> solid vertical bar
@RichardBronosky
Tip
RichardBronosky commented on Mar 3, 2021 • 
Also, it seems that Luke is not updating this gist and the voidrice version is being maintained instead. To compare you can vimdiff 2 process substitutions curling the raw URLs of each like so:

vimdiff <(curl -sL "https://gist.github.com/LukeSmithxyz/e62f26e55ea8b0ed41a65912fbebbe52/raw/zshrc") \
        <(curl -sL "https://github.com/LukeSmithxyz/voidrice/raw/master/.config/zsh/.zshrc")
NOTE
A process substitution is shell syntactic sugar that creates temporary FIFOs (ie /dev/fd/11) for a process. These can be used where a file is expected. Learn it. Love it.

@dm17
Tip
dm17 commented on Mar 3, 2021
I ended up going with fish + starship.rs

@chris-w-jarvis
Tip
chris-w-jarvis commented on Mar 16, 2021 • 
Also, it seems that Luke is not updating this gist and the voidrice version is being maintained instead.

Thanks @RichardBronosky , for anyone else attempting to install this on MacOS, the last line where you install the syntax highlighting did not work for me out of the box. You will need to also install the syntax highlighting plugin from https://github.com/zdharma/fast-syntax-highlighting and then correctly reference your install location in the last line of the .zshrc file.

Also, the autosuggestions were the killer feature of Fish for me, here is good alternative for zsh: https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md It works well but it doesn't seem to query the global history as Fish does.

@array-in-a-matrix
Tip
array-in-a-matrix commented on Sep 21, 2021
You inspired me to do a rangercd:

rangercd () {
    tmp="$(mktemp)"
    ranger --choosedir="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ --datadir "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"                                               
    fi
}
so you just have to switch
last-dir-path with --choosedir and -d with --datadir

another plugin you could very appreciate is zsh-autosuggestions or fzf (fuzzy finder for ZSH)

also: does lf have an imagepreview?

I am a bit late to reply lol but lf actually does have image preview check out lfimg. It works flawless and I prefer it over ranger.

@jessebrennan
Tip
jessebrennan commented on Dec 28, 2021 • 
@RichardBronosky (and @Arjentix and @zaid-g if you're still following),

Taken from https://vim.fandom.com/wiki/Change_cursor_shape_in_different_modes#For_Terminal_on_macOS adding this to my ~/.vim/vimrc gave me the same behavior in vim as in zsh.

None of these worked for me, but what finally got the cursor to reset was:

:silent !echo -ne "\e[2 q"
@RyanTippsTX
Tip
RyanTippsTX commented on Mar 9, 2022
Did you come up with the name "zoomer" shell? That is hilarious

@eyob721
 
Leave a comment
No file chosen
Attach files by dragging & dropping, selecting or pasting them.
Footer
© 2023 GitHub, Inc.
Footer navigation
Terms
Privacy
Security
Status
Docs
Contact GitHub
Pricing
API
Training
Blog
About
