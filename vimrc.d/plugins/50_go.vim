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

  " syntax highlighting
  let g:go_highlight_functions = 1
  let g:go_highlight_methods = 1
  let g:go_highlight_structs = 1
  let g:go_highlight_interfaces = 1
  let g:go_highlight_operators = 1
  let g:go_highlight_build_constraints = 1

  let g:go_fmt_command = "goimports"

  " this is to prevent the syntastic checker from 
  " running on go, to see if this improves ui perf
  let g:syntastic_go_checkers = ['go', 'golint', 'govet', 'errcheck']
  let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

  " the ballonexpr for ruby sucks: large and irrelevant :(
  autocmd FileType go setlocal noballooneval

  finish
endif

