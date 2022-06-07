" [PLUGINS]
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-autoformat/vim-autoformat'
Plugin 'altercation/vim-colors-solarized'
Plugin 'davidhalter/jedi-vim'
call vundle#end()
filetype plugin indent on    " required


" [KEYMAPS]
nnoremap <F1> :!flow<CR>
nnoremap <F3> :Autoformat<CR>
nnoremap <F4> <esc>:wq<cr>
inoremap <F4> <esc>:wq<cr>
nnoremap <F5> :source $MYVIMRC<CR>
nnoremap <s-F5> :e $MYVIMRC<CR>
nnoremap <c-s> <esc>:w<cr>
inoremap <c-s> <esc>:w<cr>
nnoremap <c-T> <esc>:terminal<cr>

inoremap <c-k> <up>
inoremap <c-j> <down>
inoremap <c-h> <left>
inoremap <c-l> <right>



" [APPEARANCE]
syntax enable
set background=dark
colorscheme default


" [PREFERENCES]
set number
set relativenumber
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent
set clipboard=unnamedplus
set noswapfile
set scrolloff=8
set signcolumn=yes
set updatetime=50
set incsearch
set cmdheight=2

" Use persistent undo history
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undo-dir")
    call mkdir($HOME."/.vim/undo-dir", "", 0700)
endif
set undodir=~/.vim/undo-dir
set undofile

