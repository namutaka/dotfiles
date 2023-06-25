"
" highlight_specialchar.vim
"
scriptencoding utf-8

if exists('g:loaded_highlight_specialchar')
  finish
endif

let g:loaded_highlight_specialchar = 1


"行末のスペース連続をハイライトさせる
function! s:eol_space_highlight()
  if &filetype == 'ddu-filer'
    return
  endif

  syntax match EOLSpace /[ \t]\+$/ display containedin=ALL
  highlight EOLSpace cterm=underline ctermbg=Gray gui=underline guibg=gray30
endf

"全角スペースをハイライトさせる。
function! s:jisx0208_space_highlight()
  syntax match JISX0208Space "　" display containedin=ALL
  highlight JISX0208Space cterm=underline ctermbg=238 gui=underline guibg=gray30
endf

"syntaxの有無をチェックし、新規バッファと新規読み込み時にハイライトさせる
if has("syntax")
  augroup invisible
    autocmd! invisible
    autocmd BufNew,BufRead * call s:eol_space_highlight()
    autocmd BufNew,BufRead * call s:jisx0208_space_highlight()
  augroup END
endif

