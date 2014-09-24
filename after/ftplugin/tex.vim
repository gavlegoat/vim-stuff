set iskeyword+=:

let g:tex_flavor='latex'

" Automatically wrap text
set textwidth=79
" Turn on spell checking
set spell spelllang=en_us

" This is the section where I disable stupid commands
call IMAP('::', '::', 'tex')
