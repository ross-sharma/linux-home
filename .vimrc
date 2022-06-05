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
set tabstop=4
set shiftwidth=4
set expandtab

" [KEYMAPS]
noremap <F3> :Autoformat<CR>
noremap <a-s-f> :Autoformat<CR>
noremap <a-s-F> :Autoformat<CR>



