" Section: Visual
" --------------------

if has("gui_running")
  "set guifont=inconsolata-dz:h12
  set guifont=Inconsolata-dz\ for\ Powerline\ Medium\ 12:h12
  "set guifont=Inconsolata-dz\ for\ Powerline:h14
  set transparency=2
  colorscheme candycode
else
  colorscheme Tomorrow-Night
endif

set showtabline=2
syntax enable

if has("gui_running")
  set background=dark
else
  set background=light
endif

set list
set hlsearch
