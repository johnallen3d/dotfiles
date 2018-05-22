command! PackUpdate call minpac#update()
command! PackClean  call minpac#clean()

packadd minpac

if !exists('*minpac#init')
  finish
endif

call minpac#init({'verbose': 0})

" minpac must have {'type': 'opt'} so that it can be loaded with `packadd`.
call minpac#add('k-takata/minpac', {'type': 'opt'})

" general
call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-endwise')
call minpac#add('tpope/vim-commentary')
call minpac#add('mhinz/vim-grepper')
call minpac#add('godlygeek/tabular')
call minpac#add('machakann/vim-sandwich')
call minpac#add('ludovicchabant/vim-gutentags')
call minpac#add('pbrisbin/vim-mkdir')
call minpac#add('bruno-/vim-husk')
call minpac#add('Yggdroot/indentLine')
call minpac#add('yssl/QFEnter')
call minpac#add('justinmk/vim-dirvish')

" frameworks
call minpac#add('vimwiki/vimwiki', {'type': 'opt'})

" syntax/lint
call minpac#add('w0rp/ale')
call minpac#add('pangloss/vim-javascript')
call minpac#add('kchmck/vim-coffee-script')
call minpac#add('tpope/vim-haml')
call minpac#add('vim-ruby/vim-ruby')
call minpac#add('nono/vim-handlebars')
call minpac#add('tpope/vim-markdown')
call minpac#add('groenewege/vim-less')
call minpac#add('exu/pgsql.vim')
call minpac#add('jnwhiteh/vim-golang')
call minpac#add('slim-template/vim-slim')
call minpac#add('heartsentwined/vim-emblem')
call minpac#add('avakhov/vim-yaml')
call minpac#add('ekalinin/Dockerfile.vim')
call minpac#add('derekwyatt/vim-scala')
call minpac#add('mxw/vim-jsx')
call minpac#add('hashivim/vim-terraform', {'type': 'opt'})
call minpac#add('rudes/vim-java', {'type': 'opt'})

" colors
call minpac#add('chriskempson/base16-vim')
call minpac#add('joshdick/onedark.vim')
call minpac#add('arcticicestudio/nord-vim')

" Plugins for either Vim8 or NeoVim
if has('nvim')
  call minpac#add('junegunn/fzf')
  call minpac#add('junegunn/fzf.vim')
  call minpac#add('machakann/vim-highlightedyank')
else
  call minpac#add('ctrlpvim/ctrlp.vim')
endif

" Load the plugins right now. (optional)
packloadall
