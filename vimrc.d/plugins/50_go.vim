" Section: Language, Go
" -----------------------------

if exists("g:vundle_install_plugin")
  " core
  Plugin 'fatih/vim-go'
  Plugin 'garyburd/go-explorer'

  finish
endif

if has("eval")
  "strip trailing whitespace on save for code files
  autocmd BufWritePre *.go :%s/\s\+$//e

  " the ballonexpr for ruby sucks: large and irrelevant :(
  autocmd FileType go setlocal noballooneval

endif

