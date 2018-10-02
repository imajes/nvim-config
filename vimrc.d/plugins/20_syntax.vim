" Section: Vim, Syntax
" ------------------------

" speeddating.vim: use CTRL-A/CTRL-X to increment dates, times, and more
Plug 'tpope/vim-speeddating'

" Syntax checking hacks for vim
Plug 'w0rp/ale'

" color hex codes and color names
Plug 'chrisbra/Colorizer'

"sleuth.vim: Heuristically set buffer options
Plug 'tpope/vim-sleuth'


let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
let g:ale_completion_enabled = 1 " language autocomplete

let g:ale_linters = {
      \   'javascript': ['eslint'],
      \}

let g:ale_ruby_rubocop_executable = 'bundle' " use localized rubocop

" " Syntax checking using syntastic
" Plug 'scrooloose/syntastic'
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 0
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_aggregate_errors = 1
