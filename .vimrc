set nocompatible

syntax on
set number
set tabstop=2
set expandtab
set autoindent
set ignorecase
set hlsearch
set cursorline

" Vundle
filetype off
set rtp+=~/.vim/vundle/
call vundle#rc()
Bundle 'thinca/vim-quickrun'
Bundle 'Shougo/vimproc'
Bundle 'scrooloose/syntastic'
Bundle 'gtags.vim'
filetype plugin indent on


"quickrun
let g:quickrun_config={'*': {'split': 'vsplit'}}
set splitbelow
set splitright

"Gtags
map <C-j> :GtagsCursor<CR>
map <C-i> :Gtags -f %<CR>
map <C-n> :cn<CR>
map <C-p> :cp<CR>
map <C-k> <C-o>

function InsertTabWrapper()
    if pumvisible()
        return "\<c-n>"
    endif
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k\|<\|/'
        return "\<tab>"
    elseif exists('&omnifunc') && &omnifunc == ''
        return "\<c-n>"
    else
        return "\<c-x>\<c-o>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>

