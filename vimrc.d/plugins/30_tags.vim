" Section: Vim, Tags, etc
" ------------------------------
" helpful: https://github.com/majutsushi/tagbar/wiki

if exists("g:vundle_install_plugin")
  Plugin 'majutsushi/tagbar'
  Plugin 'ludovicchabant/vim-gutentags'
  finish
endif

if has("eval")
  " Run ctags every time we lose focus, as we want to keep this file current
  "au FocusLost * silent! :!/usr/local/bin/ctags
  " nmap <silent> <Leader>g :!/usr/local/bin/ctags<CR><CR>

  let g:tagbar_type_ruby = {
      \ 'kinds' : [
          \ 'm:modules',
          \ 'c:classes',
          \ 'd:describes',
          \ 'C:contexts',
          \ 'f:methods',
          \ 'F:singleton methods'
      \ ]
  \ }

  nnoremap <silent> <Leader>b :TagbarToggle<CR>
  let g:gutentags_tagfile = '.tags'
  "au FocusLost * exe :GutentagsUpdate

  " set tags=./.tags
endif

