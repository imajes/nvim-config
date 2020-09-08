" Section: Language, Python
" -----------------------------

Plug 'vim-scripts/indentpython.vim'
Plug 'tweekmonster/django-plus.vim'

au! BufRead,BufNewFile *.py set filetype=python
autocmd FileType py setlocal et sw=2 sts=2

