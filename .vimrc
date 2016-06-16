" Tabs create spaces
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" Line number
set number

" Ruler
set ruler

" autoindent
set autoindent

set scrolloff=5

filetype plugin indent on "enables plugin indent based on filetype

syntax enable "enables syntax highlighting

set background=dark

"load indentation rules and plugins according to filetype detected

if has("autocmd")
  filetype plugin indent on
endif

"show matching brackets and curly braces
set showmatch

"enable mouse usage cuz I'm a noob
set mouse=a

"call plug#begin('~/.vim/bundle/')
"Plug 'tpope/vim-rails', { 'for' : 'ruby' }
"call plug#end()
"filetype plugin indent on

"look at nikhils"
