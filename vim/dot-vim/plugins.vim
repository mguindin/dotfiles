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

" Undotree
Plug 'mbbill/undotree'

" ------------------------------------------------------------ }}} "

" Languages -------------------------------------------------- {{{ "
Plug 'sheerun/vim-polyglot'
" ------------------------------------------------------------ }}} "

" Code Completion -------------------------------------------- {{{ "
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" Snippets for ultisnips
Plug 'honza/vim-snippets'

" tmux completion
Plug 'wellle/tmux-complete.vim'
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

" Code Completion Settings ------------------------------------{{{ "
"
" Searching
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>phw :h <C-R>=expand("<cword>")<CR><CR>

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

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
"nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Extensions to use with coc-nvim
let g:coc_global_extensions = [
            \ 'coc-json',
            \ 'coc-java',
            \ 'coc-dictionary',
            \ 'coc-emoji',
            \ 'coc-git',
            \ 'coc-gocode',
            \ 'coc-lists',
            \ 'coc-python',
            \ 'coc-rls',
            \ 'coc-snippets',
            \ 'coc-yaml',
            \ 'coc-yank'
            \ 'coc-spell-checker'
            \ ]

" ----------------------------------------------------- }}}

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

if executable('rg')
  let g:rg_derive_root='true'
endif

" FZF
" Fuzzy file finder
let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-v': 'vsplit'
      \ }

" FZF find files
nnoremap <Leader>ff :FZF<cr>

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
nnoremap <silent> <Leader>bb :call fzf#run({
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

" FuGITive {{{
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>
" }}}
