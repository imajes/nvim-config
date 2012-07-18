" ~/.vim/.vimrc !

runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

if filereadable(expand("~/.vim/rc.d/base_options.vim"))
  runtime! rc.d/**.vim
endif

" vim:set ft=vim et tw=78 sw=2:
