" -- general settings
" Required for operations modifying multiple buffers like rename.
set hidden

" fix problems with uncommon shells (fish, xonsh) and plugins running commands
" (neomake, ...)
set shell=/bin/bash

" nvim sets utf8 by default, wrap in if because prevents reloading vimrc
if !has('nvim')
  set encoding=utf-8
endif

set t_ut=

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " Linux/MacOSX
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows


" Let's not write swap, etc
set nobackup
set nowritebackup
set noswapfile

set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum""]]"

if !has('nvim')
  set ttyscroll=3
  set ttymouse=sgr
end

set ttyfast " u got a fast terminal
set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor

"Split windows below the current window.
set splitbelow
set splitright

" Set to auto read when a file is changed from the outside
set autoread
"
"Write the old file out when switching between files.
set autowrite

set lazyredraw " redraw only what we need to

""Ever notice a slight lag after typing the leader key + command? This lowers
"the timeout.
set timeout timeoutlen=500 ttimeoutlen=0

" When the type of shell script is /bin/sh, assume a POSIX-compatible
" shell for syntax highlighting purposes.
let g:is_posix = 1

" Colors and fonts
syntax enable

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab " tabs are spaces

filetype indent on " load filetype-specific indent files

" Enable completion window
set completeopt+=preview

""Show command in bottom right portion of the screen
set showcmd

"Indent stuff
filetype plugin indent on

""Prefer a slightly higher line height
set linespace=3

"Better line wrapping
set wrap
set textwidth=79

"Highlight searching
set hlsearch

"" case insensitive search
set ignorecase
set smartcase

"Enable code folding
set foldenable
"
""Hide mouse when typing
set mousehide

"Spelling corrects. Just for example. Add yours below.
iab teh the
iab Teh The

" Scrollbar junk
set guioptions=aAce

colorscheme base16-onedark

"Show lines numbers
set number
set background=dark
if has('gui_running')
  "Using a cool patched font for powerline
  set guifont=Fira\ Code:h12
  "set background transparency and solarized style 
  autocmd vimenter * wincmd p
else
  set mouse=a
endif

" Yank text to the OS X clipboard
set clipboard=unnamed

" Correct cursor in terminal/tmux
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[0 q"

" Set spellfile to location that is guaranteed to exist, can be symlinked to
set spellfile=$HOME/.vim-spell-en.utf-8.add

" Always use vertical diffs
set diffopt+=vertical

