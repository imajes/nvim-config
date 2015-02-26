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
  set background=dark
  " set guifont=Source\ Code\ Pro\ Light\ for\ Powerline:h12
  set guifont=Sauce\ Code\ Powerline\ Light:h11
  set transparency=2
  colorscheme Tomorrow-Night-Eighties
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
