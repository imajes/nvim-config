" Section: Language, TerraForm
" -----------------------------

Plug 'hashivim/vim-terraform'
Plug 'jvirtanen/vim-hcl'

let g:terraform_align=1
let g:terraform_fmt_on_save=1


" terraform stuffs...
" au! BufRead,BufNewFile *.json set filetype=json
"
" augroup json_autocmd
"   autocmd!
"   autocmd FileType json set autoindent
"   autocmd FileType json set formatoptions=tcq2l
"   autocmd FileType json set textwidth=78 shiftwidth=2
"   autocmd FileType json set softtabstop=2 tabstop=8
"   autocmd FileType json set expandtab
"   autocmd FileType json set foldmethod=syntax
" augroup END

