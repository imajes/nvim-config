" Section: Language, Web
" -----------------------------

Plug 'othree/html5-syntax.vim'
Plug 'mattn/webapi-vim'
Plug 'othree/html5.vim'
Plug 'groenewege/vim-less'
Plug 'cakebaker/scss-syntax.vim'

Plug 'kchmck/vim-coffee-script'
Plug 'tpope/vim-haml'
Plug 'slim-template/vim-slim'
Plug 'tpope/vim-markdown'
Plug 'masukomi/vim-markdown-folding'
Plug 'mustache/vim-mustache-handlebars'

autocmd Syntax   css syn sync minlines=50
autocmd FileType css set fdm=marker fmr={,}
autocmd FileType css silent! setlocal omnifunc=csscomplete#CompleteCSS

autocmd FileType markdown set foldexpr=NestedMarkdownFolds()

autocmd BufRead * if ! did_filetype() && getline(1)." ".getline(2).
      \ " ".getline(3) =~? '<\%(!DOCTYPE \)\=html\>' | setf html | endif

autocmd FileType javascript,coffee      setlocal et sw=2 sts=2 isk+=$
autocmd FileType html,xhtml,css,scss    setlocal et sw=2 sts=2

autocmd FileType haml let b:surround_45 = "- \r"|let b:surround_61 = "= \r"

autocmd FileType html setlocal iskeyword+=~
