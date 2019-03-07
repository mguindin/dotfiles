" Autoinstall vim-plug if not installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

"-------------------=== Status Bar ===-----------------------------
Plug 'itchyny/lightline.vim'
" Plug 'chriskempson/base16-vim'
Plug 'danielwe/base16-vim'

"-------------------=== Basics ===-----------------------------
" Indent text object
Plug 'michaeljsmith/vim-indent-object'
" `Sensible` basics
Plug 'tpope/vim-sensible'
" Yank history navigation
Plug 'vim-scripts/YankRing.vim'

" FZF / Ctrlp for file navigation
Plug 'junegunn/fzf', {'dir': '~/.local/src/fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"-------------------=== Languages ===----------------------
"-------------------=== Code completion ===-----------------------
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}

"-------------------=== Scala ===--------------------------
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }

"-------------------=== Rust ===---------------------------
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'racer-rust/vim-racer', { 'for': 'rust' }

"-------------------=== Go ===-----------------------------
Plug 'fatih/vim-go', { 'for': 'go' }

"-------------------=== Python ===--------------------------------"
if has('python3') 
  Plug 'python-mode/python-mode', { 'branch': 'develop', 'for': 'python' } "Python mode (docs, refactor, lints...)
  Plug 'ryanolsonx/vim-lsp-python', { 'for': 'python' }
endif

"-------------------=== Database ===------------------------------
Plug 'lifepillar/pgsql.vim', { 'for': 'sql' }

" Vim/tmux/linux
"-------------------=== Tools (vim, tmux, linux, etc) ===---------
Plug 'Raimondi/delimitMate'
Plug 'Shougo/neco-vim'
Plug 'Shougo/neco-syntax'
Plug 'justinmk/vim-sneak'
Plug 'tmux-plugins/vim-tmux', { 'for': 'tmux' }

" ultisnips engine
Plug 'SirVer/ultisnips'
"
" Snippets for ultisnips
Plug 'honza/vim-snippets'

Plug 'w0rp/ale'                           " syntax checking

call plug#end()

"--- Plugin configuration
" Set GoPath for vim-go
let $GOPATH = $HOME."/go"

"=====================================================
"" Python settings
"=====================================================
let g:pymode_python= 'python3'
let g:python2_host_prog=$HOME.'/.pyenv/shims/python2'
let g:python3_host_prog= $HOME.'/.pyenv/shims/python3'
" Skip the check of neovim module
let g:python3_host_skip_check = 1

" rope
let g:pymode_rope=0
let g:pymode_rope_completion=0
let g:pymode_rope_complete_on_dot=0
let g:pymode_rope_auto_project=0
let g:pymode_rope_enable_autoimport=0
let g:pymode_rope_autoimport_generate=0
let g:pymode_rope_guess_project=0

" documentation
let g:pymode_doc=0
let g:pymode_doc_bind='K'

" lints
let g:pymode_lint=0

" breakpoints
let g:pymode_breakpoint=1
let g:pymode_breakpoint_key='<leader>b'

" syntax highlight
let g:pymode_syntax=1
let g:pymode_syntax_slow_sync=1
let g:pymode_syntax_all=1
let g:pymode_syntax_print_as_function=g:pymode_syntax_all
let g:pymode_syntax_highlight_async_await=g:pymode_syntax_all
let g:pymode_syntax_highlight_equal_operator=g:pymode_syntax_all
let g:pymode_syntax_highlight_stars_operator=g:pymode_syntax_all
let g:pymode_syntax_highlight_self=g:pymode_syntax_all
let g:pymode_syntax_indent_errors=g:pymode_syntax_all
let g:pymode_syntax_string_formatting=g:pymode_syntax_all
let g:pymode_syntax_space_errors=g:pymode_syntax_all
let g:pymode_syntax_string_format=g:pymode_syntax_all
let g:pymode_syntax_string_templates=g:pymode_syntax_all
let g:pymode_syntax_doctests=g:pymode_syntax_all
let g:pymode_syntax_builtin_objs=g:pymode_syntax_all
let g:pymode_syntax_builtin_types=g:pymode_syntax_all
let g:pymode_syntax_highlight_exceptions=g:pymode_syntax_all
let g:pymode_syntax_docstrings=g:pymode_syntax_all

" code folding
let g:pymode_folding=0

" pep8 indents
let g:pymode_indent=1

" code running
let g:pymode_run=1
let g:pymode_run_bind='<F5>'

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsExpandTrigger="<c-e>"

" Code completion
" Better display for messages
set cmdheight=2

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

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

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


" Add diagnostic info for https://github.com/itchyny/lightline.vim
let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status'
      \ },
      \ }


" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


" Ale
let b:ale_linters = ['flake8']
let g:ale_linters = {
      \   'gitcommit': ['gitlint'],
      \   'python': ['pyls'],
      \   'go': ['gometalinter'],
      \   'cpp': [],
      \   'c': ['clangtidy'],
      \}
let b:ale_fixers = [
      \ 'remove_trailing_lines',
      \   'isort',
      \   'ale#fixers#generic_python#BreakUpLongLines',
      \   'yapf',
      \]

" These are fallbacks for language clients
nnoremap <Leader>rj :ALEGoToDefinition<CR>
nnoremap <Leader>rf :ALEFindReferences<CR>
nnoremap <Leader>rh :ALEHover<CR>
nnoremap <buffer> <silent> <LocalLeader>= :ALEFix<CR>

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" Enable completion where available.
let g:ale_completion_enabled = 1
