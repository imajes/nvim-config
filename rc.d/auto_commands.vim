" Section: Autocommands
" ---------------------

if has("autocmd")

  augroup FTMisc
    autocmd!

    autocmd BufReadPre *.pdf setlocal binary
    autocmd BufReadCmd *.jar call zip#Browse(expand("<amatch>"))
    autocmd FileReadCmd *.doc execute "read! antiword \"<afile>\""
    "autocmd CursorHold,BufWritePost,BufReadPost,BufLeave * if isdirectory(expand("<amatch>:h")) | let &swapfile = &modified | endif
  augroup END
  
  augroup FTCheck
    autocmd!
    autocmd BufNewFile,BufRead *.pdf              set ft=pdf
    autocmd FileType pdf  setlocal foldmethod=syntax foldlevel=1 | if !exists("b:current_syntax") | setlocal syntax=postscr | endif
    autocmd BufNewFile,BufRead *.txt,README,INSTALL,NEWS,TODO if &ft == ""|set ft=text|endif
    autocmd BufNewFile,BufRead *.erb set ft=eruby
  augroup END
  
  augroup FTOptions
    autocmd!
    " autocmd FileType sh,zsh,csh,tcsh,perl,python,ruby imap <buffer> <C-X>& <C-X>!<Esc>o <C-U># $I<C-V>d$<Esc>o <C-U><C-X>^<Esc>o <C-U><C-G>u
    " autocmd FileType c,cpp,cs,java,perl,javscript,php,aspperl,tex,css let b:surround_101 = "\r\n}"
    " autocmd FileType css  silent! setlocal omnifunc=csscomplete#CompleteCSS
    " autocmd Syntax css  syn sync minlines=50
    autocmd FileType gitcommit setlocal spell
    autocmd FileType gitrebase nnoremap <buffer> S :Cycle<CR>
    autocmd FileType haml let b:surround_45 = "- \r"|let b:surround_61 = "= \r"
    autocmd FileType help setlocal ai fo+=2n | silent! setlocal nospell
    autocmd FileType help nnoremap <silent><buffer> q :q<CR>
    autocmd FileType html setlocal iskeyword+=~
    "autocmd FileType ruby silent! compiler ruby | setlocal tw=79 isfname+=: makeprg=rake keywordprg=ri comments=:#\  | let &includeexpr = 'tolower(substitute(substitute('.&includeexpr.',"\\(\\u\\+\\)\\(\\u\\l\\)","\\1_\\2","g"),"\\(\\l\\|\\d\\)\\(\\u\\)","\\1_\\2","g"))' | imap <buffer> <C-Z> <CR>end<C-O>O
    " the ballonexpr for ruby sucks: large and irrelevant :(
    "autocmd FileType ruby setlocal balloonexpr=RubyBalloonexpr()
    autocmd FileType sql map! <buffer> <C-Z> <Esc>`^gUaw`]a
    autocmd FileType text,txt setlocal tw=78 linebreak nolist

    autocmd FileType vim  setlocal ai et sta sw=4 sts=4 keywordprg=:help | map! <buffer> <C-Z> <C-X><C-V>
    autocmd FileType * if exists("+omnifunc") && &omnifunc == "" | setlocal omnifunc=syntaxcomplete#Complete | endif
    autocmd FileType * if exists("+completefunc") && &completefunc == "" | setlocal completefunc=syntaxcomplete#Complete | endif
  augroup END
endif " has("autocmd")

