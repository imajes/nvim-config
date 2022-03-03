" let $NVIM_COC_LOG_LEVEL = 'debug'

" light-weight web focused vimrc.
"
" Maintainer:	James Cox, <james at imaj.es>
"
" Inspiration from:
"   https://github.com/mengbo/splite.vim (structure)
"
"

" Load external configuration before anything else.

if filereadable(expand("~/.config/nvim/before-init.vim"))
  source ~/.config/nvim/before-init.vim
endif

" Source all of the .vim files in ~/.vim/vimrc.d directory.
for file in split(glob('~/.config/nvim/vimrc.d/*.vim'), '\n')
    exe 'source' file
endfor

" Load addidional configuration (ie to overwrite shorcuts).
if filereadable(expand("~/.config/nvim/after-init.vim"))
  source ~/.config/nvim/after-init.vim
endif

" vim:set ft=vim et tw=78 sw=2:
