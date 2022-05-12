" Section: Language, Configs
" -----------------------------

Plug 'vim-scripts/nginx.vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'robbles/logstash.vim'

autocmd FileType sh,csh,zsh             setlocal et sw=2 sts=2
autocmd FileType vim                    setlocal et sw=2 sts=2 keywordprg=:help
autocmd FileType logstash               setlocal et sw=2 sts=2

"strip trailing whitespace on save for code files
"cocoa
autocmd BufWritePre *.m,*.h,*.c,*.mm,*.cpp,*.hpp,*.java :%s/\s\+$//e

