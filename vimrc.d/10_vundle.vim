set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" My plugins
" Source all of the .vim files in ~/.vim/vimrc.d/plugins directory
" install plugins.
let g:vundle_install_plugin = 1
for file in split(glob('~/.vim/vimrc.d/plugins/*.vim'), '\n')
    exe 'source' file
endfor
unlet g:vundle_install_plugin


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Config my plugins
" Source all of the .vim files in ~/.vim/vimrc.d/plugins directory
" config plugins.
for file in split(glob('~/.vim/vimrc.d/plugins/*.vim'), '\n')
    exe 'source' file
endfor

