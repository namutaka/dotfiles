
nmap gff :call <SID>OpenInOtherWindow()<CR>

func! <SID>OpenInOtherWindow()
  let path=expand('<cfile>')
  wincmd p
  if (filereadable(path))
    e `=path`
  else
    echo 'File Not Found: '.path
  endif
endf

