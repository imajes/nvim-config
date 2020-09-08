" Section: Vim, Sensible Defaults
" --------------------------------

" vim startify = better starting screen for vim
Plug 'mhinz/vim-startify'

" some magic about padding
let g:startify_padding_left = 2

" limit to the top 5 files
let g:startify_files_number = 5

" something interesting about showing vars in env
let g:startify_use_env = 1

" use unicode as reasonable
let g:startify_fortune_use_unicode = 1

" attempt to change to the root dir of a file in a vcs
let g:startify_change_to_vcs_root = 1

" automatically update sessions where possible
let g:startify_session_persistence = 1

" sort by last modified
let g:startify_session_sort = 1

" use webdevicons?
let g:webdevicons_enable_startify = 1

let g:startify_lists = [
      \   { 'type': 'sessions',  'header': ['   Sessions']                  },
      \   { 'type': 'files',     'header': ['   Most Recently Used']        },
      \   { 'type': 'dir',       'header': ['   Most Recent in '. getcwd()] },
      \   { 'type': 'commands',  'header': ['   Commands']                  },
      \   { 'type': 'bookmarks', 'header': ['   Bookmarks']                 },
      \ ]

let g:startify_commands = [
      \   { 'up': [ 'Update Plugins', ':PlugUpdate' ] },
      \   { 'ug': [ 'Upgrade Plugin Manager', ':PlugUpgrade' ] },
      \ ]

let g:startify_bookmarks = [
      \   { 'nv': '~/.vim/.vimrc' },
      \   { 'pr': '~/Projects' },
      \   { 'z': '~/.zshrc' }
      \ ]


