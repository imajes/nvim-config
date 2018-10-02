" Section: Vim, Quote & Fold
" ----------------------------

" surround.vim: quoting/parenthesizing made simple
Plug 'tpope/vim-surround'

" unimpaired.vim: pairs of handy bracket mappings
Plug 'tpope/vim-unimpaired'

" Vim's MatchParen for HTML tags
Plug 'gregsexton/MatchTag'

" endwise.vim: wisely add 'end' in ruby, endfunction/endif/more in vim script, etc
Plug 'tpope/vim-endwise'

" Fork of SimpleFold.vim by Mauricio Fernandez. Space-optimized, configurable code folding for vim.
Plug 'pangloss/vim-simplefold'


if has("eval")
  let g:surround_45 = "<% \r %>"
  let g:surround_61 = "<%= \r %>"
  let g:surround_{char2nr('8')} = "/* \r */"
  let g:surround_{char2nr('s')} = " \r"
  let g:surround_indent = 1

  map <unique> <Leader>f <Plug>SimpleFold_Foldsearch
  "map <unique> <silent> <Leader>r <Plug>SimpleFold_Foldsearch
  finish
endif
