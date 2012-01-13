" ~/.vim/.vimrc !
" vim:set ft=vim et tw=78 sw=2:

silent! call pathogen#runtime_append_all_bundles()
silent! call pathogen#runtime_prepend_subdirectories("~./vim/bundle")

if filereadable(expand("~/.vim/rc.d/base_options.vim"))
  source ~/.vim/rc.d/base_options.vim
  source ~/.vim/rc.d/color_and_fonts.vim
  source ~/.vim/rc.d/plugin_settings.vim
  source ~/.vim/rc.d/auto_commands.vim
  source ~/.vim/rc.d/mappings.vim
  source ~/.vim/rc.d/customizations.vim
  source ~/.vim/rc.d/line_commenting.vim
  source ~/.vim/rc.d/web_related.vim
endif
