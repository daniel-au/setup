" Daniel Au's Vim Configuration File
" Basics
set background=dark          " black background
colorscheme onehalfdark      " colorscheme that matches that of Atom
set t_Co=256                 " true colors - needed for colorscheme
set nocompatible             " use Vim defaults
set backspace=2              " delete over everything, should be in default settings
set expandtab                " tabs become spaces
set tabstop=2                " tabs are equivalent of 2 spaces
set softtabstop=2
set shiftwidth=2             " using the > and < operators to shift indentation
set number relativenumber    " show line number on cursor and relative line numbers otherwise
set ruler                    " display the ruler (shows line and column)
set autoindent               " newline start with same indentation as previous line
set scrolloff=5              " cursor stays this many lines from top and bottom of screen
set hlsearch                 " highlight matches wehen searching
set ignorecase               " case insensitive searching
set splitbelow               " open horizontal split panes below
set splitright               " open vertical split pane to the right
set showmatch                " show matching brackets and curly braces
set textwidth=99             " textwidth is 99 columns
set colorcolumn=+1           " Vertical bar shows end of line width
set tabpagemax=100           " max 100 tabs per window
set autoread                 " updates upon changes to files
set noerrorbells             " disable beeping and flashing

" Lower priority filetypes when doing tab completion for filenames.
" Files I don't normally edit.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.class

" Things I may want enabled
" set cindent                  " c code intending
" set foldmethod=manual        " folds, another options is folding by indent
" set softtabstop=2
" set mouse=a                  " enable mouse usage
" set wrap
"enables plugin indent based on filetype
filetype plugin indent on

"enables syntax highlighting
syntax enable

"load indentation rules and plugins according to filetype detected
if has("autocmd")
  filetype plugin indent on
endif

"call plug#begin('~/.vim/bundle/')
"Plug 'tpope/vim-rails', { 'for' : 'ruby' }
"call plug#end()
"filetype plugin indent on
