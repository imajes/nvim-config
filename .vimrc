" light-weight web focused vimrc.
"
" Maintainer:	James Cox, <james at imaj.es>
"
" Inspiration from:
"   https://github.com/mengbo/splite.vim (structure)
"
"

" Load external configuration before anything else.

if filereadable(expand("~/.vim/before.vimrc"))
  source ~/.vim/before.vimrc
endif

" Source all of the .vim files in ~/.vim/vimrc.d directory.
for file in split(glob('~/.vim/vimrc.d/*.vim'), '\n')
    exe 'source' file
endfor

" Load addidional configuration (ie to overwrite shorcuts).
if filereadable(expand("~/.vim/after.vimrc"))
  source ~/.vim/after.vimrc
endif

" other local customizations
if filereadable(expand("~/.vim/rc.d/base_options.vim"))
  runtime! rc.d/**.vim
endif

" log everything!
":call ToggleVerbose()

" vim:set ft=vim et tw=78 sw=2:
