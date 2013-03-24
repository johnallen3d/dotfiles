"" Plugins

" " PowerLine
let g:Powerline_symbols = 'fancy'
" let g:Powerline_theme='skwp'
" let g:Powerline_colorscheme='skwp'

" " CntrlP
map <Leader>t :CtrlP<CR>
let g:ctrlp_custom_ignore = 'tmp$\|public/assets$\|tags$\|\.ds_store$\|\.swp$'
let g:ctrlp_dotfiles = 0

" " Solarized
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

" " Vimux
let g:VimuxUseNearestPane = 1

" map <silent> <Leader>rl :wa <CR> :VimuxRunLastCommand<CR>
map <silent> <Leader>r :call RunVimTmuxCommand("clear && zeus rspec spec")<CR>
map <silent> <Leader>l :VimuxRunLastCommand<CR>
map <silent> <Leader>vp :VimuxPromptCommand<CR>
vmap <silent> <Leader>vs "vy :call VimuxRunCommand(@v)<CR>
nmap <silent> <Leader>vs vip<Leader>vs<CR>

" " The Silver Searcher
let g:ackprg = 'ag --nogroup --nocolor --column'

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

" nmap <Leader>t :call RunCurrentTest()<CR>
nmap <Leader>l :call RunCurrentLineInTest()<CR>
nmap <Leader>rr :call RunLastCommand()<CR>
