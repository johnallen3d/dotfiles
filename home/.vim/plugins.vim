"" Plugins

" " PowerLine
let g:Powerline_symbols = 'fancy'
" let g:Powerline_theme='skwp'
" let g:Powerline_colorscheme='skwp'

" " CntrlP
map <Leader>t :CtrlP<CR>
let g:ctrlp_custom_ignore = 'tmp$\|public/assets$\|tags$\|\.ds_store$\|\.swp$'
let g:ctrlp_dotfiles = 0

" " slime.vim
let g:slime_target = "tmux"

" " vim-ruby-minitest
set completefunc=syntaxcomplete#Complete

" " tabular-vim
if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif

" " Vimux
let g:VimuxUseNearestPane = 1

map <silent> <Leader>rl :wa<CR> :VimuxRunLastCommand<CR>
map <silent> <Leader>vi :wa<CR> :VimuxInspectRunner<CR>
map <silent> <Leader>vk :wa<CR> :VimuxInterruptRunner<CR>
map <silent> <Leader>vx :wa<CR> :VimuxClosePanes<CR>
map <silent> <Leader>vp :VimuxPromptCommand<CR>
vmap <silent> <Leader>vs "vy :call VimuxRunCommand(@v)<CR>
nmap <silent> <Leader>vs vip<Leader>vs<CR>
