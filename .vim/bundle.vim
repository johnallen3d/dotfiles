command! PackUpdate call minpac#update()
command! PackClean  call minpac#clean()

packadd minpac

if !exists('*minpac#init')
  finish
endif

call minpac#init({'verbose': 0})

" minpac must have {'type': 'opt'} so that it can be loaded with `packadd`.
call minpac#add('k-takata/minpac', {'type': 'opt'})

" Add other plugins here.
" call minpac#add('
" helpers
call minpac#add('tpope/vim-fugitive')
" FZF doesn't play nice with MacVim :(
" call minpac#add('junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'
" })
" call minpac#add('junegunn/rainbow_parentheses.vim')
" call minpac#add('itchyny/lightline.vim')
" call minpac#add('tpope/vim-rails')
call minpac#add('tpope/vim-endwise')
" call minpac#add('tpope/vim-bundler')
call minpac#add('tpope/vim-commentary')
call minpac#add('tpope/vim-repeat')
" call minpac#add('rking/ag.vim')
call minpac#add('mhinz/vim-grepper')
call minpac#add('godlygeek/tabular')
call minpac#add('tpope/vim-surround')
" call minpac#add('tommcdo/vim-exchange')
call minpac#add('mrtazz/simplenote.vim')
" use % to move from start/end of blocks
" call minpac#add('vim-scripts/ruby-matchit')
" call minpac#add('mtth/scratch.vim')
call minpac#add('ludovicchabant/vim-gutentags')
call minpac#add('pbrisbin/vim-mkdir')
call minpac#add('bruno-/vim-husk')
" call minpac#add('unblevable/quick-scope')
call minpac#add('Yggdroot/indentLine')
call minpac#add('yssl/QFEnter')

call minpac#add('vimwiki/vimwiki', {'type': 'opt'})

" tab completion
" call minpac#add('Valloric/YouCompleteMe', { 'do': './install.sh' })
" call minpac#add('ervandew/supertab')

" syntaxes
" call minpac#add('scrooloose/syntastic')
" call minpac#add('neomake/neomake')
call minpac#add('w0rp/ale')
call minpac#add('pangloss/vim-javascript')
call minpac#add('kchmck/vim-coffee-script')
call minpac#add('tpope/vim-haml')
call minpac#add('vim-ruby/vim-ruby')
call minpac#add('nono/vim-handlebars')
call minpac#add('tpope/vim-markdown')
call minpac#add('groenewege/vim-less')
" call minpac#add('puppetlabs/puppet-syntax-vim')
call minpac#add('exu/pgsql.vim')
call minpac#add('jnwhiteh/vim-golang')
call minpac#add('slim-template/vim-slim')
call minpac#add('heartsentwined/vim-emblem')
call minpac#add('avakhov/vim-yaml')
call minpac#add('ekalinin/Dockerfile.vim')
" call minpac#add('dag/vim-fish')
call minpac#add('derekwyatt/vim-scala')
call minpac#add('mxw/vim-jsx')
" call minpac#add('rudes/vim-java')

" colors
call minpac#add('chriskempson/base16-vim')
call minpac#add('joshdick/onedark.vim')
call minpac#add('w0ng/vim-hybrid')
call minpac#add('jacoborus/tender')
call minpac#add('morhetz/gruvbox')

" Plugins for either Vim8 or NeoVim
if has('nvim')
  call minpac#add('junegunn/fzf')
  call minpac#add('junegunn/fzf.vim')
else
  call minpac#add('ctrlpvim/ctrlp.vim')
endif

" Load the plugins right now. (optional)
packloadall
