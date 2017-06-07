" Daniel Au's Vim Configuration File

" Basics
colorscheme darkblue         " colorscheme meant for black background
set background=dark          " black background
set nocompatible             " use Vim defaults
set backspace=2              " delete over everything, should be in default settings
set expandtab                " tabs become spaces
set tabstop=4                " tabs are equivalent of 4 spaces
set shiftwidth=4             " using the > and < operators to shift indentation
set number                   " show line number
set ruler                    " display the ruler (shows line and column)
set autoindent               " newline start with same indentation as previous line
set scrolloff=5              " cursor stays this many lines from top and bottom of screen
set hlsearch                 " highlight matches wehen searching
set ignorecase               " case insensitive searching
set splitbelow               " open horizontal split panes below
set splitright               " open vertical split pane to the right
set showmatch                " show matching brackets and curly braces

" Lower priority filetypes when doing tab completion for filenames.
" Files I don't normally edit.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.class

" Things I may want enabled
" set cindent                  " c code intending
" set foldmethod=manual        " folds, another options is folding by indent
" set softtabstop=2
" set mouse=a                  " enable mouse usage
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
