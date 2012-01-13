" Section: Visual
" --------------------

" Switch syntax highlighting on, when the terminal has colors
if has("gui_running") && has("syntax")
  set guifont=inconsolata-dz:h12
  "set guifont=Inconsolata-dz\ for\ Powerline:h14
  let g:Powerline_symbols = 'fancy'
  set transparency=2
  set showtabline=2


  command! -bar -nargs=0 Bigger  :let &guifont = substitute(&guifont,'\d\+$','\=submatch(0)+1','')
  command! -bar -nargs=0 Smaller :let &guifont = substitute(&guifont,'\d\+$','\=submatch(0)-1','')
  noremap <M-,>        :Smaller<CR>
  noremap <M-.>        :Bigger<CR>

  if exists("syntax_on") || exists("syntax_manual")
  else
    syntax on
  endif
  set list
  set hlsearch

  augroup RCVisual
    autocmd!

    "autocmd VimEnter *  set background=dark notitle noicon
    autocmd GUIEnter *  set background=dark title icon cmdheight=2 lines=45 columns=185 guioptions-=e
    autocmd GUIEnter *  if has("diff") && &diff | set columns=165 | endif
    autocmd GUIEnter *  colorscheme solarized
    autocmd Syntax css  syn sync minlines=50
  augroup END
endif
