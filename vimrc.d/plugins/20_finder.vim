" Section: Vim, File Tree
" -------------------------

" Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
" Plug 'kien/ctrlp.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }


Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'ryanoasis/vim-devicons'

" this seems to potentially have issues with ruby invocation
"Plug 'git://git.wincent.com/command-t.git'


if has("eval")

  " nnoremap <leader>. :CtrlPTag<cr>
  " let g:ctrlp_switch_buffer = 'Et'

  let g:NERDCreateDefaultMappings = 0
  let g:NERDSpaceDelims = 1
  let g:NERDShutUp = 1
  let g:VCSCommandDisableMappings = 1

  finish
endif
