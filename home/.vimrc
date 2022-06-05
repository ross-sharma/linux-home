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


" [KEYMAPS]
nnoremap <F3> :Autoformat<CR>
nnoremap <c-s> <esc><esc>:Autoformat<cr>:w<cr>
inoremap <c-s> <esc><esc>:Autoformat<cr>:w<cr>

