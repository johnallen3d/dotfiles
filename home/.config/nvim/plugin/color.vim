" function CheckColors()
"   let g:base16colorspace=256

"   let s:config_file = expand('~/.base16')

"   if filereadable(s:config_file)
"     let s:config = readfile(s:config_file, '', 2)

"     if s:config[1] =~# '^dark\|light$'
"       execute 'set background=' . s:config[1]
"     else
"       echoerr 'Bad background ' . s:config[1] . ' in ' . s:config_file
"     endif

"     if filereadable(expand('~/.config/nvim/plugged/base16-vim/colors/base16-' . s:config[0] . '.vim'))
"       execute 'color base16-' . s:config[0]
"     else
"       echoerr 'Bad scheme ' . s:config[0] . ' in ' . s:config_file
"     endif
"   else " default
"     set background=dark
"     color base16-ocean
"   endif

"   " execute 'highlight Comment ' . pinnacle#italicize('Comment')

"   " Allow for overrides:
"   " doautocmd ColorScheme
" endfunction

" if v:progname !=# 'vi'
"   " if has('autocmd')
"   "   augroup WincentAutocolor
"   "     autocmd!
"   "     autocmd FocusGained * call CheckColors()
"   "   augroup END
"   " endif

"   call CheckColors()
" endif
