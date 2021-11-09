" Section: Vim, autocomplete
" ------------------------

" auto match pairs for codes
Plug 'jiangmiao/auto-pairs'

" if has('nvim')
"   Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" else
"   Plug 'Shougo/deoplete.nvim'
"   Plug 'roxma/nvim-yarp'
"   Plug 'roxma/vim-hug-neovim-rpc'
" endif

" Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}
" " do not forget to install jedi
" Plug 'deoplete-plugins/deoplete-jedi'
" " do not forget to install solargraph
" "Plug 'uplus/deoplete-solargraph'
"
" Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
"
" let g:deoplete#enable_at_startup = 1

Plug 'tabnine/YouCompleteMe'
let g:ycm_keep_logfiles = 1
let g:ycm_log_level = 'debug'
let g:ycm_clangd_binary_path='clangd'

" set tab as autocomplete
imap <Tab> <C-y>

" completions, from http://robots.thoughtbot.com/post/27041742805/vim-you-complete-me
set complete=.,b,u,]
set wildmode=longest,list:longest
set completeopt=menu,preview
