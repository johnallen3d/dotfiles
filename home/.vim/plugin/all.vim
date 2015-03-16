"" Plugins

" " CntrlP
map <Leader>t :CtrlP<CR>
let g:ctrlp_custom_ignore = 'tmp$\|public/assets$\|tags$\|\.ds_store$\|\.swp$\|.png\|node_modules\|bower_components\|dist'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_dotfiles = 0
nnoremap <leader>f :CtrlPTag<cr>

" " tabular-vim
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize/\(:.*\)\@<!:\zs /l0<CR>
vmap <Leader>a: :Tabularize/\(:.*\)\@<!:\zs /l0<CR>
nmap <Leader>a=> :Tabularize /=><CR>
vmap <Leader>a=> :Tabularize /=><CR>

" " sql.vim
let g:sql_type_default = 'pgsql'

" " RunCommand : https://coderwall.com/p/d1pa0a
function! SendToTerminal(args)
  execute ":silent !run_command '" . a:args . "'"
endfunction

nmap <silent> <Leader>r :call SendToTerminal('clear && bin/rake') <CR>
