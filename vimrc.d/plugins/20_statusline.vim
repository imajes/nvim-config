" Section: Visual, Statusline
" -----------------------------

if exists("g:vundle_install_plugin")
  Plugin 'bling/vim-airline'
  Plugin 'airblade/vim-gitgutter'

  " airline config
  let g:airline_powerline_fonts = 1
  let g:airline#extensions#tabline#enabled = 1
  finish
endif
