" Section: Visual, Colors
" ------------------------

if exists("g:vundle_install_plugin")
  Plugin 'altercation/vim-colors-solarized'
  Plugin 'vim-scripts/candycode.vim'
  Plugin 'chriskempson/vim-tomorrow-theme'
  Plugin 'vim-scripts/corporation'
  Plugin 'Lokaltog/vim-distinguished'
  Plugin 'nanotech/jellybeans.vim'
  Plugin 'micha/grb256'
  Plugin 'morhetz/gruvbox'
  finish
endif

if has("gui_running")
  "set guifont=inconsolata-dz:h12
  "set guifont=Inconsolata-dz\ for\ Powerline\ Medium\ 12:h12
  "set guifont=Inconsolata-dz\ for\ Powerline:h14
  set background=dark
  set guifont=Source\ Code\ Pro\ Light\ for\ Powerline:h12
  set transparency=2
  colorscheme codeschool
  " highlight LineNr guifg=#efefef
else
  let g:solarized_termcolors=256
  set background=dark
  colorscheme distinguished
endif

set showtabline=2
syntax enable

set list
set hlsearch
