set nocompatible                " choose no compatibility with legacy vi
syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation

syntax enable "Enable syntax hl
set cursorline

"" Set font according to system
" Setting for Mac
set gfn=Menlo:h14
set shell=/bin/bash
" Setting for Windows
" set gfn=Bitstream\ Vera\ Sans\ Mono:h10
" Setting for Linux
" set gfn=Monospace\ 10
" set shell=/bin/bash

if has("gui_running")
  set guioptions-=T
  set t_Co=256
  set background=dark
  colorscheme solarized
  set nu
else
  set nonu
endif

"" Leader key to be comma (,) 
let mapleader = ","
let g:mapleader = ","

"" Easy editting of vimrc
map <leader>e :e! ~/.vimrc<cr>
autocmd! bufwritepost vimrc source ~/.vimrc
map <leader>w :w!<cr>

"" UI
set ruler                       " Show the numbers (where you are, etc)
set cmdheight=1                 " The bottom command bar higher
set so=7                        " Keep the screen moving faster
set laststatus=2
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ \ Line:\ %l/%L:%c

function! CurDir()
    let curdir = substitute(getcwd(), '/Users/amir/', "~/", "g")
    return curdir
endfunction

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    else
        return ''
    endif
endfunction



"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set softtabstop=2               " Delete makes easy
set expandtab                   " use spaces, not tabs (optional)
set autoindent
set backspace=indent,eol,start  " backspace through everything in insert mode
set wrap

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

"" Add-ons
call pathogen#infect()

"" Python
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self
