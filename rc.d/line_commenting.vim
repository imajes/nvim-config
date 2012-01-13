"simple comment/uncomment visual selection with cmd+/
vmap <silent> <D-/> :call CommentOutLine()<CR>
function! CommentOutLine()
  let ext = expand("%:e")

  if ext == "rb" || ext == "sh"
    let comment_prefix = "#"
  elseif ext == "c" || ext == "cpp" || ext == "h" || ext == "h" || ext == "m" || ext == "mm"
    let comment_prefix = "//"
  endif
  let line = getline('.')
  let pattern = "^".comment_prefix
  if line =~ pattern
    call setline(".", substitute(line, pattern, "", ""))
  else
    call setline(".", substitute(line, "^", comment_prefix, ""))
  endif
endfunction
