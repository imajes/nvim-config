" Section: Vim, Quote & Fold
" ----------------------------

if exists("g:vundle_install_plugin")
  " surround.vim: quoting/parenthesizing made simple
  Plugin 'tpope/vim-surround'

  " unimpaired.vim: pairs of handy bracket mappings
  Plugin 'tpope/vim-unimpaired'

  " Vim's MatchParen for HTML tags
  Plugin 'gregsexton/MatchTag'

  " endwise.vim: wisely add 'end' in ruby, endfunction/endif/more in vim script, etc
  Plugin 'tpope/vim-endwise'

  " Fork of SimpleFold.vim by Mauricio Fernandez. Space-optimized, configurable code folding for vim.
  Plugin 'pangloss/vim-simplefold'
  finish
endif


if has("eval")
  let g:surround_45 = "<% \r %>"
  let g:surround_61 = "<%= \r %>"
  let g:surround_{char2nr('8')} = "/* \r */"
  let g:surround_{char2nr('s')} = " \r"
  let g:surround_indent = 1

  map <unique> <Leader>f <Plug>SimpleFold_Foldsearch
  "map <unique> <silent> <Leader>r <Plug>SimpleFold_Foldsearch
endif
