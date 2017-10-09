set runtimepath+=~/.vim,~/.vim/after
set packpath+=~/.vim
source ~/.vimrc

" " use true colors in terminal
set termguicolors

" " always start in insert mode when entering a :terminal buffer
autocmd BufWinEnter,WinEnter term://* startinsert

" " exit insert mode in :terminal with 'jk'
tnoremap jk <C-\><C-n>
