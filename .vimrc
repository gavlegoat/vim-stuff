" List of packages I use:
" * Major improvements:
"   - pathogen (consider switching to the built-in package manager in Vim 8+)
"   - YouCompleteMe
"   - syntastic
"   - nerdtree
" * Minor utilities and cosmetics:
"   - delimitMate
"   - vim-airline
"   - vim-colors-solarized
"   - vim-easymotion
"   - vim-localvimrc
" * Language support
"   - haskell-vim
"   - rust.vim
"   - vim-scala
"   - vim-latex/latex-suite
"   - python-mode
"   - julia-vim + vim-slime (also requires tmux)

"" Explicitly turn off compatibility mode (should be off anyway)
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

" Use space as the leader character
let mapleader = " "

" Use fd to leave insert mode instead of Esc
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
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_checkers = ['clang-tidy']
let g:syntastic_cpp_auto_refresh_includes = 1
let g:syntastic_cpp_clang_tidy_args = '-checks=*'
" Ignore python files in syntastic, checking is handled by python-mode
let g:syntastic_ignore_files = ['\.py$']

" YouCompleteMe settings
" Add errors to the location list so we can jump to them easily.
let ycm_always_populate_location_list = 1
" Add a shortcut to go to the definition or declaration of the identifier
" under the cursor.
nnoremap <Leader>jd :YcmCompleter GoTo<CR>

" Start NERDTree on open
autocmd vimenter * NERDTree
" Close vim if NERDTREE is the only buffer left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Set up Merlin for OCaml
let g:opamshare = substitute(system('opam var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"

" Set up vim-slime and tmux for Julia editing
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "{last}"}
let g:slime_dont_ask_default = 1

" To automatically open a Julia REPL when opening julia files, put the
" following in a script and use that script to open:
" (https://proceed-to-decode.com/posts/vim-tmus-julia)
"
" tmux new \; \
"         send-keys "vim $1" Enter \; \
"         split-window -v \; \
"         rename-window julia \; \
"         send-keys "julia" Enter \; \
"         select-pane -t 0 \;
"
" It may also be useful to add `bind X confirm-before kill-session` to
" ~/.tmux.conf in order to easily exit the whole session with C-b X
