" filetype.vim
"
if exists("did_load_filetypes")
  finish
endif

augroup filetypedetect
  au! BufRead,BufNewFile *.h		setfiletype objcpp
augroup END

