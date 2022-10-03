" configure plugins via lua

if has("nvim")
lua <<EOF
require('cmp_config')
require('telescope_config')
require('onedark_config')
require('catppuccin_config')
EOF
endif

let $NVIM_RUBY_LOG_FILE = '~/.nvim_ruby.log'

" log everything!
":call ToggleVerbose()

" vim:set ft=vim et tw=78 sw=2:
