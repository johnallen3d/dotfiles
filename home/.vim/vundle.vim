filetype off      " required for vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'

" helpers
Plugin 'tpope/vim-fugitive'
Plugin 'ctrlp.vim'
Plugin 'itchyny/lightline.vim'
" Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-commentary.git'
Plugin 'tpope/vim-repeat'
Plugin 'rking/ag.vim'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-surround'
Plugin 'tommcdo/vim-exchange'
" Plugin 'mrtazz/simplenote.vim'
" use % to move from start/end of blocks
Plugin 'vim-scripts/ruby-matchit'
Plugin 'mhinz/vim-startify'

" snippets
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" tab completion
Plugin 'Valloric/YouCompleteMe'

" syntaxes
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-haml'
Plugin 'vim-ruby/vim-ruby'
Plugin 'nono/vim-handlebars'
Plugin 'tpope/vim-markdown'
Plugin 'groenewege/vim-less'
Plugin 'puppetlabs/puppet-syntax-vim'
Plugin 'exu/pgsql.vim'
Plugin 'jnwhiteh/vim-golang'
Plugin 'slim-template/vim-slim'
Plugin 'heartsentwined/vim-emblem'
Plugin 'avakhov/vim-yaml'
Plugin 'ekalinin/Dockerfile.vim'

" colors
" make colors just work in terminal vim
" Plugin 'vim-scripts/CSApprox'
" Plugin 'flazz/vim-colorschemes'
" Plugin 'zachphillips/vim-colorschemes'
" Plugin 'altercation/vim-colors-solarized'
" Plugin 'vim-scripts/colorsupport.vim'
Plugin 'nathanaelkane/vim-indent-guides'
