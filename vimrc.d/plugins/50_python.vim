" Section: Language, Python
" -----------------------------

Plug 'vim-scripts/indentpython.vim'
Plug 'tweekmonster/django-plus.vim'

let g:python3_host_prog='/usr/local/bin/python3'

au! BufRead,BufNewFile *.py set filetype=python
autocmd FileType py setlocal et sw=2 sts=2

