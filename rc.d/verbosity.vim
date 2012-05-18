function! ToggleVerbose()
  if !&verbose
    set verbosefile=~/.vim/log/verbose.log
    set verbose=15
  else
    set verbose=0
    set verbosefile=
  endif
endfunction
