set nocompatible

syntax on

set number
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set cursorline
set modelines=5
set modeline

set ignorecase
set hlsearch
set smartcase
set fileformats="unix,dos,mac"

au BufNewFile,BufRead *.ejs setf html


"Vundle
filetype off
set rtp+=~/.vim/vundle/
call vundle#rc()

Bundle 'thinca/vim-localrc'
Bundle 'thinca/vim-quickrun'
Bundle 'scrooloose/syntastic'
Bundle 'Shougo/vimproc'
Bundle 'Shougo/neocomplcache'
Bundle 'mattn/zencoding-vim'
Bundle 'jiangmiao/simple-javascript-indenter'
Bundle 'airblade/vim-gitgutter'

filetype plugin indent on

autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

if filereadable(expand('~/.vimrc_private'))
  source ~/.vimrc_private
endif

" vim-localrc
let g:localrc_filename = '.lvimrc'

"simple-javascript-indenter
let g:localvimrc_ask=0

let g:SimpleJsIndenter_BriefMode=1

"syntastic
let syntastic_mode_map = { 'passive_filetypes': ['html'] }
let g:syntastic_javascript_checkers=['jshint']
let g:syntastic_php_checkers=['php', 'phpcs', 'phpmd']
let g:syntastic_php_phpcs_args='--report=csv --standard=PSR2'

"quickrun
let g:quickrun_config={'_': {'split': 'vsplit', 'hook/time/enable': '1'}}
let g:quickrun_config['coffee'] = {'command' : 'coffee', 'exec' : ['%c -cbp %s']}
set splitbelow
set splitright

"neocomplcache
let g:neocomplcache_enable_at_startup = 1
inoremap <expr><Up> pumvisible() ? neocomplcache#close_popup()."\<Up>" : "\<Up>"
inoremap <expr><Down> pumvisible() ? neocomplcache#close_popup()."\<Down>" : "\<Down>"

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

