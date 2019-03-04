" " Ale
let g:ale_linters = {
\   'java': [],
\}

let g:ale_sign_column_always = 1
let g:ale_sign_error='>'
let g:ale_sign_warning='!'
" let g:ale_sign_error='⁉️'
" let g:ale_sign_warning='🔶'
let g:ale_statusline_format=['%d error(s)', '%d warning(s)', '']

" let g:ale_sign_error = '✖'
" let g:ale_sign_warning = '⚠'
" let g:ale_statusline_format = ['✖ %d', '⚠  %d', '⬥ ok']

let g:ale_sign_column_always = 1

" mapping shortcuts
nmap <silent> <leader>aj :ALENextWrap<cr>
nmap <silent> <leader>ak :ALEPreviousWrap<cr>
