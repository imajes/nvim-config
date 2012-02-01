" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
function! AppendModeline()
  let l:modeline = printf(" vim: set et ts=%d sw=%d tw=%d ft=%s :", &tabstop, &shiftwidth, &textwidth, &ft)
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(line("$"), l:modeline)
endfunction
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>

" stolen from elsewhere
autocmd CursorHold,BufWritePost,BufReadPost,BufLeave *
            \ if isdirectory(expand("<amatch>:h")) | let &swapfile = &modified | endif

set hlsearch
cmap w!! %!sudo tee > /dev/null % # force save with sudo
cnoreabbrev  ws %s/\s\+$//g
cnoreabbrev  squash %s/\s\{4\}/  /g
cnoreabbrev  nf set nofoldenable
"set clipboard=exclude:.*

au FocusLost * silent! :wa
"au FocusLost * :stopinsert
"au FocusLost * let s:saved_bufhidden=&l:bufhidden | setlocal bufhidden=hide | let s:curbuf=bufnr('%') | execute "bufdo if empty(&buftype) && filereadable(@%) | write | endif" | execute 'buffer' s:curbuf | let &l:bufhidden=s:savedbufhidden

let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax

if has("gui_running")
  set guioptions=egmrt
  " undo history
  set undodir=~/.vim/backups
  set undofile
endif

"if has("gui_macvim")
"    macmenu &File.New\ Tab key=<nop>
"    map <D-t> <Plug>PeepOpen
"end

" SHORTCUT KEY MAPPINGS """""""""""""""""""
" from Sam Coward
" https://github.com/idoru/idoru-vim-config/blob/master/vimrc_template
"
"prev/next in quickfix file listing (e.g. search results)
map <M-D-Down> :cn<CR>
map <M-D-Up> :cp<CR>

"select open file, MRU sorted
map <D-e> :FufBuffer<CR>

"open file
map <D-N> :FufFile<CR>

"opt-cmd-arrows [next & previous open files]
map <M-D-Left> :bp<CR>
map <M-D-Right> :bn<CR>

"indent/unindent visual mode selection with tab/shift+tab
vmap <tab> >gv
vmap <s-tab> <gv

"Undo/Redo using undo tree with cmd-z/cmd-shift-z
map <D-z> :earlier 1<CR>
map <D-Z> :later 1<CR>

"file tree browser - backslash
map \ :NERDTreeToggle<CR>

" from vimcasts.org
"
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv
nmap gV `[v`]
