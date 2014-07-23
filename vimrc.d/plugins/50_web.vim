" Section: Language, Web
" -----------------------------

if exists("g:vundle_install_plugin")
  Plugin 'othree/html5-syntax.vim'
  Plugin 'mattn/webapi-vim'
  Plugin 'othree/html5.vim'

  Plugin 'kchmck/vim-coffee-script'
  Plugin 'tpope/vim-haml'
  Plugin 'slim-template/vim-slim'
  Plugin 'tpope/vim-markdown'
  Plugin 'mustache/vim-mustache-handlebars'

  finish
endif

autocmd Syntax   css  syn sync minlines=50
autocmd FileType css set fdm=marker fmr={,}
autocmd BufRead * if ! did_filetype() && getline(1)." ".getline(2).
            \ " ".getline(3) =~? '<\%(!DOCTYPE \)\=html\>' | setf html | endif

autocmd FileType javascript,coffee      setlocal et sw=2 sts=2 isk+=$
autocmd FileType html,xhtml,css,scss    setlocal et sw=2 sts=2

