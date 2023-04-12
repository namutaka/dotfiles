"
" visualモードでカーソル横位置を維持しつつ空行前まで移動
"

if exists('g:loaded_move_to_empty_line')
  finish
endif

let g:loaded_move_to_empty_line = 1

function! MoveToEmptyLine(direction) abort
  if a:direction < 0
    let param = #{ flag: 'b', offset: 1, edge: line('w0') }
  else
    let param = #{ flag: '', offset: -1, edge: line('w$') }
  endif

  let current_col = col('.')

  " flag('n': stay cursor, 'W': no wrap)
  let dest_line = search('^$', 'nW' . param.flag)

  if dest_line == 0 " not match
    let dest_line = param.edge
  else
    let dest_line += param.offset
  endif

  call cursor(dest_line, current_col)
endfunction

vnoremap <C-k> <CMD>call MoveToEmptyLine(-1)<CR>
vnoremap <C-j> <CMD>call MoveToEmptyLine(1)<CR>

