com! Kwbd call s:Kwbd()

function! s:Kwbd()
  let kwbd_bn= bufnr("%")
  enew
  setl noswapfile
  setl buftype=nofile
  setl bufhidden=delete
  exe "bdel ".kwbd_bn
endfunction

