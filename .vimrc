" Daniel Au's Vim Configuration File
" Basics

" How it looks
colorscheme onehalfdark            " colorscheme that matches that of Atom
set background=dark                " black background
set t_Co=256                       " true colors - needed for colorscheme

" tbh idk what this does
set nocompatible                   " use Vim defaults

" Tabs and indentation - spaces are better than tabs
set autoindent                     " newline start with same indentation as previous line
set backspace=2                    " delete over everything, should be in default settings
set expandtab                      " tabs become spaces
set shiftwidth=2                   " using the > and < operators to shift indentation
set softtabstop=2
set tabstop=2                      " tabs are equivalent of 2 spaces

" Cursor lines
set number relativenumber          " show line number on cursor and relative line numbers otherwise
set ruler                          " display the ruler (shows line and column)
set scrolloff=5                    " cursor stays this many lines from top and bottom of screen

" Searching
set hlsearch                       " highlight matches wehen searching
set ignorecase                     " case insensitive searching
set showmatch                      " show matching brackets and curly braces
" cursor search doesn't jump to the next occurrence
noremap * *``
noremap # #``

" Tabs and Panes
set splitbelow                     " open horizontal split panes below
set splitright                     " open vertical split pane to the right
set tabpagemax=100                 " max 100 tabs per window

" Width
set textwidth=99                   " textwidth is 99 columns
set colorcolumn=+1                 " Vertical bar shows end of line width

" Clipboard
set clipboard^=unnamed,unnamedplus " vim yanking and pasting uses system clipboard
" Other?
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


" Pathogen package management
execute pathogen#infect()
