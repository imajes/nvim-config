" Section: Vim, Sessions
" ------------------------

if exists("g:vundle_install_plugin")
  " Extended session management for Vim
  Plugin 'xolox/vim-session'

  finish
endif


if has("eval")
  let g:session_autoload = 1
  let g:session_default_to_last = 1
  let g:session_autosave = 1

  " hide hidden buffers from the session
  set sessionoptions-=buffers
endif
