"highlight_specialchar.vim

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
	augroup invisible
	autocmd! invisible
	autocmd BufNew,BufRead * call SOLSpaceHilight()
	autocmd BufNew,BufRead * call JISX0208SpaceHilight()
	augroup END
endif

