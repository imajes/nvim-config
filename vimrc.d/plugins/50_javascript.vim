" Section: Language, JSON
" -----------------------------

Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'mattn/emmet-vim'

" clean expander
let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}

autocmd FileType js,jsx        setlocal et ts=2 sw=2 sts=2 expandtab list listchars=tab:»·,trail:·
autocmd FileType js,jsx        setlocal comments=://\  tw=80
