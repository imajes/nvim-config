" Section: Vim, File Tree
" -------------------------

" Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
" Plug 'kien/ctrlp.vim'
Plug 'junegunn/fzf',    { 'do': { -> fzf#install() } }  | " Open files and ag buffers
Plug 'junegunn/fzf.vim'                                 | " Open files and ag buffers

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'ryanoasis/vim-devicons'

let g:NERDCreateDefaultMappings = 0
let g:NERDSpaceDelims = 1
let g:NERDShutUp = 1
let g:VCSCommandDisableMappings = 1

let g:fzf_command_prefix = 'Fzf' | " FZF: Set the prefix for exposed fzf commands
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git --ignore .terragrunt-cache --ignore temp_dirs --ignore node_modules -l -g ""' | " FZF: Speed up agging files

nnoremap <silent> <C-f> :FzfFiles<CR>
nnoremap <C-g> :FzfAg<CR>
