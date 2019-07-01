" Set leader to space
" keep <space>w as :w and <space>q as :q
map <space> <Leader>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>W :w<CR>
nnoremap <Leader>wq :wq
nnoremap <Leader>WQ :wq
nnoremap <Leader>Wq :wq
nnoremap <Leader>wq! :wq!<CR>
nnoremap <Leader>q :q
nnoremap <Leader>Q :q
nnoremap <Leader>q! :q!<CR>

" Space v
""Opens a vertical split and switches over
nnoremap <Leader>v <C-w>v<C-w>l
nnoremap <Leader>\| <C-w>v<C-w>l

" Space s
"Opens a horizontal split and switches over
nnoremap <Leader>s <C-w>s<C-w>j
nnoremap <Leader>- <C-w>s<C-w>j
" source vimrc
nnoremap <Leader>ss :source $HOME/.vim/vimrc<CR>

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
nnoremap <leader>gt :tabn<CR>
nnoremap <leader>gT :tabp<CR>
nnoremap <leader>tc :tabclose<CR>

" Buffers
nnoremap <leader>gb :bn<CR>
nnoremap <leader>gB :bp<CR>

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

" Buffer 
" next buffer
nnoremap gb :bnext<CR>
" previous buffer
nnoremap gB :bprevious<CR>

" Map backtick to switch between the current and previous file
nmap \` :e#<CR>

" Map ; to fuzzy search through open buffers
nmap ; :Buffers<CR>

" Tab management
" next Tab
nnoremap gt :tabp<CR>
" previous Tab
nnoremap gT :tabn<CR>

" Remap increment as C-g (C-a is used by tmux)
nnoremap <C-g> <C-a>

" NERDTree
map <C-t> :NERDTreeToggle<CR>

"Map escape key to jj -- much faster
imap jj <esc>

" sudo write
cmap w!! w !sudo tee > /dev/null %

" Run current line as command
nnoremap <leader>e :exe getline(line('.'))<cr>

