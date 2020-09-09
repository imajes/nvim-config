" Section: Vim, Tests
" ------------------------

Plug 'vim-test/vim-test'  | " Run tests

let test#strategy = {
      \ 'nearest': 'basic',
      \ 'file':    'dispatch',
      \ 'suite':   'dispatch_background',
      \}

let test#ruby#rspec#executable = 'bundle exec rspec'

nnoremap <silent> <Leader>x :TestNearest<CR>
nnoremap <silent> <Leader>t :TestFile<CR>
nnoremap <silent> <Leader>r :TestSuite<CR>
nnoremap <silent> <Leader>e :TestLast<CR>
nnoremap <silent> <Leader>l :TestVisit<CR>
