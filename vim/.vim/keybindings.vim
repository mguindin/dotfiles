" Set leader to space
" keep <space>w as :w and <space>q as :q
map <space> <Leader>
nnoremap <Leader>w :w<CR>
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

" Remap increment and decrement numbers to something that works on macs/linux
nnoremap <A-a> <C-a>
nnoremap <A-x> <C-x>

" tabs
nnoremap <Leader>] :tabn<cr>
nnoremap <Leader>[ :tabp<cr>
nnoremap <Leader>T :tabe<cr>
nnoremap <leader>tn :tabn<CR>
nnoremap <leader>tp :tabp<CR>
nnoremap <leader>tc :tabclose<CR>

" Buffers
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bp :bp<CR>

" Windows and Splits
" easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Better up/down line movement
nnoremap j gj
nnoremap k gk

" Remap increment as C-g (C-a is used by tmux)
nnoremap <C-g> <C-a>

"Map escape key to jj -- much faster
imap jj <esc>

" sudo write
cmap w!! w !sudo tee > /dev/null %

" Run current line as command
nnoremap <leader>e :exe getline(line('.'))<cr>

