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

" Map leaders
let mapleader = "'"
let maplocalleader	= ","

" Bindings
nnoremap <leader>ev :vnew $MYVIMRC <cr>
nnoremap <leader>sv :source $MYVIMRC <cr>
nnoremap <localleader>w :set wrap! <cr>
inoremap jk <esc>
vnoremap jk <esc>
nnoremap H 0
nnoremap J L
nnoremap K H
nnoremap L $
vnoremap H 0
vnoremap J L
vnoremap K H
vnoremap L $
nnoremap <leader>k <C-W>k
nnoremap <leader>j <C-W>j
nnoremap <leader>l <C-W>l
nnoremap <leader>h <C-W>h
nnoremap Y y$
nnoremap <leader><space> :noh<cr>

" Filetype specific things
:autocmd FileType python nnoremap <buffer><localleader>c  I#@ <esc>
:autocmd FileType python :set foldmethod=expr
:autocmd FileType python :set foldexpr=GetPythonFold(v:lnum)
:autocmd FileType python :set foldcolumn=1
:autocmd FileType sh nnoremap <buffer><localleader>c I#<esc>
:autocmd FileType sh nnoremap <buffer><localleader>C 0x<esc>
:autocmd FileType txt :set tw 80
:autocmd FileType txt :set formatoptions+=t
" I want something like this.
" 	Should be smart enough to know whether I should change height or width.
"		Should continue resizing if I hold the keys
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

"Disable old keys
"inoremap <esc> <nop>
"inoremap <right> <nop>
"inoremap <left> <nop>
"inoremap <up> <nop>
"inoremap <down> <nop>
"nnoremap <right> <nop>
"nnoremap <left> <nop>
"nnoremap <up> <nop>
"nnoremap <down> <nop>

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
inoremap <c-u> <esc>viwUi
nnoremap <c-u> viwU
"
" Edit vimrc in horizontal split
nnoremap <leader>evh :new $MYVIMRC <cr>
"
" Resize splits
"nnoremap <leader>+ :resize +5<enter>
"nnoremap <leader>- :resize -5<enter>
nnoremap <leader>> :vertical resize +5<enter>
nnoremap <leader>< :vertical resize -5<enter>
