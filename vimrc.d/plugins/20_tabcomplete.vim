" Section: Vim, tabcomplete
" ------------------------

if exists("g:vundle_install_plugin")
  "Plugin 'Shougo/neocomplcache'
  Plugin 'ervandew/supertab'

  finish
endif

if has("eval")
  " supertab, omnicomplete
  filetype plugin on
  set ofu=syntaxcomplete#Complete
  let g:SuperTabDefaultCompletionType = "context"
  let g:SuperTabCrMapping = 0

  "let g:neocomplcache_enable_at_startup = 1

  " context discovery
  " let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
  " let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
  " let g:SuperTabContextDiscoverDiscovery =
  "       \ ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]

  autocmd FileType * if exists("+omnifunc") && &omnifunc == "" | setlocal omnifunc=syntaxcomplete#Complete | endif
  autocmd FileType * if exists("+completefunc") && &completefunc == "" | setlocal completefunc=syntaxcomplete#Complete | endif

  " completions, from http://robots.thoughtbot.com/post/27041742805/vim-you-complete-me
  set complete=.,b,u,]
  set wildmode=longest,list:longest
  set completeopt=menu,preview
endif
