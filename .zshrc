# ------------
fpath=(/usr/share/zsh/functions $fpath)
# ------------

# Lines configured by zsh-newuser-install
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.histfile
# bindkey -e      # Emacs
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename '/home/eyob721/.zshrc'

# My Custom config
# -------------------------------------------------------------
# Default zsh prompt
# PS1='%m%#'

export EDITOR=vim
export VISUAL=vim

# Key mappings
# --------------------------------------------------------------------------
# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# ZSH Key Mode
bindkey -v              # Vim mode
export KEYTIMEOUT=1     # For error with vi mode and autofill

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
    zle -K viins    # Initiate to vim insert mode
    echo -ne "\e[5 q"   # Beam cursor
}
zle -N zle-line-init
echo -ne '\e[5 q' # cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # cursor for each new prompt.

# Edit command line in vim with ctrl-e:
autoload -z edit-command-line
zle -N edit-command-line
bindkey '^e' edit-command-line

# --------------------------------------------------------------------------
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

# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
# -------------------------------------------------------------
# End of My Custom config
#
