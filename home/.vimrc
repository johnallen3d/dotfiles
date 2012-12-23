set nocompatible  " Use Vim settings, rather then Vi settings

" Vundle
source ~/.vim/vundle.vim

set nobackup
set nowritebackup
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set showmode      " show the current mode
set laststatus=2  " Always display the status line
set nowrap        " set nowrap
set t_ti= t_te=   " Prevent Vim from clobbering the scrollback buffer.
set scrolloff=3

set colorcolumn=80
set hlsearch      " Highlight searches
set incsearch     " do incremental searching
set ignorecase    " Ignore case of searches
set smartcase

set cursorline
set title
set number        " show line numbers
" set rnu           " relative line numbers
set clipboard=unnamed " use system clipboard by default!

set shell=sh

syntax on
syntax enable

" colors
set t_Co=256
" set background=dark
colorscheme molokai
" colorscheme monokai
" colorscheme solarized

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab

" Scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Display extra whitespace etc.
set list                          " Show invisible characters

set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen

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

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" <,> is the leader character
let mapleader = ","

" No Help, please
nmap <F1> <Esc>

" Pane navigation
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>

" Testing shortcut
nmap <S-t> :w <bar> :!rake test<cr>

" Use Ack instead of Grep when available
if executable("ack")
  set grepprg=ack\ -H\ --nogroup\ --nocolor
endif

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
" PANE SIZES
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Make the current window big, but leave others context
set winwidth=84
" We have to have a winheight bigger than we want to set winminheight. But if
" we set winheight to be huge before winminheight, the winminheight set will
" fail.
set winheight=5
set winminheight=5
set winheight=999

source ~/.vim/plugins.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TEXT EXPANSION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
imap clog console.log? 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" storing credentials here
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source ~/.simplenoterc

