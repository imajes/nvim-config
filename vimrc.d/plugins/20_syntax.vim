" Section: Vim, Syntax/ALE
" ------------------------

" speeddating.vim: use CTRL-A/CTRL-X to increment dates, times, and more
Plug 'tpope/vim-speeddating'

" Syntax checking hacks for vim
Plug 'dense-analysis/ale'

" color hex codes and color names
Plug 'chrisbra/Colorizer'

"sleuth.vim: Heuristically set buffer options
Plug 'tpope/vim-sleuth'

let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
"let g:ale_completion_enabled = 0 " language autocomplete

let g:ale_linters = {
                     \   'ruby': ['rubocop', 'standardrb'],
                     \   'eruby': [],
                     \   'javascript': ['eslint', 'prettier-standard'],
                     \   'css': ['stylelint'],
\}

let g:ale_fixers = {
                    \   '*': ['remove_trailing_lines', 'trim_whitespace'],
                    \   'ruby': ['rubocop', 'standardrb'],
                    \   'eruby': [],
                    \   'javascript': ['eslint', 'prettier-standard'],
                    \   'typescript': ['eslint'],
                    \   'css': ['prettier'],
                    \   'html': ['prettier'],
\}

let g:ale_fix_on_save = 1
let g:ale_lint_on_save = 1
let g:ale_linters_explicit = 1
let g:ale_history_log_output = 1


let g:ale_ruby_rubocop_executable = 'bundle' " use localized rubocop
