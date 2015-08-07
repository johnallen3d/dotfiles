call plug#begin('~/.vim/plugged')

" helpers
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'itchyny/lightline.vim'
" Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'rking/ag.vim'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-surround'
Plug 'tommcdo/vim-exchange'
" Plug 'mrtazz/simplenote.vim'
" use % to move from start/end of blocks
" Plug 'vim-scripts/ruby-matchit'
" Plug 'mtth/scratch.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'pbrisbin/vim-mkdir'
Plug 'bruno-/vim-husk'
Plug 'unblevable/quick-scope'

" tab completion
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'

" syntaxes
Plug 'scrooloose/syntastic'
Plug 'kchmck/vim-coffee-script'
Plug 'tpope/vim-haml'
Plug 'vim-ruby/vim-ruby'
Plug 'nono/vim-handlebars'
Plug 'tpope/vim-markdown'
Plug 'groenewege/vim-less'
Plug 'puppetlabs/puppet-syntax-vim'
Plug 'exu/pgsql.vim'
Plug 'jnwhiteh/vim-golang'
Plug 'slim-template/vim-slim'
Plug 'heartsentwined/vim-emblem'
Plug 'avakhov/vim-yaml'
Plug 'ekalinin/Dockerfile.vim'
Plug 'dag/vim-fish'
Plug 'derekwyatt/vim-scala'

" colors
" make colors just work in terminal vim
" Plug 'vim-scripts/CSApprox'
" Plug 'flazz/vim-colorschemes'
Plug 'zachphillips/vim-colorschemes'
Plug 'chriskempson/base16-vim'
" Plug 'altercation/vim-colors-solarized'
" Plug 'vim-scripts/colorsupport.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'zenorocha/dracula-theme', {'rtp': 'vim/'}
Plug 'bruschill/madeofcode'
Plug 'jdkanani/vim-material-theme'

call plug#end()
