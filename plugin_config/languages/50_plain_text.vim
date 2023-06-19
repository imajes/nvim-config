" Section: Syntax, Plain Text
" -----------------------------

" PDF
autocmd BufReadPre *.pdf setlocal binary
autocmd BufNewFile,BufRead *.pdf              set ft=pdf
autocmd FileType pdf  setlocal foldmethod=syntax foldlevel=1 | if !exists("b:current_syntax") | setlocal syntax=postscr | endif

" DOC
autocmd FileReadCmd *.doc execute "read! antiword \"<afile>\""

" TEXT
autocmd BufNewFile,BufRead *.txt,README,INSTALL,NEWS,TODO if &ft == ""|set ft=text|endif
autocmd FileType text,txt setlocal tw=78 linebreak nolist

" HELP
autocmd FileType help setlocal ai fo+=2n | silent! setlocal nospell
autocmd FileType help nnoremap <silent><buffer> q :q<CR>

" SQL
autocmd FileType sql map! <buffer> <C-Z> <Esc>`^gUaw`]a


