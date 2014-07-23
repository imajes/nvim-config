" Section: Language, Configs
" -----------------------------

if exists("g:vundle_install_plugin")
  Plugin 'vim-scripts/nginx.vim'
  Plugin 'ekalinin/Dockerfile.vim'

  finish
endif

autocmd FileType sh,csh,zsh             setlocal et sw=2 sts=2
autocmd FileType vim                    setlocal et sw=2 sts=2 keywordprg=:help

"strip trailing whitespace on save for code files
"cocoa
autocmd BufWritePre *.m,*.h,*.c,*.mm,*.cpp,*.hpp,*.java :%s/\s\+$//e

