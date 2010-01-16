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


"行頭のスペースの連続をハイライトさせる
"Tab文字も区別されずにハイライトされるので、
"区別したいときはTab文字の表示を別に
"設定する必要がある。
function! SOLSpaceHilight()
	syntax match SOLSpace "^\s\+" display containedin=ALL
	highlight SOLSpace term=underline ctermbg=DarkGray
endf
"全角スペースをハイライトさせる。
function! JISX0208SpaceHilight()
	syntax match JISX0208Space "　" display containedin=ALL
	highlight JISX0208Space term=underline ctermbg=238 guibg=gray
endf

"syntaxの有無をチェックし、新規バッファと新規読み込み時にハイライトさせる
if has("syntax")
	syntax on
	augroup invisible
	autocmd! invisible
	autocmd BufNew,BufRead * call SOLSpaceHilight()
	autocmd BufNew,BufRead * call JISX0208SpaceHilight()
	augroup END
endif


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

