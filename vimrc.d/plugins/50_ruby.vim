" Section: Language, Ruby
" -----------------------------

" ruby core
Plug 'vim-ruby/vim-ruby'
Plug 'lucapette/vim-ruby-doc'
Plug 'nelstrom/vim-textobj-rubyblock'

" ruby extra
" Plug 'tpope/vim-rvm'
Plug 'tpope/vim-rbenv'
Plug 'tpope/vim-rake'

" rails
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'

" testing
Plug 'sunaku/vim-ruby-minitest'
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-cucumber'

let g:ruby_host_prog = '~/.rbenv/shims/neovim-ruby-host'

" RSpec.vim mappings
map <Leader>r :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" automap for filetypes
autocmd BufNewFile,BufRead *.haml             set ft=haml
autocmd BufNewFile,BufRead *.feature,*.story  set ft=cucumber
autocmd BufNewFile,BufRead *.erb              set ft=eruby

autocmd FileType gem                    setlocal ft=ruby
autocmd FileType eruby,yaml,ruby        setlocal et ts=2 sw=2 sts=2 expandtab list listchars=tab:»·,trail:·
autocmd FileType cucumber               setlocal et ts=2 sw=2 sts=2 expandtab
autocmd FileType ruby                   setlocal comments=:#\  tw=80

" custom commands for rails vim
command! Eroutes Einitializer
command! Egemfile edit Gemfile
command! Ereadme edit README.md

" rails projections
let g:rails_projections = {
      \ "config/projections.json": {
      \   "command": "projections"
      \ },
      \ "app/workers/*_worker.rb": {
      \   "command":   "worker",
      \   "affinity":  "model",
      \   "alternate": "spec/workers/%i_worker_spec.rb",
      \   "related":   "db/schema.rb#%s",
      \   "test":      "spec/jobs/%i_worker_spec.rb",
      \   "template": "class %SJob\n  include Sidekiq::Worker\n\n  @queue = :%i\n\n  def perform()\n  end\nend",
      \   "keywords":  "async job sequence"
      \ },
      \ "app/services/*.rb": {
      \   "command":   "service",
      \   "affinity":  "model",
      \   "alternate": "spec/services/%i_spec.rb",
      \   "related":   "db/schema.rb#%s",
      \   "test":      "spec/services/%i_spec.rb",
      \   "template": "class %SService\n  def initialize()\n  end\nend",
      \   "keywords": "service extraction sequence"
      \ },
      \ "test/factories/*.rb": {
      \   "command":   "factory",
      \   "affinity":  "collection",
      \   "alternate": "app/models/%i.rb",
      \   "related":   "db/schema.rb#%s",
      \   "test":      "test/models/%i_test.rb",
      \   "template":  "FactoryBot.define do\n  factory :%i do\n  end\nend",
      \   "keywords":  "factory sequence"
      \ },
      \ "spec/factories/*.rb": {
      \   "command":   "factory",
      \   "affinity":  "collection",
      \   "alternate": "app/models/%i.rb",
      \   "related":   "db/schema.rb#%s",
      \   "test":      "spec/models/%i_spec.rb",
      \   "template":  "FactoryBot.define do\n  factory :%i do\n  end\nend",
      \   "keywords":  "factory sequence"
      \ },
      \ "spec/features/*_spec.rb": {
      \   "command": "feature",
      \   "template": "require 'spec_helper'\n\nfeature '%h' do\n\nend",
      \ }}

let g:rails_gem_projections = {
      \ "active_model_serializers": {
      \   "app/serializers/*_serializer.rb": {
      \     "command": "serializer",
      \     "affinity": "model",
      \     "test": "spec/serializers/%s_spec.rb",
      \     "related": "app/models/%s.rb",
      \     "template": "class %SSerializer < ActiveModel::Serializer\nend"
      \   }
      \ },
      \ "draper": {
      \   "app/decorators/*_decorator.rb": {
      \     "command": "decorator",
      \     "affinity": "model",
      \     "test": "spec/decorators/%s_spec.rb",
      \     "related": "app/models/%s.rb",
      \     "template": "class %SDecorator < Draper::Decorator\nend"
      \   }
      \ }}

"strip trailing whitespace on save for code files
autocmd BufWritePre *.rb,*.yml,*.js,*.css,*.less,*.sass,*.html,*.xml,*.erb,*.haml,*.slim,*.scss,*.json,*.coffeescript :%s/\s\+$//e

" autocomplete/intellisense
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

" the ballonexpr for ruby sucks: large and irrelevant :(
if has("balloon_eval")
  autocmd FileType ruby setlocal noballooneval
end

let g:ruby_doc_command='open'

" let g:rubyindent_match_parentheses = 0
let g:ruby_minlines = 50
"let g:ruby_debugger_progname = 'mvim'

" solargraph ruby intellisense server
"
