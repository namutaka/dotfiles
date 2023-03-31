"highlight_specialchar.vim
scriptencoding utf-8

"行末のスペース連続をハイライトさせる
function! EOLSpaceHilight()
  syntax match EOLSpace "[ \t]\+$" display containedin=ALL
  highlight EOLSpace term=underline ctermbg=Gray
endf

"全角スペースをハイライトさせる。
function! JISX0208SpaceHilight()
  syntax match JISX0208Space "　" display containedin=ALL
  highlight JISX0208Space term=underline ctermbg=238 guibg=gray30
endf

"syntaxの有無をチェックし、新規バッファと新規読み込み時にハイライトさせる
if has("syntax")
  augroup invisible
    autocmd! invisible
    autocmd BufNew,BufRead * call EOLSpaceHilight()
    autocmd BufNew,BufRead * call JISX0208SpaceHilight()
  augroup END
endif

