" Section: Visual, Time Switching
" -------------------------------

if has("gui_vimr") || has("gui_macvim")
  Plug 'nightsense/night-and-day'

  let g:nd_themes = [
        \ [ 'sunrise+0', 'space_vim_theme', 'light', 'base16_spacemacs' ],
        \ [ 'sunset+0',  'vim-material',    'dark', 'base16_flat' ],
        \ ]
  let g:nd_latitude = '45'
  let g:nd_timeshift = '0'
  let g:nd_airline = 1
end

