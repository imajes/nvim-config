" Section: Vim, Quote & Fold
" ----------------------------

" surround.vim: quoting/parenthesizing made simple
Plug 'tpope/vim-surround'

let g:surround_45 = "<% \r %>"
let g:surround_61 = "<%= \r %>"
let g:surround_{char2nr('8')} = "/* \r */"
let g:surround_{char2nr('s')} = " \r"
let g:surround_indent = 1

" unimpaired.vim: pairs of handy bracket mappings
Plug 'tpope/vim-unimpaired'

" Vim's MatchParen for HTML tags
Plug 'gregsexton/MatchTag'

" endwise.vim: wisely add 'end' in ruby, endfunction/endif/more in vim script, etc
Plug 'tpope/vim-endwise'

let g:endwise_no_mappings=1
imap <C-X><CR>   <CR><Plug>AlwaysEnd
imap <expr> <CR> (pumvisible() ? "\<C-Y>\<CR>\<Plug>DiscretionaryEnd" : "\<CR>\<Plug>DiscretionaryEnd")


" Fork of SimpleFold.vim by Mauricio Fernandez. Space-optimized, configurable code folding for vim.
" Plug 'pangloss/vim-simplefold'
"
" map <unique> <Leader>sf <Plug>SimpleFold_Foldsearch
" "map <unique> <silent> <Leader>r <Plug>SimpleFold_Foldsearch

Plug 'pseewald/vim-anyfold'

augroup anyfold
  autocmd Filetype * AnyFoldActivate
augroup END | " Anyfold: Enable polyglot folds in every buffer type

let anyfold_fold_comments=1
set foldlevel=99 | " Anyfold: Open folds to 99 folds deep
