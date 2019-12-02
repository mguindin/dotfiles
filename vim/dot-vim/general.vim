" -- general settings
" Required for operations modifying multiple buffers like rename.
set hidden
" Don't show --NORMAL-- or --INSERT--
set noshowmode
" Display lightline
set laststatus=2
" fix problems with uncommon shells (fish, xonsh) and plugins running commands
" (neomake, ...)
set shell=/bin/bash

" nvim sets utf8 by default, wrap in if because prevents reloading vimrc
if !has('nvim')
    set encoding=utf-8
endif

if &term =~ '256color'
    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
    set t_ut=
endif

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " Linux/MacOSX
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

set backspace=indent,eol,start
set smarttab

" Good advice from here:
" https://begriffs.com/posts/2019-07-19-history-use-vim.html
" Protect changes between writes. Default values of
" updatecount (200 keystrokes) and updatetime
" (4 seconds) are fine
set swapfile
set directory^=~/.vim/swap//

" protect against crash-during-write
set writebackup
" but do not persist backup after successful write
set nobackup
" use rename-and-write-new method whenever safe
set backupcopy=auto
" patch required to honor double slash at end
if has("patch-8.1.0251")
	" consolidate the writebackups -- not a big
	" deal either way, since they usually get deleted
	set backupdir^=~/.vim/backup//
end

" persist the undo tree for each file
set undofile
set undodir^=~/.vim/undo//

set history=1000
set tabpagemax=50

set sessionoptions-=options

if !has('nvim')
    set ttyscroll=3
    set ttymouse=xterm2
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

"Ever notice a slight lag after typing the leader key + command? This lowers
"the timeout.
set timeout timeoutlen=500 ttimeoutlen=0

" When the type of shell script is /bin/sh, assume a POSIX-compatible
" shell for syntax highlighting purposes.
let g:is_posix = 1

" Colors and fonts
syntax enable

" Softtabs, 2 spaces
set tabstop=8
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab " tabs are spaces

set autoindent
filetype plugin indent on " load filetype-specific indent files

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
set foldmethod=indent

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
    "set background transparency and style
    autocmd vimenter * wincmd p
else
    set mouse=a
endif

" Fixes issues with TRUECOLOR in tmux in alacritty
if exists('+termguicolors')
    let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
    " Set termguicolors to enable 24-bit TrueColor
    set termguicolors
endif

" Yank text to the OS X clipboard
set clipboard=unnamed

" show trailing whitespace chars
set list
set listchars=tab:>-,trail:.,extends:#,nbsp:.

" Correct cursor in terminal/tmux
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[0 q"

" Set vim terminal to fish if it exists
if !empty(glob("/usr/local/bin/fish"))
    set shell=/usr/local/bin/fish
endif

" Set spellfile to location that is guaranteed to exist, can be symlinked to
set spellfile=$HOME/.vim-spell-en.utf-8.add

" Always use vertical diffs
set diffopt+=vertical
