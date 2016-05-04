" Pathogen package management
execute pathogen#infect()

" Solarized colors
syntax enable
set background=dark
colorscheme solarized

" Custom python folding
source ~/.vim/folding.vim

" To recognize filetypes? 
:filetype on

" My preferred settings
set nowrap 
set number
set mouse=a
set splitright
set splitbelow
set ls=2
set tabstop=2
set nrformats=hex
set ignorecase
set smartcase
set incsearch
set t_Co=16		"Allow bright colors without bold
set hidden		"Allow switching from an unsaved buffer
set nocompatible
set foldcolumn=1
set debug=msg
filetype plugin indent on	"Salt syntax plugin requires this

" Map leaders
let mapleader = "'"
let maplocalleader	= ","

" Bindings
nnoremap <leader>ev :vnew $MYVIMRC <cr>
nnoremap <leader>hv :new $MYVIMRC <cr>
nnoremap <leader>sv :source $MYVIMRC <cr>
nnoremap <localleader>w :set wrap! <cr>
inoremap jk <esc>
vnoremap jk <esc>
nnoremap J L
nnoremap K H
vnoremap J L
vnoremap K H
nnoremap <leader>k <C-W>k
nnoremap <leader>j <C-W>j
nnoremap <leader>l <C-W>l
nnoremap <leader>h <C-W>h
nnoremap Y y$
nnoremap <leader><space> :noh<cr>
nnoremap <leader>s :windo set scrollbind!<cr>
nnoremap <Up> <C-W>+
nnoremap <Down> <C-W>-

" Filetype specific things
:autocmd FileType python nnoremap <buffer><localleader>c  I#@ <esc>
:autocmd FileType python :set foldmethod=expr
:autocmd FileType python :set foldexpr=GetPythonFold(v:lnum)
:autocmd BufRead,BufNewFile azuredeploy.json :set foldmethod=expr
:autocmd BufRead,BufNewFile azuredeploy.json :set foldexpr=GetARMFold(v:lnum)
:autocmd BufRead,BufNewFile azuredeploy.json :set foldtext=ARMFoldText()
:autocmd FileType sh nnoremap <buffer><localleader>c I#<esc>
:autocmd FileType sh nnoremap <buffer><localleader>C 0x<esc>
:autocmd BufNewFile *.sh 0r ~/.vim/skeletons/skeleton.sh
:autocmd FileType txt :set tw 80
:autocmd FileType txt :set formatoptions+=t

" Vimdiff colorscheme
if &diff
	colorscheme vimdiff
endif

" Not often used
"
" For :sh command? 
" set shell=bash\ --login
" 
" Move line down / up 
nnoremap - ddp
nnoremap _ ddkP
"
" Make word upper case
"inoremap <c-u> <esc>viwUi
"nnoremap <c-u> viwU
