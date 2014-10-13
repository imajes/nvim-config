" Section: Vim, Mappings
" ------------------------


" map CTRL-E to end-of-line (insert mode)
imap <C-e> <esc>$i<right>
" map CTRL-A to beginning-of-line (insert mode)
imap <C-a> <esc>0i
" map CTRL-E to end-of-line (normal mode)
nmap <C-e> $
" map CTRL-A to beginning-of-line (normal mode)
nmap <C-a> 0
" map tab to indent (visual mode), gv preserves highlights
vmap <Tab> >gv
" map back tab to indent (visual mode), gv preserves highlights
vmap <S-Tab> <gv

