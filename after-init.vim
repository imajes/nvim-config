" configure plugins via lua

lua <<EOF
require('cmp_config')
EOF

let $NVIM_RUBY_LOG_FILE = '~/.nvim_ruby.log'

" log everything!
":call ToggleVerbose()

" vim:set ft=vim et tw=78 sw=2:
