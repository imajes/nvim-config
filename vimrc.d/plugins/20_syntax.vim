" Section: Vim, Syntax
" ------------------------

if exists("g:vundle_install_plugin")
  " speeddating.vim: use CTRL-A/CTRL-X to increment dates, times, and more
  Plugin 'tpope/vim-speeddating'

  " Syntax checking hacks for vim
  " Plugin 'scrooloose/syntastic'
  Plugin 'w0rp/ale'

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

  let g:ale_sign_error = '●' " Less aggressive than the default '>>'
  let g:ale_sign_warning = '.'
  let g:ale_lint_on_enter = 0 " Less distracting when opening a new file

  let g:ale_linters = {
  \   'javascript': ['eslint'],
  \}

  " let g:syntastic_always_populate_loc_list = 1
  " let g:syntastic_auto_loc_list = 0
  " let g:syntastic_check_on_open = 1
  " let g:syntastic_check_on_wq = 0
  " let g:syntastic_aggregate_errors = 1
endif
