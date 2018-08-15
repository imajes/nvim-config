" Section: Language, JSON
" -----------------------------

if exists("g:vundle_install_plugin")
  Plugin 'pangloss/vim-javascript'
  Plugin 'mxw/vim-jsx'
  Plugin 'mattn/emmet-vim'

  finish
endif


" clean expander
let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}


