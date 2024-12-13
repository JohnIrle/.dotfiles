" Don't try to be vi compatible
set nocompatible

" Helps force plugings to load correctly when turned back on
filetype off

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

" Show file stats
set ruler

" Show line numbers
set number

" Blink cursor on error instead of beeping
set visualbell

" Security
set modelines=0

" Encoding
set encoding=utf-8

" Color Scheme
colorscheme Brogrammer

" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set colorcolumn=80
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set noshiftround

" Cursor Motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Enable Elite mode, No ARRRROWWS!!!!
let g:elite_mode=1

" Disable arrow movement, resize splits instead.
if get(g:, 'elite_mode')
	nnoremap <Up>    :resize +2<CR>
	nnoremap <Down>  :resize -2<CR>
	nnoremap <Left>  :vertical resize +2<CR>
	nnoremap <Right> :vertical resize -2<CR>
endif

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status
set laststatus=2

" Last line
set showmode
set showcmd

" FINDING FILES:
" Search down into subfolders
" Provides tab-completion
set path+=**

" Display all matching files
set wildmenu
set wildignore+=**/node_modules/**

" Quicker Escaping
inoremap jj <ESC>
