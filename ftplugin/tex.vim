set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_MultipleCompileFormats='pdf, aux'

set textwidth=80

" Use <Leader>le instead of F5 for latex-suite stuff like adding an environment
" or import
nmap <Leader>le <Plug>Tex_FastEnvironmentInsert

" Use <Leader>lc to ask latex-suite to look for relevant labels
nmap <Leader>lc <Plug>Tex_Completion
imap <Leader>lc <Plug>Tex_Completion

" Enable spell checking in TeX files
setl spell
