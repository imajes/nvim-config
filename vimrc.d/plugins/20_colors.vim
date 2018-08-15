" Section: Visual, Colors
" ------------------------

if exists("g:vundle_install_plugin")
  Plugin 'lifepillar/vim-solarized8'
  Plugin 'vim-scripts/candycode.vim'
  Plugin 'chriskempson/vim-tomorrow-theme'
  Plugin 'vim-scripts/corporation'
  Plugin 'Lokaltog/vim-distinguished'
  Plugin 'nanotech/jellybeans.vim'
  Plugin 'micha/grb256'
  Plugin 'morhetz/gruvbox'
  Plugin 'scwood/vim-hybrid'
  Plugin 'hhsnopek/vim-firewatch'
  Plugin 'juanedi/predawn.vim'
  Plugin 'hzchirs/vim-material'

  finish
endif

if has("gui_running")
  set background=dark
  " set guifont=Source\ Code\ Pro\ Light\ for\ Powerline:h12
  set guifont=Sauce\ Code\ Powerline\ Light:h13
  "set guifont=Fira\ Code:h11
  "set macligatures
  set transparency=2
  colorscheme vim-material
  highlight LineNr guifg=#efefef
else
  let g:solarized_termcolors=256
  set background=dark
  colorscheme distinguished
endif

set showtabline=2
syntax enable

set list
set hlsearch
