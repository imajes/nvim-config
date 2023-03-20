" Section: Visual, Colors
" ------------------------

Plug 'Lokaltog/vim-distinguished'
Plug 'arcticicestudio/nord-vim'
Plug 'arzg/vim-corvine'
Plug 'ayu-theme/ayu-vim'
" Plug 'catppuccin/nvim', {'as': 'catppuccin'}
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'hhsnopek/vim-firewatch'
Plug 'hzchirs/vim-material'
Plug 'ingram1107/vim-zhi'
Plug 'juanedi/predawn.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'liuchengxu/space-vim-theme'
Plug 'micha/grb256'
Plug 'morhetz/gruvbox'
Plug 'nanotech/jellybeans.vim'
Plug 'navarasu/onedark.nvim'
"Plug 'nightsense/office'
"Plug 'nightsense/vimspectr'
Plug 'scwood/vim-hybrid'
Plug 'skbolton/embark'
Plug 'vim-scripts/candycode.vim'
Plug 'vim-scripts/corporation'

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
  autocmd VimEnter * colorscheme slate
endif

set showtabline=2
syntax enable

set list
set hlsearch
