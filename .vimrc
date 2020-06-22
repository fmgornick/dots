""""""""""""""""
""" DEFAULTS """
""""""""""""""""
syntax on

filetype off
filetype plugin indent on

set noerrorbells
set showcmd

"" line numbers + color column
set relativenumber
set number
set tw=79
set nowrap
set fo-=t
set colorcolumn=80

"" tab indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
set smartindent
set backspace=indent,eol,start

"" better word search
set hlsearch
set incsearch
set ignorecase
set smartcase

"" stop swap files
set nobackup
set nowritebackup
set noswapfile



"""""""""""""""
""" PLUGINS """
"""""""""""""""

call plug#begin('~/.vim/plugged')

"" colorscheme
Plug 'morhetz/gruvbox'

"" fuzzy file finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"" coc autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"" language pack
Plug 'sheerun/vim-polyglot'

call plug#end()

colorscheme gruvbox
set background=dark



"""""""""""""""""""
""" KEYBINDINGS """
"""""""""""""""""""

"" toggle splits with vim keys
map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l

"" brace completion
inoremap {<TAB> {}<ESC>i<CR><ESC>O

"" coc tab completion
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<Tab>" :
    \ coc#refresh()

"""""""""""""""""""""""""
""" COMPILE SHORTCUTS """
"""""""""""""""""""""""""

let extension = expand("%:e")

"" compile and run code writtent in C
if extension  == "c"
    map  <F5> :w <CR> :!clear && gcc % -o %< && ./%<  <CR>

"" compile and run code writtent in C++
elseif extension  == "cpp"
    map  <F5> :w <CR> :!clear && g++ % -o %< && ./%<  <CR>

"" compile and run code writtent in Java
elseif extension == "java"
    map  <F5> :w <CR> :!clear && javac % && java %<  <CR>

"" compile and run code writtent in Python
elseif extension == "py"
    map  <F5> :w <CR> :!python3 %  <CR>

endif
