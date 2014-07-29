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

if has("eval")
  autocmd Syntax   css syn sync minlines=50
  autocmd FileType css set fdm=marker fmr={,}
  autocmd FileType css silent! setlocal omnifunc=csscomplete#CompleteCSS

  autocmd BufRead * if ! did_filetype() && getline(1)." ".getline(2).
        \ " ".getline(3) =~? '<\%(!DOCTYPE \)\=html\>' | setf html | endif

  autocmd FileType javascript,coffee      setlocal et sw=2 sts=2 isk+=$
  autocmd FileType html,xhtml,css,scss    setlocal et sw=2 sts=2

  autocmd FileType haml let b:surround_45 = "- \r"|let b:surround_61 = "= \r"

  autocmd FileType html setlocal iskeyword+=~
endif
