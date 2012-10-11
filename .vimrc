" ~/.vim/.vimrc !

source ~/.vim/vundle_config.vim

if filereadable(expand("~/.vim/rc.d/base_options.vim"))
  runtime! rc.d/**.vim
endif

" vim:set ft=vim et tw=78 sw=2:
