set nocompatible        " Use Vim settings, rather then Vi settings

" Vundle
source ~/.vim/vundle.vim

" MyAutoCmd : an augroup for my autocmd
augroup MyAutoCmd
  autocmd!
augroup END

set nobackup            " do not make backup before saving
set nowritebackup       " do not write backup before saving
set history=50          " remember 50 commands
set ruler               " show the cursor position all the time
set showcmd             " display incomplete commands
set showmode            " show the current mode
set laststatus=2        " Always display the status line
set nowrap              " set nowrap
set t_ti= t_te=         " Prevent Vim from clobbering the scrollback buffer.
set scrolloff=3         " keep at least three lines visible above/below cursor

set colorcolumn=80      " show a marker at 80th character
highlight ColorColumn ctermbg=DarkGray
set hlsearch            " Highlight searches
set incsearch           " do incremental searching
set ignorecase          " searches are case insensitive...
set smartcase           " ... unless they contain at least one capital letter
set gdefault            " have :s///g flag by default on

set cursorline          " highlight the line the cursor is on
set synmaxcol=800       " don't try to highlight long lines
" set title             " not really sure what this does
set number              " show line numbers
set clipboard=unnamed   " use system clipboard by default!
set shell=/bin/zsh      " use zsh for shell (:sh)

" Allow backgrounding buffers without writing them, and remember marks/undo
" for backgrounded buffers
set hidden

" Auto-reload buffers when file changed on disk
set autoread

" Disable swap files; systems don't crash that often these days
set updatecount=0

syntax on
syntax enable

" colors
set t_Co=16 "256
set background=dark
colorscheme dracula " base16-atelierforest base16-ocean jellybeans base16-monokai lavalamp solarized hybrid Tomorrow-Night

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab

" Scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" make the tab key match bracket pairs
nnoremap <tab> %
vnoremap <tab> %

" use the dot command on visual selections
vnoremap . :norm.<CR>

" Tab bar line
set showtabline=2                 " always show tab bar

" Display extra whitespace etc.
set list listchars=tab:▸\ ,trail:.

"It's easier to press Space than / for searching:
nmap <Space> /
nmap <C-Space> ?
nmap </> /\v

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Disable error bells
set noerrorbells
set visualbell

" Spell check and automatic wrapping at 72 columns for commit messages
autocmd Filetype gitcommit setlocal spell textwidth=72

" force markdown format for all .md files http://goo.gl/2xSiBU
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.

silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile

" save on losing focus
au FocusLost * :wa

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" <,> is the leader character
let mapleader = ","

" No Help, please
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Pane navigation
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>

" select last paste in visual mode
nnoremap <expr> gb '`[' . strpart(getregtype(), 0, 1) . '`]'

"Visual mode blockwise indentEdit
vmap > >gv
vmap < <gv

" Strip trailing whitespace (,ss)
function! StripWhitespace()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  :%s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction

noremap <leader>ss :call StripWhitespace()<CR>

" Quickly hide search highlighting
" nmap <silent> <leader>n :silent :nohlsearch<CR>
:nnoremap <CR> :nohlsearch<cr>

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

" complete settings
set complete=.,t
" (only complete to the longest unambiguous match, and show a menu)
set completeopt=longest,menu
set wildmode=list:longest,list:full
" set complete=.,b,u,]
" set wildmode=longest,list:longest
" set completeopt=menu,preview

" add gems.tags to ctags list
set tags+=gems.tags

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SELECT ALL
" Hit Ctrl+A to select all in current buffer
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <C-a> ggVG

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MARK DOWN
" Hit leader+m to preview markdown file in Marked
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:nnoremap <leader>m :silent !open -a Marked.app '%:p'<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

filetype plugin indent on

augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
  autocmd FileType asciidoc setlocal textwidth=78
  autocmd FileType asciidoc setlocal spell

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>n :call RenameFile()<cr>

map <leader>gr :topleft :split config/routes.rb<cr>
map <leader>gg :topleft 100 :split Gemfile<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TEXT EXPANSION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
imap clog console.log?
imap <C-L> <SPACE>=><SPACE>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GO SYNTAX
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Some Linux distributions set filetype in /etc/vimrc.
" Clear filetype flags before changing runtimepath to force Vim to reload them.
filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on
syntax on
autocmd FileType go setlocal shiftwidth=2 tabstop=2 noexpandtab
autocmd FileType go autocmd BufWritePre <buffer> Fmt

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LOAD PLUGIN SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source ~/.vim/plugins.vim
