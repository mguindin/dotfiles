" -- general settings
"
" Required for operations modifying multiple buffers like rename.
set hidden

" Don't show --NORMAL-- or --INSERT--
set noshowmode

" Display lightline
set laststatus=2

" fix problems with uncommon shells (fish, xonsh) and plugins running commands
" (neomake, ...)
set shell=/bin/bash

if !has('nvim')
  " nvim sets utf8 by default, wrap in if because prevents reloading vimrc
  set encoding=utf-8
  set ttyscroll=3
  set ttymouse=xterm2
else
  " neovim
  if executable($HOME."/.pyenv/versions/neovim3/bin/python")
    let g:python3_host_prog=$HOME."/.pyenv/versions/neovim3/bin/python"
    let g:python3_host_skip_check=1
  elseif executable("python3")
    let g:python3_host_prog="python3"
    let g:python3_host_skip_check=1
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

set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor

"Split windows below the current window.
set splitbelow
set splitright

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

syntax enable

" Softtabs, 2 spaces
set tabstop=8
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

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

" folding (using anyfold)
" fold comments
let g:anyfold_fold_comments=1

" Close all folds by default
set foldlevel=0

""Hide mouse when typing
set mousehide

"Spelling corrects. Just for example. Add yours below.
iab teh the
iab Teh The

" Scrollbar junk
set guioptions=aAce

" Colors and fonts
" colorscheme (Seoul-256)
let g:seoul256_background = 236
let g:seoul256_light_background = 253
colo seoul256

"Show relative line numbers
set nu rnu

if has('gui_running')
  "Using a cool patched font for powerline
  set guifont=JetBrainsMono\ Nerd\ Font\ Regular:h13
  "set background transparency and style
  autocmd vimenter * wincmd p
else
  set mouse=a
endif

" Setting truecolor https://github.com/tmux/tmux/issues/1246
if (has("termguicolors"))
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

" Set spellfile to location that is guaranteed to exist, can be symlinked to
set spellfile=$HOME/.vim-spell-en.utf-8.add

" Always use vertical diffs
set diffopt+=vertical
