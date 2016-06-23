"" Plugins

" " CntrlP
" map <Leader>t :CtrlP<CR>
" let g:ctrlp_custom_ignore = 'tmp$\|public/assets$\|tags$\|\.ds_store$\|\.swp$\|.png\|node_modules\|bower_components\|dist'
" let g:ctrlp_dotfiles = 0
" nnoremap <leader>f :CtrlPTag<cr>

" " FZF
map <Leader>t :FZF<CR>

" " tabular-vim
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize/\(:.*\)\@<!:\zs /l0<CR>
vmap <Leader>a: :Tabularize/\(:.*\)\@<!:\zs /l0<CR>
nmap <Leader>a=> :Tabularize /=><CR>
vmap <Leader>a=> :Tabularize /=><CR>
" nmap <Leader>at :Tabularize/|<CR>
" vmap <Leader>at :Tabularize/|<CR>

" " sql.vim
let g:sql_type_default = 'pgsql'

" " tpope/vim-commentary
" bring back deprecated shortcuts (muscle memory)
xmap \\  <Plug>Commentary<CR>
nmap \\  <CR><Plug>Commentary
nmap \\\ <Plug>CommentaryLine<CR>
nmap \\u <Plug>CommentaryUndo<CR>

" " neomake/neomake
" run neomake with rubocop for all .rb files on save
au BufWritePost *.rb Neomake rubocop

" " " vimfiler
" let g:vimfiler_as_default_explorer = 1

" " Larger configurations
if filereadable(glob('~/.config/nvim/plugins.lightline.vim'))
  source ~/.config/nvim/plugins.lightline.vim
endif
