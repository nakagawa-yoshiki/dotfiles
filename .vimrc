set nocompatible

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
set ambiwidth=double

syntax on

hi Search ctermbg=lightgreen
hi ColorColumn ctermbg=darkblue

autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

"" plugins: .vim/pack/git-plugins/start/
"ale
"editorconfig-vim
"emmet-vim
"neocomplete.vim
"vim-gitgutter
"vim-quickrun

" ale
let g:ale_fixers = {
\   'javascript': ['eslint'],
\}

let g:neocomplete#enable_at_startup = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

"quickrun
let g:quickrun_config={'_': {'split': 'vsplit', 'hook/time/enable': '1'}}
let g:quickrun_config['coffee'] = {'command' : 'coffee', 'exec' : ['%c -cbp %s']}
set splitbelow
set splitright
