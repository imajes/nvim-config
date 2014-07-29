" Section: Language, Ruby
" -----------------------------

if exists("g:vundle_install_plugin")
  " ruby core
  Plugin 'vim-ruby/vim-ruby'
  Plugin 'lucapette/vim-ruby-doc'
  Plugin 'nelstrom/vim-textobj-rubyblock'

  " ruby extra
  Plugin 'tpope/vim-rvm'
  Plugin 'tpope/vim-rake'

  " rails
  Plugin 'tpope/vim-rails'
  Plugin 'tpope/vim-bundler'

  " testing
  Plugin 'thoughtbot/vim-rspec'
  Plugin 'tpope/vim-cucumber'

  finish
endif

if has("eval")
  " RSpec.vim mappings
  map <Leader>r :call RunCurrentSpecFile()<CR>
  map <Leader>s :call RunNearestSpec()<CR>
  map <Leader>l :call RunLastSpec()<CR>
  map <Leader>a :call RunAllSpecs()<CR>

  " automap for filetypes
  autocmd BufNewFile,BufRead *.haml             set ft=haml
  autocmd BufNewFile,BufRead *.feature,*.story  set ft=cucumber
  autocmd BufNewFile,BufRead *.erb set ft=eruby

  autocmd FileType gem                    setlocal ft=ruby
  autocmd FileType eruby,yaml,ruby        setlocal et sw=2 sts=2
  autocmd FileType cucumber               setlocal et sw=2 sts=2
  autocmd FileType ruby                   setlocal comments=:#\  tw=79


  " customize rails.vim
  autocmd User Rails Rnavcommand -suffix=.rb        factory    spec/factories -glob=**/* -default=model()
  autocmd User Rails Rnavcommand -suffix=.rb        job        app/jobs -glob=**/*
  autocmd User Rails Rnavcommand -suffix=.sass      sass       app/assets/stylesheets vendor/assets/stylesheets lib/assets/stylesheets -glob=**/*
  autocmd User Rails Rnavcommand -suffix=.scss      sass       app/assets/stylesheets vendor/assets/stylesheets lib/assets/stylesheets -glob=**/*
  autocmd User Rails Rnavcommand -suffix=.coffee    coffee     app/assets/javascripts vendor/assets/javascripts lib/assets/javascripts -glob=**/*
  autocmd User Rails Rnavcommand -suffix=.rb        lib        app/lib -glob=**/*
  autocmd User Rails Rnavcommand -suffix=.feature   feature    features -glob=**/*
  autocmd User Rails Rnavcommand -suffix=_steps.rb  steps      features/step_definitions -glob=**/*
  autocmd User Rails Rnavcommand -suffix=.rb        extension  lib/extensions -glob=**/*
  autocmd User Rails Rnavcommand -suffix=.rb        mixin      lib/mixins -glob=**/*
  autocmd User Rails Rnavcommand -suffix=.rb        middleware lib/middleware -glob=**/*

  "strip trailing whitespace on save for code files
  autocmd BufWritePre *.rb,*.yml,*.js,*.css,*.less,*.sass,*.html,*.xml,*.erb,*.haml,*.slim,*.scss,*.json,*.coffeescript :%s/\s\+$//e

  " autocomplete/intellisense
  autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
  autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
  autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

  " the ballonexpr for ruby sucks: large and irrelevant :(
  "autocmd FileType ruby setlocal balloonexpr=RubyBalloonexpr()

  let g:ruby_doc_command='open'

  " let g:rubyindent_match_parentheses = 0
  let g:ruby_minlines = 50
  "let g:ruby_debugger_progname = 'mvim'
endif

