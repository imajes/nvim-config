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

" completions, from http://robots.thoughtbot.com/post/27041742805/vim-you-complete-me
set complete=.,b,u,]
set wildmode=longest,list:longest
set completeopt=menu,preview

" lets also run ctags every time we lose focus, as we want to keep this file current
au FocusLost * :!/usr/local/bin/ctags 

if has("gui_running")
  set guioptions=egmrt
  " undo history
  set undodir=~/.vim/backups
  set undofile
endif

" map commentary to support cmd-/
" vmap <silent> <D-/> :call \\<CR>

"if has("gui_macvim")
"    macmenu &File.New\ Tab key=<nop>
"    map <D-t> <Plug>PeepOpen
"end

