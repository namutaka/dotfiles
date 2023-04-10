" Close current buffer
"
" Date: 2023/04/10
" Author: namutaka
" Version: 2.0.0
"

" バッファを閉じる
" :next_buffer: 閉じた後に表示するバッファ
"   -1 := 前方のバッファ
"    0 := 無名バッファ
"    1 := 後方のバッファ
function! close_buffer#close(next_buffer) abort
  let buf_no = bufnr("%")

  if a:next_buffer < 0
    confirm bprevious
  elseif a:next_buffer > 0
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


