" Section: Vim, Cleaning Files
" ------------------------------

" autocomplete - write all on lost focus
au FocusLost * silent! :wa

" when focus lost, exit insert mode
"au FocusLost * :stopinsert

" lose extraneous whitespace at end of lines
cnoreabbrev  ws %s/\s\+$//g
map <Leader>fm :g/^\s*$/,/\S/-j<Bar>%s/\s\+$//<CR>

" squash tabs down; (better is :retab)
cnoreabbrev  squash %s/\s\{4\}/  /g

" prevent folds for buffer
cnoreabbrev  nf set nofoldenable

"let &listchars="tab:\<M-;>\<M-7>,trail:\<M-7>"
set listchars=tab:>\ ,trail:-
set listchars+=extends:>,precedes:<

if version >= 700
  set listchars+=nbsp:+
endif
