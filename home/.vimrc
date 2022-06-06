" [VUNDLE]
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-autoformat/vim-autoformat'
Plugin 'gruvbox-community/gruvbox'
call vundle#end()
filetype plugin indent on    " required


" [PREFERENCES]
colorscheme gruvbox
set background=dark
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


" [KEYMAPS]
nnoremap <F3> :Autoformat<CR>
nnoremap <F5> :source $MYVIMRC<CR>
nnoremap <c-s> :w<cr>
inoremap <c-s> <esc>:w<cr>

