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
" Plug 'tabnine/YouCompleteMe'
" let g:ycm_keep_logfiles = 1
" let g:ycm_log_level = 'debug'
" let g:ycm_clangd_binary_path='clangd'

Plug 'neovim/nvim-lspconfig'
Plug 'onsails/lspkind-nvim'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }
Plug 'github/copilot.vim'

" " set tab as autocomplete
" imap <Tab> <C-y>
"
" " completions, from http://robots.thoughtbot.com/post/27041742805/vim-you-complete-me
" set complete=.,b,u,]
" set wildmode=longest,list:longest
" set completeopt=menu,preview
set completeopt=menu,menuone,noselect
