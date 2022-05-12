" Section: Language,TypeScript 
" -----------------------------
"
Plug 'leafgarland/typescript-vim'

autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
