let mapleader = " "

" reload conf
nnoremap <leader>R :w<cr>:source ~/.vimrc<cr>

colorscheme industry
"set incsearch
"set hlsearch
set ignorecase
set smartcase
set wrapscan
set number
set rnu
set clipboard+=unnamedplus
set expandtab      " Convert tabs to spaces
set tabstop=4      " Show a tab as 4 spaces (visual width)
set shiftwidth=4   " Indent by 4 spaces when auto-indenting
set softtabstop=4  " Insert/delete 4 spaces when pressing Tab/Backspace


" Save with Ctrl-s
nnoremap <C-s> :w<cr>
inoremap <C-s> <esc>:w<cr>

" Save and rerun last terminal command
nnoremap <leader>! :w<cr>:!<Up><cr>

" Clear last search highlighting
nnoremap <leader>h :nohlsearch<cr>

" Paste from 0 register
nnoremap <leader>p "0p
nnoremap <leader>P "0P
vnoremap <leader>p "0p
vnoremap <leader>P "0P

" yank without moving the cursor in visual mode
vmap y ygv<esc> 

" substitute within visual selection only
vnoremap <leader>s :s/\%V

" Enter visual block mode
command! Vb normal! <C-v>

" Select all
nnoremap <leader>a m0ggVG

" Buffer shortcuts
nnoremap <leader>b :buffers!<cr>
nnoremap <leader>n :bn<cr>
nnoremap <leader>N :bp<cr>
nnoremap <leader>1 :b1<cr>
nnoremap <leader>2 :b2<cr>
nnoremap <leader>3 :b3<cr>
nnoremap <leader>4 :b4<cr>
nnoremap <leader>5 :b5<cr>
nnoremap <leader>6 :b6<cr>
nnoremap <leader>7 :b7<cr>
nnoremap <leader>8 :b8<cr>
nnoremap <leader>9 :b9<cr>

" marks
nnoremap <leader>m :marks<cr>



" Run C file
fun! CCompile() "{{{
	return 'gcc -Wall -g ' .expand('%')
endfunction
"}}}

fun! CRun( arg ) "{{{
	write
	let cmd = 'clear && ' .CCompile(). ' && ./a.out ' . a:arg
	call feedkeys(':!' . cmd, 'n')
endfunction "}}}


fun! CDebug( arg ) "{{{
	write
	let cmd = 'clear && ' .CCompile(). ' && gdb'
	\.' -ex "lay src"'
	\.' -ex "break '.line('.').'"'
	\.' -ex run --args a.out ' . a:arg
	call feedkeys(':!' . cmd, 'n')
endfunction "}}}


fun! Test() "{{{
	call feedkeys(':hello')
endfunction "}}}


command! -nargs=* Crun call CRun( '<args>' )
command! -nargs=* Cdbg call CDebug( '<args>' )
command!  Test call Test()

