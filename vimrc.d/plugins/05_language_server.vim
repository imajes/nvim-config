" " Section: Vim, Language Server
" " -----------------------------
"
" Plug 'natebosch/vim-lsc'
"
" let g:lsc_server_commands = {'ruby': 'solargraph'}
"
" " Use all the defaults (recommended):
" let g:lsc_auto_map = v:true
"
" " Apply the defaults with a few overrides:
" " let g:lsc_auto_map = {'defaults': v:true, 'FindReferences': '<leader>r'}
"
" " Setting a value to a blank string leaves that command unmapped:
" " let g:lsc_auto_map = {'defaults': v:true, 'FindImplementations': ''}
"
" " ... or set only the commands you want mapped without defaults.
" " Complete default mappings are:
" " let g:lsc_auto_map = {
" "     \ 'GoToDefinition': '<C-]>',
" "     \ 'GoToDefinitionSplit': ['<C-W>]', '<C-W><C-]>'],
" "     \ 'FindReferences': 'gr',
" "     \ 'NextReference': '<C-n>',
" "     \ 'PreviousReference': '<C-p>',
" "     \ 'FindImplementations': 'gI',
" "     \ 'FindCodeActions': 'ga',
" "     \ 'Rename': 'gR',
" "     \ 'ShowHover': v:true,
" "     \ 'DocumentSymbol': 'go',
" "     \ 'WorkspaceSymbol': 'gS',
" "     \ 'SignatureHelp': 'gm',
" "     \ 'Completion': 'completefunc',
" "     \}
"
" let g:lsc_trace_level = 'verbose'
