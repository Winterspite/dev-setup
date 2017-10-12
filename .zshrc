
# You have to use npm to install npm, and that will give you the
# completion.sh file you need.
#source /usr/local/lib/node_modules/npm/lib/utils/completion.sh

source "$HOME/.zsh/antigen/antigen.zsh"
source "$HOME/.zsh/k/k.sh"

# We use primarily oh-my-zsh plugins
antigen use oh-my-zsh

# Set the theme
antigen theme evan

antigen bundle git
antigen bundle brew
antigen bundle brew-cask
antigen bundle ruby
antigen bundle debian
antigen bundle encode64
antigen bundle gem
antigen bundle gitfast
antigen bundle vi-mode
antigen bundle rake
antigen bundle rvm
antigen bundle bundler
antigen bundle zsh-users/zsh-completions src
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle command-not-found
antigen bundle history
antigen bundle vundle

antigen-apply

export PATH=$PATH:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/sbin:/usr/sbin:/usr/local/sbin:/usr/local/bro/bin


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"


# Make homebrew and shell use g++ instead of clang
export HOMEBREW_CC=gcc-5
export HOMEBREW_CXX=g++-5
export CC=gcc-5
export CXX=g++-5
alias cmake=/usr/local/bin/cmake -DCMAKE_C_COMPILER=$CC -DCMAKE_CXX_COMPILER=$CXX

# Ensure Vim is our editor
export EDITOR=vim

# Other Settings
# General zshzle options
setopt autocd             # cd by just typing in a directory name
setopt completealiases
#setopt extendedglob       # use #, ^, and ~ as glob characters
setopt nomatch
setopt no_case_glob

# Turn on vi keybindings <3 <3 <3 :D and other things
bindkey -v
bindkey "^?" backward-delete-char
bindkey "^W" backward-kill-word
bindkey "^U" backward-kill-line

# Make ^H and backspace behave correctly
bindkey "^H" backward-delete-char

# Tab complete options like Vim rather than sh
setopt -Y
export MENU_COMPLETE=1

# Initialize zsh history files
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# zsh completion (zsh installed through Homebrew)
if [ -e $(which brew &> /dev/null && brew --prefix)/etc/zsh_completion ]; then
  source $(brew --prefix)/etc/zsh_completion
fi

zstyle :compinstall filename $HOME/.zshrc

## case-insensitive (all),partial-word and then substring completion
zstyle ':completion:*:*:*:*:*' menu ''
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={a-zA-Z}' #'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
# The following line was moved to ~/.util/after.sh to resolve circular dependencies
#zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
zstyle ':completion:*' verbose false

autoload -Uz compinit && compinit
autoload -Uz promptinit && promptinit

# Fix ESC + /

vi-search-fix() {
  zle vi-cmd-mode
  zle .vi-history-search-backward
}
autoload vi-search-fix
zle -N vi-search-fix
bindkey -M viins '\e/' vi-search-fix
export GOPATH=$HOME/.golang
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin


[ -e "${HOME}/.zsh_aliases" ] && source "${HOME}/.zsh_aliases"
[ -e "${HOME}/.zshrc_local" ] && source "${HOME}/.zshrc_local"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
