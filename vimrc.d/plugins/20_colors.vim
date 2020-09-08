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

if has("gui_vimr") || has("gui_macvim")
  set background=dark
  set termguicolors
  set cursorline

  let g:nord_underline = 1
  let g:nord_italic_comments = 1
  let g:nord_cursor_line_number_background = 1
  let g:lightline = {
      \ 'colorscheme': 'embark',
      \ }

  if strftime("%H") < 7 || strftime("%H") >= 19
    let themes = [
          \ 'vimspectr0-Dark'   , 'vimspectr0-Dark'    , 'vimspectr30-Dark'  ,
          \ 'vimspectr60-Dark'  , 'vimspectr90-Dark'   , 'vimspectr120-Dark' ,
          \ 'vimspectr150-Dark' , 'vimspectr180-Dark'  , 'vimspectr210-Dark' ,
          \ 'vimspectr240-Dark' , 'vimspectr270-Dark'  , 'vimspectr300-Dark' ,
          \ 'vimspectr330-Dark' , 'vimspectrgrey-Dark'
          \ ]
  else
    let themes = [
          \ 'vimspectr0-Light'  , 'vimspectr0-Light'   , 'vimspectr30-Light' ,
          \ 'vimspectr60-Light' , 'vimspectr90-Light'  , 'vimspectr120-Light',
          \ 'vimspectr150-Light', 'vimspectr180-Light' , 'vimspectr210-Light',
          \ 'vimspectr240-Light', 'vimspectr270-Light' , 'vimspectr300-Light',
          \ 'vimspectr330-Light', 'vimspectrgrey-Light'
          \ ]
  endif

  " autocmd VimEnter * exec 'colorscheme '.themes[localtime() % len(themes)]
  "exe 'colorscheme '.themes[localtime() % len(themes)]
  autocmd VimEnter * colorscheme embark
  autocmd VimEnter * hi LineNr guifg=#585273

  if has("gui_macvim")
    " set guifont=Source\ Code\ Pro\ Light\ for\ Powerline:h12
    set guifont=Sauce\ Code\ Powerline\ Light:h13
    "set guifont=Fira\ Code:h11
    "set macligatures
    set transparency=2
  endif

else
  let g:solarized_termcolors=256
  "set background=dark
  autocmd VimEnter * colorscheme embark
endif

set showtabline=2
syntax enable

set list
set hlsearch
