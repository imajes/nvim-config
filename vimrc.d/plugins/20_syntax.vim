" Section: Vim, Syntax
" ------------------------

if exists("g:vundle_install_plugin")
  " speeddating.vim: use CTRL-A/CTRL-X to increment dates, times, and more
  Plugin 'tpope/vim-speeddating'

  " Syntax checking hacks for vim
  Plugin 'scrooloose/syntastic'

  " color hex codes and color names
  Plugin 'chrisbra/Colorizer'

  "sleuth.vim: Heuristically set buffer options
  Plugin 'tpope/vim-sleuth'

  finish
endif

if has("eval")
  " set statusline+=%#warningmsg#
  " set statusline+=%{SyntasticStatuslineFlag()}
  " set statusline+=%*

  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 0
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0
  let g:syntastic_aggregate_errors = 1
endif
