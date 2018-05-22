"" Plugins

if executable('rg')
  " Use ripgrep over grep
  set grepprg=rg\ --vimgrep
endif

if has('nvim')
  " " Fzf
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)

  map <Leader>p :Files<CR>
  map <c-p> :Files<CR>
else
  " " CntrlP
  map <Leader>p :CtrlP<CR>
  map <c-p> :CtrlP<CR>
  let g:ctrlp_custom_ignore = 'tmp$\|public/assets$\|tags$\|\.ds_store$\|\.swp$\|.png\|node_modules\|bower_components\|dist'
  " let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
  let g:ctrlp_user_command = 'rg --files  %s'
  let g:ctrlp_show_hidden = 1
  let g:ctrlp_working_path_mode = 'rw'
  nnoremap <leader>f :CtrlPTag<cr>
endif

" " vim-grepper
nnoremap <leader>g :Grepper -tool rg<cr>

" " QFEnter
let g:qfenter_keymap = {}
let g:qfenter_keymap.open = ['o']
let g:qfenter_keymap.vopen = ['v']
let g:qfenter_keymap.hopen = ['h']
let g:qfenter_keymap.topen = ['t']

" " tabular-vim
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize/\(:.*\)\@<!:\zs /l0<CR>
vmap <Leader>a: :Tabularize/\(:.*\)\@<!:\zs /l0<CR>
nmap <Leader>a=> :Tabularize /=><CR>
vmap <Leader>a=> :Tabularize /=><CR>

" " vim-dirvish
augroup dirvish_config
  autocmd!
  autocmd FileType dirvish silent! unmap <buffer> <C-p>
augroup END

let g:dirvish_mode = ':sort ,^.*[\/],'

" " tpope/vim-commentary
" bring back deprecated shortcuts (muscle memory)
xmap \\  <Plug>Commentary<CR>
nmap \\  <CR><Plug>Commentary
nmap \\\ <Plug>CommentaryLine<CR>
nmap \\u <Plug>CommentaryUndo<CR>

" " vim-sandwich
" use vim-surround mappings (muscle memory)
runtime macros/sandwich/keymap/surround.vim

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
let g:vimwiki_list = [{'path': '~/Dropbox/Notes/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
map <Leader>c <Plug>VimwikiToggleListItem

" " vim-ruby
" https://github.com/vim-ruby/vim-ruby/blob/84afb552189060d1dae2d3154ba88454ee14fcda/doc/vim-ruby.txt#L117-L140
let g:ruby_indent_block_style = 'do'
" https://github.com/vim-ruby/vim-ruby/blob/84afb552189060d1dae2d3154ba88454ee14fcda/doc/vim-ruby.txt#L143-L164
let g:ruby_indent_assignment_style = 'variable'
