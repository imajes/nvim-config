" Section: Syntax, Misc
" ------------------------

if exists("g:vundle_install_plugin")
  Plugin 'jeroenbourgois/vim-actionscript'
  Plugin 'sophacles/vim-processing'

  finish
endif

autocmd FileType php                    setlocal et sw=2 sts=2 noet
autocmd FileType ant                    setlocal et sw=2 sts=2 noet

