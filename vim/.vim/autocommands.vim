augroup configgroup
  autocmd!

  autocmd VimEnter * highlight clear SignColumn
  autocmd GUIEnter * set vb t_vb=
  autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md %s/\s\+$//e

  " Run linter on write
  autocmd BufEnter Makefile setlocal noexpandtab
  autocmd BufEnter *.sh setlocal tabstop=2 shiftwidth=2 softtabstop=2

  "Git commit messages
  autocmd Filetype gitcommit setlocal spell textwidth=80
  " for .hql files
  autocmd BufNewFile,BufRead *.hql set filetype=hive expandtab

  " Python
  autocmd FileType python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4

  " Java
  autocmd FileType java setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
 
  " Dockerfile
  autocmd BufNewFile,BufRead Dockerfile* set filetype=Dockerfile expandtab

  " for .q files
  autocmd BufNewFile,BufRead *.q set filetype=hive expandtab
  autocmd BufReadPost *.rs setlocal filetype=rust

  autocmd GUIEnter * set vb t_vb=
  " fix cursor when exiting
  autocmd VimLeave * set guicursor=a:block-blinkon0

  " autoclose completion window on complete or insertleave
  autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
  autocmd InsertEnter * set cul
  autocmd InsertLeave * set nocul

  " ALE linting events
  set updatetime=1000
  let g:ale_lint_on_text_changed = 0
  autocmd CursorHold * call ale#Queue(0)
  autocmd CursorHoldI * call ale#Queue(0)
  autocmd InsertEnter * call ale#Queue(0)
  autocmd InsertLeave * call ale#Queue(0)
  autocmd FileType gitcommit let g:ale_sign_column_always = 1

  " have vim jump to last location in a file on default
  autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif

  " ignore the previous autocmd when it's the git commit msg
  autocmd BufReadPost COMMIT_EDITMSG
    \ exe "normal! ggI"
augroup END
