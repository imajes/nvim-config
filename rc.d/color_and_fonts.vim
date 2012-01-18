" Section: Visual
" --------------------

if has("gui_running")
  "set guifont=inconsolata-dz:h12
  set guifont=Inconsolata-dz\ for\ Powerline:h14
  set transparency=2
endif

  set showtabline=2

  command! -bar -nargs=0 Bigger  :let &guifont = substitute(&guifont,'\d\+$','\=submatch(0)+1','')
  command! -bar -nargs=0 Smaller :let &guifont = substitute(&guifont,'\d\+$','\=submatch(0)-1','')
  noremap <M-,>        :Smaller<CR>
  noremap <M-.>        :Bigger<CR>

  syntax enable
  set background=light " somehow, this is inverted?
  colorscheme solarized

  set list
  set hlsearch
