function! ToggleVerbose()
  if !&verbose
    set verbosefile=~/.vim/log/verbose.log
    set verbose=12
  else
    set verbose=0
    set verbosefile=
  endif
endfunction

