" binary_mode.vim
" バイナリ編集(xxd)モード

function! binary_mode#start()
  augroup BinaryXXD
    autocmd!
    autocmd BufReadPre  *.bin let &binary =1

    autocmd BufReadPost * if &binary | silent execute '%!xxd -g 1' | set ft=xxd | endif
    autocmd BufWritePre * if &binary | execute '%!xxd -r' | endif
    autocmd BufWritePost * if &binary | silent execute '%!xxd -g 1' | set nomod | endif
  augroup END
endfunction

