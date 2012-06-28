set nocompatible

syntax on
set number
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set ignorecase
set hlsearch
set cursorline

" Vundle
filetype off
set rtp+=~/.vim/vundle/
call vundle#rc()
Bundle 'thinca/vim-quickrun'
Bundle 'scrooloose/syntastic'
Bundle 'Shougo/vimshell'
Bundle 'Shougo/vimproc'
Bundle 'Shougo/neocomplcache'
Bundle 'mattn/zencoding-vim'
Bundle 'gtags.vim'
filetype plugin indent on

autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

"quickrun
let g:quickrun_config={'_': {'split': 'vsplit', 'hook/time/enable': '1'}}
set splitbelow
set splitright

"Gtags
map <C-j> :GtagsCursor<CR>
map <C-i> :Gtags -f %<CR>
map <C-n> :cn<CR>
map <C-p> :cp<CR>
map <C-k> <C-o>

"neocomplcache
let g:neocomplcache_enable_at_startup = 1
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

