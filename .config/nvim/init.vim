set runtimepath+=~/.vim,~/.vim/after
" set packpath+=~/.vim
source ~/.vimrc

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Terminal
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" allow terminal buffer size to be very large
let g:terminal_scrollback_buffer_size = 100000

" use true colors in terminal
set termguicolors

" always start in insert mode when entering a :terminal buffer
autocmd BufWinEnter,WinEnter term://* startinsert

" exit insert mode in :terminal with 'jk'
tnoremap jk <C-\><C-n>
