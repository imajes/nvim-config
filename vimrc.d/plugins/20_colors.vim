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
Plug 'arcticicestudio/nord-vim'
Plug 'liuchengxu/space-vim-theme'
Plug 'nightsense/vimspectr'
Plug 'nightsense/office'
Plug 'arzg/vim-corvine'
Plug 'skbolton/embark'
Plug 'ayu-theme/ayu-vim'
Plug 'ingram1107/vim-zhi'

if has("gui_vimr") || has("gui_macvim")
  " Plug 'nightsense/night-and-day'
  "
  " let g:nd_themes = [
  "       \ [ 'sunrise+0', 'embark', 'dark', 'ayu_light' ],
  "       \ [ 'sunset+0',  'vim-material', 'dark', 'ayu_dark' ],
  "       \ ]
  " let g:nd_latitude = '45'
  " let g:nd_timeshift = '0'
  " let g:nd_lightline = 1

  set termguicolors
  set cursorline

  let g:nord_underline = 1
  let g:nord_italic_comments = 1
  let g:nord_cursor_line_number_background = 1
  "let g:lightline.colorscheme = 'wombat'

  set background=dark
  autocmd VimEnter * colorscheme embark
  autocmd VimEnter * hi LineNr guifg=#585273

else
  let g:solarized_termcolors=256
  "set background=dark
  autocmd VimEnter * colorscheme embark
endif

set showtabline=2
syntax enable

set list
set hlsearch
