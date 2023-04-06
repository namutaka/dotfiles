" Close current buffer
"
" Date: 2011/2/11
" Author: namutaka
" Version: 1.0.0
"

" Options:
" 閉じた後に表示するバッファ
"   -1 := 前方のバッファ
"    0 := 無名バッファ
"    1 := 後方のバッファ
if !exists("g:close_buffer__next_dir")
  let g:close_buffer__next_dir = -1
endif

" Public Interface:
command! CloseBuffer call CloseBuffer()


" Functions: {{{
function! CloseBuffer()
  let buf_no = bufnr("%")

  if g:close_buffer__next_dir < 0
    confirm bprevious
  elseif g:close_buffer__next_dir > 0
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

