
set nocompatible              " be iMproved, required
set hidden                    " required by ctrlspace
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" let Vundle manage Vundle, required

Plugin 'VundleVim/Vundle.vim'
" All plugins go here!
" Best tab plugins ever
Plugin 'godlygeek/tabular'
" Handle markdown well
Plugin 'plasticboy/vim-markdown'
" Status line at bottom
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Fuzzy file search
Plugin 'ctrlpvim/ctrlp.vim'
" Adds context-aware commenting
Plugin 'tpope/vim-commentary' " gcc to comment a line
" Syntax highlighting
Plugin 'scrooloose/syntastic'
" Git wrapper
Plugin 'tpope/vim-fugitive'
" Rails plugin for Vim
Plugin 'tpope/vim-rails'
" Sensible nocompat default settings
Plugin 'tpope/vim-sensible'
" Gutter that shows changed lines/etc.
Plugin 'airblade/vim-gitgutter'
" Shows list of buffers in command line
Plugin 'bling/vim-bufferline'
" Solarized colorset
Plugin 'altercation/vim-colors-solarized'
" Improved incremental searching
Plugin 'haya14busa/incsearch.vim'
" Helps create tags with definitions for quick jump-to using Ctags
Plugin 'xolox/vim-easytags'
" Lets you bring up a tagbar with :TagbarToggle
Plugin 'majutsushi/tagbar'
" Better whitespace highlighting
Plugin 'ntpeters/vim-better-whitespace'
" Maps . to repeat plugin commands, not just native commands
Plugin 'tpope/vim-repeat'
" Required by other plugins
Plugin 'xolox/vim-misc'
" Tmux / Airline integration
Plugin 'edkolev/tmuxline.vim'
" Make navigating tmux like vim splits
Plugin 'christoomey/vim-tmux-navigator'
" Vim Space Controller
Plugin 'vim-ctrlspace/vim-ctrlspace'

""" Playing with Nord
Plugin 'arcticicestudio/nord-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


let g:vim_markdown_folding_disabled=1 " Disable folding in Vim Markdown syntax

" ### Break for shell script stuff

set clipboard=unnamed " Fix paste stuff?
syntax on             " enables syntax highlighting
set number            " Turns on line numbers
set mouse=a           " Set mouse to always available
set paste             " Set the paste option to 'on'
set autoindent
set tabstop=2         " default to two spaces for a hard tab
set expandtab         " expand tabes into spaces
set shiftwidth=2      " for when <TAB> is pressed at start of line
set linebreak         " wrap lines on 'word' boundaries

if exists('&breakindent')
  set breakindent      " Indent wrapped lines up to the same level
endif

let g:solarized_termcolors=256
colorscheme solarized
if has('gui_running')
  set background=dark
else
  set background=dark
endif

filetype on " Set automatic filetype detection on

set history=1000 " n lines of command history
set laststatus=2 " Set the statusline to always be shown

set ruler " Show the cursor position at all times

" make searches case-insensitive, unless they contain upper-case letters:
set ignorecase
set smartcase

" Write backup files to a specific directory
set backup
set backupdir=~/.tmp

" Because I use .md for Markdown files
au BufRead,BufNewFile *.md set filetype=markdown
" Because I use .rc for Metasploit ruby scripts
au BufRead,BufNewFile *.rc set filetype=ruby
autocmd BufEnter Makefile setlocal noexpandtab

" Multi-line navigation:
nnoremap k gk
nnoremap <Up> gk
nnoremap j gj
nnoremap <Down> gj

autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile *.markdown setlocal spell

" Make these commonly mistyped commands still work
command! WQ wq
command! Wq wq
command! Wqa wqa
command! W w
command! Q q

" CtrlP config
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

" Syntastic config
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" IncSearch configuration
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

set guifont=Inconsolata\ for\ Powerline:h14
let g:airline_powerline_fonts = 1
let g:Powerline_symbols = 'fancy'
let g:airline_theme='solarized'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"


" FZF configuration
set rtp+=/usr/local/opt/fzf

" This is supposed to fix the issue of Vim colors being broken in Tmux,
" but doesn't appear to be working
if exists('')
set term=screen-256color
endif

" ctrlspace stuff
set wildignore=.git,.svn,CVS,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pyc,tags,*.tags
if has("gui_running")
  " Settings for MacVim and Inconsolata font
  let g:CtrlSpaceSymbols = { "File": "◯", "CTab": "▣", "Tabs": "▢" }
endif

if executable("ag")
  let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
endif

let g:CtrlSpaceIgnoredFiles = '\v(tmp|temp|Godeps)[\/]'


" Timestamp TODO: Fix the format to something else
" Fri 15 Aug 2014 10:45:11 AM EDT (current)
" 2014-08-15_10-45-11 would be ideal
nnoremap ; "=strftime("# %Y-%m-%d %H:%M MEETING #")<CR>P
