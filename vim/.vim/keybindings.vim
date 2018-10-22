" Set leader to space
" keep <space>w as :w and <space>q as :q
map <space> <Leader>
nnoremap <Leader>w :w
nnoremap <Leader>wq :wq
nnoremap <Leader>wq! :wq!<CR>
nnoremap <Leader>q :q
nnoremap <Leader>q! :q!<CR>

" Space v
""Opens a vertical split and switches over
nnoremap <Leader>v <C-w>v<C-w>l

" Space s
""Opens a horizontal split and switches over
nnoremap <Leader>s <C-w>s<C-w>j
" Source vimrc
nnoremap <Leader>ss :source ~/.vimrc

" Space b
nmap <Leader>bn    :bnext<CR>
nmap <Leader>bp    :bprevious<CR>

" Space n
" Search lines with fzf
nnoremap <silent> <Leader>n :Lines<CR>

" Space y
noremap <Leader>y "+y
noremap <Leader>yy "+yy

" Space p
" Preserve indentation while pasting text from the OS X clipboard
noremap <Leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>
