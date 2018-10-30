augroup configgroup
  autocmd!

  autocmd VimEnter * highlight clear SignColumn
  autocmd GUIEnter * set vb t_vb=
  autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md %s/\s\+$//e

  " Run linter on write
  autocmd FileType java setlocal noexpandtab
  autocmd FileType java setlocal list
  autocmd FileType java setlocal listchars=tab:+\ ,eol:-
  autocmd FileType java setlocal formatprg=par\ -w80\ -T4
  autocmd FileType php setlocal expandtab
  autocmd FileType php setlocal list
  autocmd FileType php setlocal listchars=tab:+\ ,eol:-
  autocmd FileType php setlocal formatprg=par\ -w80\ -T4
  autocmd FileType ruby setlocal tabstop=2
  autocmd FileType ruby setlocal shiftwidth=2
  autocmd FileType ruby setlocal softtabstop=2
  autocmd FileType ruby setlocal commentstring=#\ %s
  autocmd FileType python setlocal commentstring=#\ %s
  autocmd BufEnter *.cls setlocal filetype=java
  autocmd BufEnter *.zsh-theme setlocal filetype=zsh
  autocmd BufEnter Makefile setlocal noexpandtab
  autocmd BufEnter *.sh setlocal tabstop=2
  autocmd BufEnter *.sh setlocal shiftwidth=2
  autocmd BufEnter *.sh setlocal softtabstop=2

  "Git commit messages
  autocmd Filetype gitcommit setlocal spell textwidth=79
  " for .hql files
  autocmd BufNewFile,BufRead *.hql set filetype=hive expandtab

  " for .Dockerfile
  autocmd BufNewFile,BufRead Dockerfile* set filetype=Dockerfile expandtab

  " for .q files
  autocmd BufNewFile,BufRead *.q set filetype=hive expandtab
  autocmd BufReadPost *.rs setlocal filetype=rust

  " Scala
  autocmd BufWritePost *.scala silent :EnTypeCheck

  " Stuff for Go
  autocmd FileType go nmap <leader>r <Plug>(go-run)
  autocmd FileType go nmap <leader>b <Plug>(go-build)
  autocmd FileType go nmap <leader>T <Plug>(go-test)
  autocmd FileType go nmap <leader>c <Plug>(go-coverage)
  autocmd FileType go nmap <Leader>ds <Plug>(go-def-split)
  autocmd FileType go nmap <Leader>dv <Plug>(go-def-vertical)
  autocmd FileType go nmap <Leader>dt <Plug>(go-def-tab)
  autocmd FileType go nmap <Leader>gd <Plug>(go-doc)
  autocmd FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
  autocmd FileType go nmap <Leader>gb <Plug>(go-doc-browser)

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
  autocmd CursorHold * call ale#Lint()
  autocmd CursorHoldI * call ale#Lint()
  autocmd InsertEnter * call ale#Lint()
  autocmd InsertLeave * call ale#Lint()
  autocmd FileType gitcommit let g:ale_sign_column_always = 1

  " have vim jump to last location in a file on default
  autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif

  " ignore the previous autocmd when it's the git commit msg
  autocmd BufReadPost COMMIT_EDITMSG
    \ exe "normal! ggI"
augroup END
