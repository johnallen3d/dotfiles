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
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-commentary.git'
Bundle 'tpope/vim-repeat'
Bundle 'mileszs/ack.vim'
Bundle 'godlygeek/tabular'
Bundle 'tpope/vim-surround'
" Bundle 'mrtazz/simplenote.vim'
Bundle 'swaroopch/vim-markdown-preview'
" Bundle 'sunaku/vim-ruby-minitest'
" Bundle 'klen/vim-taglist-plus'
Bundle 'benmills/vimux'
Bundle 'pgr0ss/vimux-ruby-test'
" Bundle 'Valloric/YouCompleteMe'
" Bundle 'airblade/vim-gitgutter'
" Bundle 'wikitopian/hardmode'
Bundle 'nelstrom/vim-visual-star-search'
" Bundle 'tpope/vim-dispatch'
" Bundle 'sjl/gundo.vim'
" tab completion
Bundle 'ervandew/supertab'
" use % to move from start/end of blocks
Bundle 'vim-scripts/ruby-matchit'
Bundle 'rizzatti/funcoo.vim'
Bundle 'rizzatti/dash.vim'
Bundle 'slim-template/vim-slim'
Bundle 'ngmy/vim-rubocop'
Bundle 'Shougo/unite.vim'

" syntaxes
Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-haml'
Bundle 'vim-ruby/vim-ruby'
Bundle 'nono/vim-handlebars'
Bundle 'tpope/vim-markdown'
Bundle 'groenewege/vim-less'
Bundle 'puppetlabs/puppet-syntax-vim'

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
