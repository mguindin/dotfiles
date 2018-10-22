" Autoinstall vim-plug if not installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

"-------------------=== Status Bar ===-----------------------------
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'chriskempson/base16-vim'

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
Plug 'maralla/completor.vim'

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

  " ultisnips engine
  Plug 'SirVer/ultisnips'
  "
  " Snippets for ultisnips
  Plug 'honza/vim-snippets'
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

Plug 'w0rp/ale'                           " syntax checking

call plug#end()

"--- Plugin configuration
" Set GoPath for vim-go
let $GOPATH = $HOME."/go"

"=====================================================
"" Python settings
"=====================================================
" Fix for Python 3.7 deprecation warning
if has('python3') && !has('patch-8.1.201')
  silent! python3 1
endif

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

" Python
let g:completor_python_binary=$HOME.'/.pyenv/shims/python'
" C/C++
let g:completor_clang_binary='/usr/bin/clang'
" Go
let g:completor_gocode_binary=$GOPATH.'/bin/gocode' 

le
" Use TAB to complete when typing words, else inserts TABs as usual.  Uses
" dictionary, source files, and completor to find matching words to complete.

" Note: usual completion is on <C-n> but more trouble to press all the time.
" Never type the same word twice and maybe learn a new spellings!
" Use the Linux dictionary when spelling is in doubt.
function! Tab_Or_Complete() abort
  " If completor is already open the `tab` cycles through suggested completions.
  if pumvisible()
    return "\<C-N>"
  " If completor is not open and we are in the middle of typing a word then
  " `tab` opens completor menu.
  elseif col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-R>=completor#do('complete')\<CR>"
  else
    " If we aren't typing a word and we press `tab` simply do the normal `tab`
    " action.
    return "\<Tab>"
  endif
endfunction

" Use `tab` key to select completions.  Default is arrow keys.
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use tab to trigger auto completion.  Default suggests completions as you type.
let g:completor_auto_trigger = 1
inoremap <expr> <Tab> Tab_Or_Complete()

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

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" Enable completion where available.
let g:ale_completion_enabled = 1

"vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 1 " Enable branches
let g:airline_theme='base16'
