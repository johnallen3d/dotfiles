set runtimepath+=~/.vim,~/.vim/after
" set packpath+=~/.vim
source ~/.vim/vimrc

" live substitution
set inccommand=nosplit

" https://github.com/kovidgoyal/kitty/issues/380#issuecomment-372265265
let &t_ut=''

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Terminal
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" allow terminal buffer size to be very large
let g:terminal_scrollback_buffer_size = 1000000

" use true colors in terminal
set termguicolors

" always start in insert mode when entering a :terminal buffer
autocmd BufWinEnter,WinEnter term://* startinsert

" exit insert mode in :terminal with 'jk'
tnoremap jk <C-\><C-n>

" Pane navigation (can exit pane from insert mode)
tnoremap <C-h> <c-\><c-n><c-w>h
" tnoremap <C-j> <c-\><c-n><c-w>j
" tnoremap <C-k> <c-\><c-n><c-w>k
tnoremap <C-l> <c-\><c-n><c-w>l
