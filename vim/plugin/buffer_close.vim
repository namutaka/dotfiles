" Buffer Close
"
" Date: 2011/2/11
" Author: namutaka
" Version: 1.0.0
"

" Options:
" 閉じた後に表示するバッファ
"   -1 := 前方のバッファ
"    0 := スクラッチバッファ
"    1 := 後方のバッファ
if !exists("g:buffer_close_after_buf")
  let g:buffer_close_after_buf = 0
endif

" Public Interface:
com! BufferClose call <SID>BufferClose()


" Functions: {{{
function! <SID>BufferClose()
  let buf_no = bufnr("%")

  if g:buffer_close_after_buf < 0
    confirm bprevious
  elseif g:buffer_close_after_buf > 0
    confirm bnext
  endif

  if bufnr("%") == buf_no
    enew
    setlocal syntax=none
    setlocal noswapfile
    "setlocal buftype=nofile " nofileにするとバッファが消えないのでNG
    setlocal bufhidden=delete
  endif

  if buflisted(buf_no) != 0
    exe "confirm bdel ".buf_no
  endif
endfunction
" }}}

