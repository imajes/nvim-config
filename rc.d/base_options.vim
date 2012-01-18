" Section: Options
" ---------------------

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set number
set nobackup

set nocompatible
set autoindent
set autowrite       " Automatically save before commands like :next and :make
set backspace=2
set encoding=utf-8

if has("balloon_eval") && has("unix")
  set ballooneval
endif

if exists("&breakindent")
  set breakindent showbreak=+++
elseif has("gui_running")
  set showbreak=\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ +++
endif

set cmdheight=2
set complete-=i     " Searching includes can be slow
set dictionary+=/usr/share/dict/words
set display=lastline
set grepprg=git\ grep\ -niH\ $*

if has("eval")
  let &fileencodings = substitute(&fileencodings,"latin1","cp1252","")
  let &highlight = substitute(&highlight,'NonText','SpecialKey','g')
endif

set incsearch       " Incremental search
set joinspaces
set laststatus=2    " Always show status line

if has("mac")
  silent! set nomacatsui
else
  set lazyredraw
endif

"let &listchars="tab:\<M-;>\<M-7>,trail:\<M-7>"
set listchars=tab:>\ ,trail:-
set listchars+=extends:>,precedes:<

if version >= 700
  set listchars+=nbsp:+
endif

set modelines=5     " Debian likes to disable this
set mousemodel=popup
set pastetoggle=<F2>
set scrolloff=1
set showcmd         " Show (partial) command in status line.
set showmatch       " Show matching brackets.
set smartcase       " Case insensitive searches become sensitive with capitals
set smarttab        " sw at the start of the line, sts everywhere else

if exists("+spelllang")
  set spelllang=en_us
endif

set splitbelow      " Split windows at bottom
set suffixes+=.dvi  " Lower priority in wildcards
set tags+=./tags,../tags,../../tags,../../../tags,../../../../tags,./.tags,../.tags

set timeoutlen=1200 " A little bit more time for macros
set ttimeoutlen=50  " Make Esc work faster

if v:version >= 700
  set viminfo=!,'20,<50,s10,h
endif

set visualbell
set virtualedit=block
set wildmenu
set wildmode=longest:full,full
set wildignore+=*~
set winaltkeys=no

if v:version >= 600
  set autoread
  set foldmethod=marker
  set printoptions=paper:letter
  set sidescrolloff=5
  set mouse=nvi
endif

