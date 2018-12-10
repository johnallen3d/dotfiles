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
" set termguicolors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" always start in insert mode when entering a :terminal buffer
autocmd BufWinEnter,WinEnter term://* startinsert

" exit insert mode in :terminal with 'jk'
tnoremap jk <C-\><C-n>

" Pane navigation (can exit pane from insert mode)
tnoremap <C-h> <c-\><c-n><c-w>h
" tnoremap <C-j> <c-\><c-n><c-w>j
" tnoremap <C-k> <c-\><c-n><c-w>k
tnoremap <C-l> <c-\><c-n><c-w>l


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Workspace Setup
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! DefaultWorkspace()
  let numcol = 2

  " Rough num columns to decide between laptop and big monitor screens
  if winwidth(0) >= 260
    let numcol = 3
  endif

  e README.md
  vsp

  if numcol == 3
    vnew
    Tnew
  endif

  :2wincmd h
endfunction
command! -register DefaultWorkspace call DefaultWorkspace()
