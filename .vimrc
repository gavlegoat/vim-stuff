" Explicitly turn off compatibility mode (should be off anyway)
set nocompatible

" Set vim to use full color range
set t_Co=256
" Switches the cursor to orange in insert mode and back into gray in other
" modes. Just helps keep from accidentally typing commands. May break in
" certain terminals.
let &t_SI = "\<Esc>]12;orange\x7"
let &t_EI = "\<Esc>]12;gray\x7"
autocmd VimLeave * silent !echo -ne "\033]112\007"

" Load plugins from ~/.vim/bundle
execute pathogen#infect()

" Configure the status bar
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#tabline#enabled=1

" Enable filetype-specific options
filetype plugin on
filetype indent on

" Show line numbers
set nu

" Set tabs to 2 characters and replace them with spaces
set tabstop=2
set shiftwidth=2
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
"set cursorline
"set cursorcolumn

" Add new windows below and to the right (default is above and left)
set splitbelow
set splitright

" Color the column right after textwidth
set colorcolumn=+1

" Remove the beep sound when an error occurs
set visualbell
set t_vb=

syntax on
set background=dark
" Solarized needs to be told that I'm working with standard terminal colors
let g:solarized_termcolors=256
colorscheme solarized

" Highlight trailing whitespace
hi ExtraWhitespace ctermbg=darkgreen ctermfg=black
match ExtraWhitespace /\s\+$/
set list listchars=trail:·

" Disable the 'close all windows except this one' command
map <C-W>o <Nop>

" Insert closing brace in C style languages
" This should be handled by delimitMate now
"inoremap {<CR> {<CR>}<ESC>O

let mapleader = " "

inoremap fd <ESC>

" Use <Leader>ww to go to the next window
nnoremap <Leader>ww <C-w><C-w>

" <Leader>s reloads .vimrc and <Leader>e edits it
nnoremap <Leader>s :source $MYVIMRC<CR>
nnoremap <Leader>e :e $MYVIMRC<CR>

" Use latex-suite for Rnw files
autocmd BufRead,BufNewFile *.Rnw set filetype=tex
" Vim opens .smt files with some weird filetype
autocmd BufRead,BufNewFile *.smt set filetype=txt

" Remove backup files
set nobackup

" Syntastic setup
set statusline+=%#warningmwg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_cpp_compiler_options = " -std=c++11"

" Start NERDTree on open
autocmd vimenter * NERDTree
" Close vim if NERDTREE is the only buffer left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
