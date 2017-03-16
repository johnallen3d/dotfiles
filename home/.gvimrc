" Use 14pt Menlo
" set guifont=Menlo:h14
" set guifont=Inconsolata:h15
" set guifont=Bitstream\ Vera\ Sans\ Mono\ for\ Powerline:h14
" set guifont=Menlo\ for\ Powerline:h14
" set guifont=Droid\ Sans\ Mono:h14
set guifont=Droid\ Sans\ Mono\ Dotted\ for\ Powerline:h13
" set guifont=DejaVu\ Sans\ Mono\ Bold:h14
" set guifont=TheSansMonoCd-W7Bold:h15

" Better line-height
set linespace=2

" hides toolbar
set guioptions=egmrt

" use bash in mvim
set shell=bash

set transparency=1
" colorscheme made_of_code
" colorscheme monokai
" colorscheme Tomorrow-Night
" colorscheme solarized

" hides scroll bars
set guioptions=aAce

" set the color of 80 character indicator
highlight ColorColumn guibg=Gray14

" better trailing whitespace hightlighting
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd ColorScheme * highlight ExtraWhitespace guibg=red ctermbg=darkred
