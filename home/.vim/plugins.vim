"" Plugins

" " PowerLine
let g:Powerline_symbols = 'fancy'
" let g:Powerline_theme='skwp'
" let g:Powerline_colorscheme='skwp'

" " CntrlP
map <Leader>t :CtrlP<CR>
let g:ctrlp_custom_ignore = 'tmp$\|public/assets$\|tags$\|\.ds_store$\|\.swp$\|.png\|node_modules\|build'
let g:ctrlp_dotfiles = 0
nnoremap <leader>f :CtrlPTag<cr>

" " " Solarized
" set background=dark
" let g:solarized_termtrans=1
" let g:solarized_termcolors=256
" let g:solarized_contrast="high"
" let g:solarized_visibility="high"
" colorscheme solarized

" " vim-ruby-minitest
set completefunc=syntaxcomplete#Complete

" " tabular-vim
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>
nmap <Leader>a=> :Tabularize /=><CR>
vmap <Leader>a=> :Tabularize /=><CR>

" " dash.vim
nmap <silent> <leader>d <Plug>DashSearch

" " The Silver Searcher
let g:ackprg = 'ag --nogroup --nocolor --column'

" " Vimux
let g:VimuxUseNearestPane = 1

" " vim-ruby-xmpfilter
map <F4> <Plug>(xmpfilter-mark)
map <F5> <Plug>(xmpfilter-run)

" " sql.vim
let g:sql_type_default = 'pgsql'

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
      \ '  __     ___             _____ _____ ',
      \ '  \ \   / (_)_ __ ___   |___  |___ / ',
      \ '   \ \ / /| | ''_ ` _ \     / /  |_ \ ',
      \ '    \ V / | | | | | | |   / /_ ___) |',
      \ '     \_/  |_|_| |_| |_|  /_/(_)____/ ',
      \ '',
      \ '',
      \ ]




" " Unite
" fuzzy and recursive file search
" call unite#filters#matcher_default#use(['matcher_fuzzy'])
" nnoremap <leader>t :<C-u>Unite -start-insert file_rec<CR>
" " search yank history
" let g:unite_source_history_yank_enable = 1
" nnoremap <leader>y :<C-u>Unite history/yank<CR>

" let g:unite_data_directory='~/.vim/backups/unite'
" let g:unite_enable_start_insert=1
" let g:unite_source_history_yank_enable=1
" let g:unite_source_rec_max_cache_files=5000
" let g:unite_prompt='» '

" if executable('ag')
"   let g:unite_source_grep_command='ag'
"   let g:unite_source_grep_default_opts='--nocolor --nogroup --hidden'
"   let g:unite_source_grep_recursive_opt=''
" elseif executable('ack')
"   let g:unite_source_grep_command='ack'
"   let g:unite_source_grep_default_opts='--no-heading --no-color -a'
"   let g:unite_source_grep_recursive_opt=''
" endif







" map <silent> <Leader>rl :wa <CR> :VimuxRunLastCommand<CR>
" map <silent> <Leader>r :call RunVimTmuxCommand("clear && zeus rspec spec")<CR>
" map <silent> <Leader>l :VimuxRunLastCommand<CR>
" map <silent> <Leader>vp :VimuxPromptCommand<CR>
" vmap <silent> <Leader>vs "vy :call VimuxRunCommand(@v)<CR>
" nmap <silent> <Leader>vs vip<Leader>vs<CR>

" " RunCommand : https://coderwall.com/p/d1pa0a
function! SendToTerminal(args)
  execute ":silent !run_command '" . a:args . "'"
endfunction

function! ClearTerminal()
  call SendToTerminal("clear")
endfunction

function! RSpec()
  call ClearTerminal()
  if exists("s:current_test")
    call SendToTerminal("rspec -fd " . s:current_test)
  endif
endfunction

function! RunCurrentTest()
  let s:current_test = expand('%:p')
  call RSpec()
endfunction

function! RunCurrentLineInTest()
  let s:current_test = expand('%:p') . ":" . line('.')
  call RSpec()
endfunction

function! RunLastCommand()
  call RSpec()
endfunction

nmap <silent> <Leader>r :call SendToTerminal('clear && bin/rspec spec') <CR>
" nmap <Leader>t :call RunCurrentTest()<CR>
" nmap <Leader>l :call RunCurrentLineInTest()<CR>
" nmap <Leader>rr :call RunLastCommand()<CR>
