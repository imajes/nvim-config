" Section: Vim, Projections
" --------------------------------

" projectionist.vim is probably tpope's best work.
" it's a dsl to describe how projects should be configured,
" so that you can describe e.g. how a test file relates to
" a primary code file, etc. https://github.com/tpope/vim-projectionist
Plug 'tpope/vim-projectionist'

" for example, here's a projection for a rbenv plugin:
let g:projectionist_heuristics = {
      \   "etc/rbenv.d/|bin/rbenv-*": {
      \     "bin/rbenv-*": {
      \        "type": "command",
      \        "template": ["#!/usr/bin/env bash"],
      \     },
      \     "etc/rbenv.d/*.bash": {"type": "hook"}
      \   }
      \ }
