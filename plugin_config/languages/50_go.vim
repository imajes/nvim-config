" Section: Language, Go
" -----------------------------

" core
Plug 'fatih/vim-go'
"Plug 'garyburd/go-explorer' " not maintained, repo no longer exists.

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
if has("balloon_eval")
  autocmd FileType go setlocal noballooneval
end
