" Section: Vim, Sessions
" ------------------------

" Extended session management for Vim
Plug 'xolox/vim-session'

let g:session_autoload = 'no'
let g:session_default_to_last = 'no'
let g:session_autosave = 'yes'

" use vim settings, not session
let g:session_persist_font = 0
let g:session_persist_colors = 0


set ssop-=buffers    " hide hidden buffers from the session
set ssop-=options    " do not store global and local values in a session
set ssop-=folds      " do not store folds
set sessionoptions-=help " do not restore helps

