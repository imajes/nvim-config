autocmd BufNewFile,BufRead *.haml             set ft=haml
autocmd BufNewFile,BufRead *.feature,*.story  set ft=cucumber
autocmd BufRead * if ! did_filetype() && getline(1)." ".getline(2).
            \ " ".getline(3) =~? '<\%(!DOCTYPE \)\=html\>' | setf html | endif

autocmd FileType javascript,coffee      setlocal et sw=2 sts=2 isk+=$
autocmd FileType html,xhtml,css,scss    setlocal et sw=2 sts=2
autocmd FileType eruby,yaml,ruby        setlocal et sw=2 sts=2
autocmd FileType cucumber               setlocal et sw=2 sts=2
autocmd FileType gitcommit              setlocal spell
autocmd FileType gitconfig              setlocal noet sw=8
autocmd FileType ruby                   setlocal comments=:#\  tw=79
autocmd FileType sh,csh,zsh             setlocal et sw=2 sts=2
autocmd FileType vim                    setlocal et sw=2 sts=2 keywordprg=:help
autocmd FileType gem                    setlocal ft=ruby

autocmd Syntax   css  syn sync minlines=50
autocmd FileType css set fdm=marker fmr={,}

iabbrev rd require 'ruby-debug'; Debugger.start; debugger

nmap <silent> <Leader>h :%s/require 'test_helper'/require File.expand_path(File.dirname(__FILE__) + "\/..\/test_helper")/g

" customize rails.vim
autocmd User Rails Rnavcommand -suffix=.rb            factory    test/factories spec/factories -glob=**/* -default=model()
autocmd User Rails Rnavcommand -suffix=_fabricator.rb fabricator test/fabricators spec/fabricators -glob=**/* -default=model()
autocmd User Rails Rnavcommand -suffix=_job.rb        job        app/jobs
autocmd User Rails Rnavcommand -suffix=.sass          sass       app/stylesheets
autocmd User Rails Rnavcommand -suffix=.less          less       app/stylesheets
autocmd User Rails Rnavcommand -suffix=.coffee        coffee     app/coffeescripts
autocmd User Rails Rnavcommand -suffix=.rb            lib        app/lib
autocmd User Rails Rnavcommand -suffix=.feature       feature    features
autocmd User Rails Rnavcommand -suffix=_steps.rb      steps      features/step_definitions


" json stuffs...
au! BufRead,BufNewFile *.json set filetype=json

augroup json_autocmd
  autocmd!
  autocmd FileType json set autoindent
  autocmd FileType json set formatoptions=tcq2l
  autocmd FileType json set textwidth=78 shiftwidth=2
  autocmd FileType json set softtabstop=2 tabstop=8
  autocmd FileType json set expandtab
  autocmd FileType json set foldmethod=syntax
augroup END

"strip trailing whitespace on save for code files
"cocoa
autocmd BufWritePre *.m,*.h,*.c,*.mm,*.cpp,*.hpp,*.java :%s/\s\+$//e
"rails
autocmd BufWritePre *.rb,*.yml,*.js,*.css,*.less,*.sass,*.html,*.xml,*.erb,*.haml :%s/\s\+$//e
