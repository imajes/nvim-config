" Section: Visual
" --------------------


if has("gui_running")
  "set guifont=inconsolata-dz:h12
  "set guifont=Inconsolata-dz\ for\ Powerline\ Medium\ 12:h12
  "set guifont=Inconsolata-dz\ for\ Powerline:h14
  set background=dark
  set guifont=Source\ Code\ Pro\ Light\ for\ Powerline:h12
  set transparency=2
  colorscheme Tomorrow-Night-Blue
  highlight LineNr guifg=#efefef
else
  set background=light
  colorscheme Tomorrow-Night
endif

set showtabline=2
syntax enable

set list
set hlsearch
