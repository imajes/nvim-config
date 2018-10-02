" Section: Visual, Colors
" ------------------------

Plug 'lifepillar/vim-solarized8'
Plug 'vim-scripts/candycode.vim'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'vim-scripts/corporation'
Plug 'Lokaltog/vim-distinguished'
Plug 'nanotech/jellybeans.vim'
Plug 'micha/grb256'
Plug 'morhetz/gruvbox'
Plug 'scwood/vim-hybrid'
Plug 'hhsnopek/vim-firewatch'
Plug 'juanedi/predawn.vim'
Plug 'hzchirs/vim-material'


if has("gui_vimr") || has("gui_macvim")
  set background=dark
  "
  if has("gui_macvim")
    " set guifont=Source\ Code\ Pro\ Light\ for\ Powerline:h12
    set guifont=Sauce\ Code\ Powerline\ Light:h13
    "set guifont=Fira\ Code:h11
    "set macligatures

    set transparency=2
  endif

  autocmd VimEnter * colorscheme vim-material
  highlight LineNr guifg=#efefef
else
  let g:solarized_termcolors=256
  set background=dark
  autocmd VimEnter * colorscheme distinguished
endif

set showtabline=2
syntax enable

set list
set hlsearch
