" Section: Vim, Sensible Defaults
" --------------------------------

" sensible.vim: Defaults everyone can agree on
Plug 'tpope/vim-sensible'

" highlight all search terms
set hlsearch

if has("gui_running")
  " this is a anti-alias view setting for macvim
  set guioptions=egmrt
endif

if exists('&macatsui')
  set nomacatsui
endif

" undo history
set undodir=~/.vim/backups
set undofile

" defaults for line spacing and such
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" show line number, don't take backups
set number
set nobackup

" automatically indent stuff
set autoindent
" Automatically save before commands like :next and :make
set autowrite
set backspace=2
set encoding=utf-8

set signcolumn=yes " don't let the sign gutter show and hide when using ale

set cmdheight=2
set display=lastline
set incsearch       " Incremental search
set joinspaces
set laststatus=2    " Always show status line

let g:mapleader = ',' "remap leader to comma

" stolen from https://github.com/willfish/vimrc
set lazyredraw      " Don't redraw while executing macros (perf boost)

set modelines=5     " Debian likes to disable this
set scrolloff=1
set showcmd         " Show (partial) command in status line.
set showmatch       " Show matching brackets.
set smartcase       " Case insensitive searches become sensitive with capitals
set smarttab        " sw at the start of the line, sts everywhere else
set smartindent     " looks like this is cool

if exists("+spelllang")
  set spelllang=en_us
endif

set splitbelow      " Split windows at bottom
set suffixes+=.dvi  " Lower priority in wildcards
set timeoutlen=1200 " A little bit more time for macros
set ttimeoutlen=50  " Make Esc work faster

if v:version >= 700
  set viminfo=!,'20,<50,s10,h
endif

set visualbell
set virtualedit=block
set wildmenu
set wildmode=longest:full,full
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store,*.o,*~,*.pyc | " Ignore version control and os files
set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:$,precedes:«,extends:»  | " Show special characters

set winaltkeys=no

if v:version >= 600
  set autoread
  set foldmethod=marker
  set foldlevel=3
  set printoptions=paper:letter
  set sidescrolloff=5
  set mouse=nvi
endif

if exists("&breakindent")
  set breakindent showbreak=+++
elseif has("gui_running")
  set showbreak=\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ +++
endif


if has("eval")
  let &fileencodings = substitute(&fileencodings,"latin1","cp1252","")
  "let &highlight = substitute(&highlight,'NonText','SpecialKey','g')
endif

augroup preserve_last_position
  " Return to last edit position when opening files (You want this!)
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
augroup END
