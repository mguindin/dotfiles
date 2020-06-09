" vim:foldmethod=marker
" VimPlug ---------------------------------------------------- {{{ "
" Autoinstall vim-plug if not installed ---------------------- {{{ "
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" ------------------------------------------------------------ }}} "

call plug#begin('~/.vim/plugged')

" Status Bar (lightline) ------------------------------------- {{{ "
Plug 'itchyny/lightline.vim'
" ------------------------------------------------------------ }}} "

" Theme (seoul256) ------------------------------------------- {{{ "
Plug 'junegunn/seoul256.vim'
" ------------------------------------------------------------ }}} "

" Basics ----------------------------------------------------- {{{ "
" Indent text object
Plug 'michaeljsmith/vim-indent-object'

" Folding  --------------------------------------------------- {{{ "
" Fold anything
Plug 'pseewald/vim-anyfold'
" Fold/unfold with backspace / enter
Plug 'arecarn/vim-fold-cycle'
" ------------------------------------------------------------ }}} "

" File navigation -------------------------------------------- {{{ "
" FZF / Ctrlp for file navigation
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Navigation
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
" ------------------------------------------------------------ }}} "

" TPope plugins ---------------------------------------------- {{{ "
" Comments
Plug 'tpope/vim-commentary'
" Pairings
Plug 'tpope/vim-unimpaired'
" Session management
Plug 'tpope/vim-obsession'
" 'surroundings' mappings
Plug 'tpope/vim-surround'
" repeat
Plug 'tpope/vim-repeat'
" Git
Plug 'tpope/vim-fugitive'
" ------------------------------------------------------------ }}} "

" Bracketed paste mode support
Plug 'ConradIrwin/vim-bracketed-paste'

" Editorconfig
Plug 'editorconfig/editorconfig-vim'

" Multiple Cursors
Plug 'terryma/vim-multiple-cursors'

" ------------------------------------------------------------ }}} "

" Languages -------------------------------------------------- {{{ "
Plug 'sheerun/vim-polyglot'
" ------------------------------------------------------------ }}} "

" Code Completion -------------------------------------------- {{{ "
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" Snippets for ultisnips
Plug 'honza/vim-snippets'
" ------------------------------------------------------------ }}} "

" Code Testing ----------------------------------------------- {{{ "
Plug 'skywind3000/asyncrun.vim'
Plug 'vim-test/vim-test'
" ------------------------------------------------------------ }}} "

" Amazon ----------------------------------------------------- {{{ "
Plug 'https://github.com/m-kat/aws-vim'
" ------------------------------------------------------------ }}} "

" Tools (vim, tmux, linux, etc) ------------------------------ {{{ "
Plug 'Raimondi/delimitMate'
" Tmux-vim seamless navigation
Plug 'sunaku/tmux-navigate'
" ------------------------------------------------------------ }}}
" ------------------------------------------------------------ }}}

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
command! -nargs=? Fold :call CocAction('fold', <f-args>)

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

" AsyncRun (asyncrun) ---------------------------------------------------- {{{ "
let g:asyncrun_open = 8      " --> for the height of the quickfix window "
let g:asyncrun_status = ''   " --> to support integration with vim-airline "
" ------------------------------------------------------------------------ }}} "

" Add diagnostic info for https://github.com/itchyny/lightline.vim
let g:lightline = {
      \ 'colorscheme': 'seoul256',
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

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" FZF
" Fuzzy file finder
let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-v': 'vsplit'
      \ }

" FZF find files
nnoremap <Leader>f :FZF<cr>

function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

" FZF select buffer
nnoremap <silent> <Leader><Enter> :call fzf#run({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m',
\   'down':    len(<sid>buflist()) + 2
\ })<CR>

" disable anyfold for large files
let g:LargeFile = 1000000 " file is large if size greater than 1MB
autocmd BufReadPre,BufRead * let f=getfsize(expand("<afile>")) | if f > g:LargeFile || f == -2 | call LargeFile() | endif
function LargeFile()
    augroup anyfold
        autocmd! " remove AnyFoldActivate
        autocmd Filetype <filetype> setlocal foldmethod=indent " fall back to indent folding
    augroup END
endfunction

" editorconfig
" don't interfere with fugitive
let g:EditorConfig_exclude_patterns = ['fugitive://.\*', 'scp://.\*']
