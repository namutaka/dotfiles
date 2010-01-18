".vimrc
syntax on

set tabstop=4
set shiftwidth=4
set softtabstop=0
set number
set smartindent
set incsearch
set hlsearch
set laststatus=2
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set list
set listchars=tab:>\ ,eol:\|,trail:_,extends:\

set mouse=a
set ttymouse=xterm2

autocmd FileType make setlocal noexpandtab
autocmd BufNewFile,BufRead *.gv setf groovy


