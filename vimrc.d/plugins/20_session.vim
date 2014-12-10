" Section: Vim, Sessions
" ------------------------

if exists("g:vundle_install_plugin")
  " Extended session management for Vim
  Plugin 'xolox/vim-session'

  finish
endif

let g:session_autoload = 'yes'
let g:session_default_to_last = 'no'
let g:session_autosave = 'yes'

" hide hidden buffers from the session
set sessionoptions-=buffers
