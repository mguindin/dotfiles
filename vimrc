set t_Co=256
syntax on
"colorss xoria256
"colors zenburn
set guifont=Monaco:h12
set number
set title
set ttyfast
set hlsearch
set tabstop=4	"tab is 4 spaces
set softtabstop=4
set shiftwidth=4
set expandtab
"set background=dark 
set smartindent
"colors peaksea 

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
set t_Co=256
#colorscheme mustang
set guifont=Monaco:h12
set backspace=indent,eol,start
set history=50
set ruler
set showcmd
set incsearch

#enable mouse
set mouse=a

if &t_Co > 2 || has("gui_running")
        syntax on
         set hisearch
endif

set autoindent
set ts=4
set shiftwidth=4
            set softtabstop=4
            set tabstop=8
            set nocp incsearch
            set cinoptions=:0,p0,t0
            set cinwords=if,else,while,do,for,switch,case
            set formatoptions=tcqr
            set cindent
            set smarttab
            set expandtab
            set ruler
            set noh1search

            set number

syntax enable
set background=dark
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_constrast="high"
let g:solarized_visibility="high"
colorscheme solarized
