"" Plugins

" " CntrlP
map <Leader>t :CtrlP<CR>
let g:ctrlp_custom_ignore = 'tmp$\|public/assets$\|tags$\|\.ds_store$\|\.swp$\|.png\|node_modules\|bower_components\|dist'
let g:ctrlp_dotfiles = 0
nnoremap <leader>f :CtrlPTag<cr>

" " tabular-vim
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>
nmap <Leader>a=> :Tabularize /=><CR>
vmap <Leader>a=> :Tabularize /=><CR>

" " sql.vim
let g:sql_type_default = 'pgsql'

" " ultisnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" " RunCommand : https://coderwall.com/p/d1pa0a
function! SendToTerminal(args)
  execute ":silent !run_command '" . a:args . "'"
endfunction

nmap <silent> <Leader>r :call SendToTerminal('clear && rake') <CR>

" " Larger configurations
if filereadable(glob('~/.vim/plugins.startify.vim'))
  source ~/.vim/plugins.startify.vim
endif

if filereadable(glob('~/.vim/plugins.lightline.vim'))
  source ~/.vim/plugins.lightline.vim
endif
