" Section: Interaction, Git
" -----------------------------

Plug 'tpope/vim-fugitive'
Plug 'mattn/gist-vim'
Plug 'airblade/vim-gitgutter'   " display your changes in a gutter, undo them and preview them link.
Plug 'itchyny/vim-gitbranch' " display the git branch in lightline in your active git repo link.
Plug 'junegunn/gv.vim'       " not necessary but a nice explorer for your git repo and commits, useless if you use tig link.


autocmd FileType gitcommit setlocal spell
autocmd FileType gitconfig setlocal noet sw=8
autocmd FileType gitrebase nnoremap <buffer> S :Cycle<CR>

" gist.github.com
let g:gist_clip_command = 'pbcopy'
let g:gist_open_browser_after_post = 1
let g:gist_detect_filetype = 1

set grepprg=git\ grep\ -niH\ $*

