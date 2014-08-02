" " vim-startify
let g:startify_session_dir = "~/.vim/sessions"

let g:ctrlp_reuse_window = 'startify'

let g:startify_list_order = [
      \ ['   Sessions:'],
      \ 'sessions',
      \ ['   Bookmarks:'],
      \ 'bookmarks',
      \ ['   LRU:'],
      \ 'files',
      \ ]

let g:startify_skiplist = [
      \ 'COMMIT_EDITMSG',
      \ $VIMRUNTIME .'/doc',
      \ 'bundle/.*/doc',
      \ '.vimgolf',
      \ ]

let g:startify_bookmarks = [
      \ '~/dotfiles/home/.vimrc',
      \ '~/dotfiles/home/.vim/plugins.vim',
      \ '~/dotfiles/home/.vim/vundle.vim',
      \ ]

let g:startify_custom_header = [
      \ '  __     ___            ',
      \ '  \ \   / (_)_ __ ___   ',
      \ '   \ \ / /| | ''_ ` _ \ ',
      \ '    \ V / | | | | | | | ',
      \ '     \_/  |_|_| |_| |_| ',
      \ '',
      \ '',
      \ ]
