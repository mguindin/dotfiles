" Autoinstall vim-plug if not installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

"-------------------=== Status Bar ===-----------------------------
Plug 'itchyny/lightline.vim'

"-------------------=== Theme ===-----------------------------
Plug 'chriskempson/base16-vim'

"-------------------=== Basics ===-----------------------------
" Indent text object
Plug 'michaeljsmith/vim-indent-object'

" Yank history navigation
Plug 'vim-scripts/YankRing.vim'

" FZF / Ctrlp for file navigation
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"-------------------=== Languages ===----------------------
"-------------------=== Code completion ===-----------------------
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}

"-------------------=== Python ===--------------------------------"
Plug 'neoclide/coc-python', {'do': 'yarn install --frozen-lockfile', 'for': 'python'}

"-------------------=== Java ===--------------------------------"
Plug 'neoclide/coc-java', {'do': 'yarn install --frozen-lockfile', 'for': 'java'}

"-------------------=== Scala ===--------------------------
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }

"-------------------=== Rust ===---------------------------
Plug 'neoclide/coc-rls', {'do': 'yarn install --frozen-lockfile', 'for': 'rust'}

"-------------------=== Go ===-----------------------------
Plug 'fatih/vim-go', { 'for': 'go' }

"-------------------=== Git ===--------------------------------"
Plug 'neoclide/coc-git', {'do': 'yarn install --frozen-lockfile'}

"-------------------=== Yaml ===--------------------------------"
Plug 'neoclide/coc-yaml', {'do': 'yarn install --frozen-lockfile'}

"-------------------=== Database ===------------------------------
Plug 'lifepillar/pgsql.vim', { 'for': 'sql' }

"---------------------=== AWS ===---------------------------------
Plug 'https://github.com/m-kat/aws-vim'

" Vim/tmux/linux
"-------------------=== Tools (vim, tmux, linux, etc) ===---------
Plug 'Raimondi/delimitMate'
Plug 'tmux-plugins/vim-tmux', { 'for': 'tmux' }

" tpope
" Comments
Plug 'tpope/vim-commentary'
" Pairings
Plug 'tpope/vim-unimpaired'
" Session management
Plug 'tpope/vim-obsession'
" 'surroundings' mappings
Plug 'tpope/vim-surround'
" Git
Plug 'tpope/vim-fugitive'

" Navigation
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Editorconfig
Plug 'editorconfig/editorconfig-vim'

" ultisnips engine
Plug 'SirVer/ultisnips'
"
" Snippets for ultisnips
Plug 'honza/vim-snippets'

call plug#end()

"--- Plugin configuration
" Set GoPath for vim-go
let $GOPATH = $HOME."/go"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsExpandTrigger="<c-e>"

" neovim
let g:python_host_prog=$HOME."/.pyenv/versions/neovim/bin/python"
let g:python_host_skip_check=1
let g:python3_host_prog=$HOME."/.pyenv/versions/neovim3/bin/python"
let g:python3_host_skip_check=1

" Code completion
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` for fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Buffer maps
nnoremap <leader>X :bdelete<CR>

" Display git blame in gutter
function! LightlineGitBlame() abort
  let blame = get(b:, 'coc_git_blame', '')
  " return blame
  return winwidth(0) > 120 ? blame : ''
endfunction

" Simpler bottom line in RO mode
function! LightlineReadonly()
  return &readonly && &filetype !=# 'help' ? 'RO' : ''
endfunction

" Add diagnostic info for https://github.com/itchyny/lightline.vim
let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [  [ 'mode', 'paste' ],
      \              [ 'gitbranch', 'cocstatus', 'readonly', 'filename', 'modified' ]  ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent'],
      \              [ 'fileformat', 'filetype', 'fileencoding' ] ],
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'cocstatus': 'coc#status',
      \   'readonly':  'LightlineReadonly'
      \ },
      \ }

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>E  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>S :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>l  :<C-u>CocListResume<CR>

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" FZF Stuff
nnoremap <leader>t :FZF<CR>

" editorconfig
" don't interfere with fugitive
let g:EditorConfig_exclude_patterns = ['fugitive://.\*', 'scp://.\*']
