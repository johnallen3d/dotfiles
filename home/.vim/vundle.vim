call plug#begin('~/.vim/plugged')

" let Vundle manage Vundle, required
Plug 'gmarik/vundle'

" helpers
Plug 'tpope/vim-fugitive'
Plug 'ctrlp.vim'
" Plug 'itchyny/lightline.vim'
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
Plug 'vim-scripts/ruby-matchit'

" Unite
Plug 'Shougo/unite.vim'
Plug 'Shougo/unite-outline'
Plug 'Shougo/unite-help'
Plug 'Shougo/unite-session'
Plug 'Shougo/neomru.vim'
Plug 'thinca/vim-unite-history'

" For file browsing, etc in unite, we need to utilize vimproc
" After this is installed through bundle, we also need to run
" make to finish setting it up
Plug 'Shougo/vimproc.vim'

" snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" tab completion
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }

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

" colors
" make colors just work in terminal vim
" Plug 'vim-scripts/CSApprox'
" Plug 'flazz/vim-colorschemes'
Plug 'zachphillips/vim-colorschemes'
Plug 'chriskempson/base16-vim'
" Plug 'altercation/vim-colors-solarized'
" Plug 'vim-scripts/colorsupport.vim'
Plug 'nathanaelkane/vim-indent-guides'

call plug#end()

