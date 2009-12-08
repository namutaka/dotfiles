
syntax on

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=0
set number
set smartindent
set incsearch

autocmd FileType make setlocal noexpandtab

" マウスモード有効
set mouse=a
" screen対応
set ttymouse=xterm2


au! BufNewFile,BufRead *.gv setf groovy

