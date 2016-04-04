" Section: Language, JSON
" -----------------------------

if exists("g:vundle_install_plugin")
  Plugin 'stephpy/vim-php-cs-fixer'
  finish
endif

" json stuffs...
au! BufRead,BufNewFile *.php set filetype=php

