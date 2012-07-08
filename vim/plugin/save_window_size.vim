" 画面サイズ保存
" 2010/04/08
" origin:http://vim-users.jp/2010/01/hack120/

let g:save_window_file = expand('~/.vim/tmp/.vimwinpos')
augroup SaveWindow
  autocmd!
  autocmd VimLeavePre * call s:save_window()
  function! s:save_window()
    let options = [
      \ 'set columns=' . &columns,
      \ 'set lines=' . &lines,
      \ 'winpos ' . getwinposx() . ' ' . getwinposy(),
      \ ]
    call writefile(options, g:save_window_file)
  endfunction
augroup END

function g:restore_window_size()
	if filereadable(g:save_window_file)
		execute 'source' g:save_window_file
	endif
endfunction

