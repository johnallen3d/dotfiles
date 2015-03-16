" Some Linux distributions set filetype in /etc/vimrc.
" Clear filetype flags before changing runtimepath to force Vim to reload them.
filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on
syntax on
autocmd FileType go setlocal shiftwidth=2 tabstop=2 noexpandtab
autocmd FileType go autocmd BufWritePre <buffer> Fmt