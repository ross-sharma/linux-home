" [VUNDLE]
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'vim-autoformat/vim-autoformat'
call vundle#end()            
filetype plugin indent on    " required


" [PREFERENCES]
colorscheme darkblue
set number
set relativenumber
set tabstop=4
set shiftwidth=4
set expandtab
set clipboard=unnamedplus

" todo clipboard

" [KEYMAPS]
noremap <F3> :Autoformat<CR>:w<CR>
noremap <F4> :Autoformat<CR>


