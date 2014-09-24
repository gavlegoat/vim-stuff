" Explicitly turn off compatibility mode (should be off anyway)
set nocompatible

" Set vim to use full color range
set t_Co=256

" Load plugins from ~/.vim/bundle
execute pathogen#infect()

" Configure the status bar
let g:airline_theme='powerlineish'
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#tabline#enabled=1

" Enable filetype-specific options
filetype plugin on
filetype indent on

" Configure Haskell conceal
let hscoptions="swA"

" Show line numbers
set nu

" Set tabs to 4 characters and replace them with spaces
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent

" Use incremental search, case sensitive only if capitals are included
set hlsearch        " :nohl is used to clear highlighting
set incsearch
set ignorecase
set smartcase

" Briefly highlight matching parens, brackets, etc.
set showmatch

" Scroll the window before the cursor reaches the edge
set scrolloff=5

" Alwyas show the status bar at the bottom of the window
set laststatus=2

" Show the cursor position with horizontal and vertical lines
set cursorline
set cursorcolumn

" Add new windows below and to the right (default is above and left)
set splitbelow
set splitright

" Color the 80th column
set colorcolumn=80

" Remove the beep sound when an error occurs
set visualbell
set t_vb=

syntax on
colorscheme elflord

" Change the cursor markers
hi CursorLine cterm=NONE ctermbg=darkgrey
hi CursorColumn ctermbg=darkgrey

" Make all text on the colored column white for visibility
hi ColorColumn ctermfg=white

" Highlight trailing whitespace
hi ExtraWhitespace ctermbg=darkgreen ctermfg=black
match ExtraWhitespace /\s\+$/
set list listchars=trail:·

" Disable the 'close all windows except this one' command
map <C-W>o <Nop>
" Insert a matching brace after {<CR> (depends on smartindent)
execute "inoremap {<CR> {<CR>a<CR>a<Esc>d" . &tabstop . "hr}k$c$"

" Recommended set up for latex-suite
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
