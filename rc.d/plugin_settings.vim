" Plugin Settings
" ---------------------

if has("eval")
  let g:is_bash = 1
  let g:lisp_rainbow = 1

  " let g:rubyindent_match_parentheses = 0
  let g:ruby_minlines = 500
  let g:rubycomplete_buffer_loading = 1
  let g:rubycomplete_rails = 1
  let g:ruby_debugger_progname = 'mvim'

  let g:spellfile_URL = 'http://ftp.vim.org/vim/runtime/spell'

  let g:allml_global_maps = 1

  let g:EnhCommentifyUseAltKeys = 'Yes'
  let g:EnhCommentifyBindInInsert = 'No'
  let g:EnhCommentifyRespectIndent = 'Yes'

  let g:miniBufExplForceSyntaxEnable = 1

  let g:NERDCreateDefaultMappings = 0
  let g:NERDSpaceDelims = 1
  let g:NERDShutUp = 1
  let g:VCSCommandDisableMappings = 1

  if !has("gui_running")
    let g:showmarks_enable = 0
  endif

  let g:surround_45 = "<% \r %>"
  let g:surround_61 = "<%= \r %>"
  let g:surround_{char2nr('8')} = "/* \r */"
  let g:surround_{char2nr('s')} = " \r"
  let g:surround_indent = 1

  let g:session_autoload = 1
  let g:session_default_to_last = 1
  let g:session_autosave = 1

  " supertab, omnicomplete
  "filetype plugin on
  "set ofu=syntaxcomplete#Complete
  "let g:SuperTabDefaultCompletionType = "context"

  let g:gist_clip_command = 'pbcopy'
  let g:gist_open_browser_after_post = 1
  let g:gist_detect_filetype = 1

endif
