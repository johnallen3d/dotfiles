"" Plugins

" " CntrlP
map <Leader>t :CtrlP<CR>
let g:ctrlp_custom_ignore = 'tmp$\|public/assets$\|tags$\|\.ds_store$\|\.swp$\|.png\|node_modules\|bower_components\|dist'
" let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_user_command = 'rg --files  %s'
let g:ctrlp_show_hidden = 1
let g:ctrlp_working_path_mode = 'rw'
nnoremap <leader>f :CtrlPTag<cr>

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
endif

" " vim-grepper
nnoremap <leader>g :Grepper -tool rg<cr>

" " QFEnter
let g:qfenter_open_map = ['o']
let g:qfenter_vopen_map = ['v']

" " tabular-vim
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize/\(:.*\)\@<!:\zs /l0<CR>
vmap <Leader>a: :Tabularize/\(:.*\)\@<!:\zs /l0<CR>
nmap <Leader>a=> :Tabularize /=><CR>
vmap <Leader>a=> :Tabularize /=><CR>

" " quick-scope
" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" " sql.vim
let g:sql_type_default = 'pgsql'

" " tpope/vim-commentary
" bring back deprecated shortcuts (muscle memory)
xmap \\  <Plug>Commentary<CR>
nmap \\  <CR><Plug>Commentary
nmap \\\ <Plug>CommentaryLine<CR>
nmap \\u <Plug>CommentaryUndo<CR>

" " RunCommand : https://coderwall.com/p/d1pa0a
function! SendToTerminal(args)
  execute ":silent !run_command '" . a:args . "'"
endfunction

nmap <silent> <Leader>r :call SendToTerminal('clear && bin/rake') <CR>

" " tpope/vim-markdown
let g:markdown_fenced_languages = ['javascript', 'ruby', 'sh', 'yaml', 'javascript', 'html', 'vim', 'coffee', 'json', 'diff']

" " w0ng/vim-hybrid
let g:hybrid_custom_term_colors = 1

" vimwiki/vimwiki
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
map <Leader>c <Plug>VimwikiToggleListItem
