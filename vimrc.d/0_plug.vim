set nocompatible " be iMproved, required

" Install vim-plug if we don't already have it

if has("nvim")
  if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
else
  if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif

endif

if has("nvim")
  let s:plug_start_path = '~/.local/share/nvim/site/plugged'
else
  let s:plug_start_path = '~/.vim/plugged'
endif

call plug#begin(s:plug_start_path)

" source all the configs for all such plugs
for file in split(glob('~/.vim/vimrc.d/plugins/*.vim'), '\n')
  exe 'source' file
endfor

" Initialize plugin system
call plug#end()

