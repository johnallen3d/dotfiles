filetype off      " required for vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle, required
Bundle 'gmarik/vundle'

" helpers
Bundle 'tpope/vim-fugitive'
Bundle 'ctrlp.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'Lokaltog/vim-easymotion'
" Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-commentary.git'
Bundle 'tpope/vim-repeat'
Bundle 'mileszs/ack.vim'
Bundle 'godlygeek/tabular'
Bundle 'tpope/vim-surround'
" Bundle 'mrtazz/simplenote.vim'
Bundle 'benmills/vimux'
Bundle 'pgr0ss/vimux-ruby-test'
Bundle 'nelstrom/vim-visual-star-search'
" use % to move from start/end of blocks
Bundle 'vim-scripts/ruby-matchit'
Bundle 'rizzatti/funcoo.vim'
Bundle 'rizzatti/dash.vim'
Bundle 'ngmy/vim-rubocop'
Bundle 't9md/vim-ruby-xmpfilter'
Bundle 'thoughtbot/vim-rspec'
Bundle 'mhinz/vim-startify'
Bundle 'majutsushi/tagbar'

" tab completion
" Bundle 'ervandew/supertab'
" Bundle 'Valloric/YouCompleteMe'

" syntaxes
Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-haml'
Bundle 'vim-ruby/vim-ruby'
Bundle 'nono/vim-handlebars'
Bundle 'tpope/vim-markdown'
Bundle 'groenewege/vim-less'
Bundle 'puppetlabs/puppet-syntax-vim'
Bundle 'exu/pgsql.vim'
Bundle 'jnwhiteh/vim-golang'
Bundle 'slim-template/vim-slim'
Bundle 'avakhov/vim-yaml'

" colors
" make colors just work in terminal vim
" Bundle 'vim-scripts/CSApprox'
" Bundle 'flazz/vim-colorschemes'
Bundle 'zachphillips/vim-colorschemes'
Bundle 'altercation/vim-colors-solarized'
Bundle 'rickharris/vim-monokai'
" Bundle 'vim-scripts/colorsupport.vim'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'w0ng/vim-hybrid'
