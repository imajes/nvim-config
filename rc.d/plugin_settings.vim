" Plugin Settings
" ---------------------
if has("eval")
  let g:is_bash = 1
  let g:lisp_rainbow = 1

  map <unique> <Leader>r <Plug>SimpleFold_Foldsearch
  "map <unique> <silent> <Leader>r <Plug>SimpleFold_Foldsearch

  let g:ruby_doc_command='open'

  " let g:rubyindent_match_parentheses = 0
  let g:ruby_minlines = 500
  let g:rubycomplete_buffer_loading = 1
  let g:rubycomplete_rails = 1
  let g:ruby_debugger_progname = 'mvim'

  let g:neocomplcache_enable_at_startup = 1

  if has("gui_running")
    "let g:Powerline_theme = 'solarized'
  endif
  let g:Powerline_symbols = 'fancy'

  " hide hidden buffers from the session
  set sessionoptions-=buffers

  let g:NERDCreateDefaultMappings = 0
  let g:NERDSpaceDelims = 1
  let g:NERDShutUp = 1
  let g:VCSCommandDisableMappings = 1

  let g:surround_45 = "<% \r %>"
  let g:surround_61 = "<%= \r %>"
  let g:surround_{char2nr('8')} = "/* \r */"
  let g:surround_{char2nr('s')} = " \r"
  let g:surround_indent = 1

  let g:session_autoload = 1
  let g:session_default_to_last = 1
  let g:session_autosave = 1

  " supertab, omnicomplete
  filetype plugin on
  set ofu=syntaxcomplete#Complete
  let g:SuperTabDefaultCompletionType = "context"
  let g:SuperTabCrMapping = 0

  let g:gist_clip_command = 'pbcopy'
  let g:gist_open_browser_after_post = 1
  let g:gist_detect_filetype = 1

endif
