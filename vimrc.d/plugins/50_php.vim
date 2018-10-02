" Section: Language, PHP
" -----------------------------

Plug 'stephpy/vim-php-cs-fixer'

au! BufRead,BufNewFile *.php set filetype=php
autocmd FileType php setlocal et sw=2 sts=2 noet

