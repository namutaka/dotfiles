syntax on

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=0
set number
set smartindent
set incsearch
set hlsearch
set laststatus=2
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set listchars=tab:>.,eol:$,trail:_,extends:\

set mouse=a
set ttymouse=xterm2


autocmd FileType make setlocal noexpandtab
autocmd BufNewFile,BufRead *.gv setf groovy


"バイナリ編集(xxd)モード
augroup BinaryXXD
    autocmd!
    autocmd BufReadPre  *.bin let &binary =1
    autocmd BufReadPost * if &binary | silent %!xxd -g 1
    autocmd BufReadPost * set ft=xxd | endif
    autocmd BufWritePre * if &binary | %!xxd -r | endif
    autocmd BufWritePost * if &binary | silent %!xxd -g 1
    autocmd BufWritePost * set nomod | endif
augroup END

