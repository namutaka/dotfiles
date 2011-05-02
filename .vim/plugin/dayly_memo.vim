" =========================================
" ñàì˙ÉÅÉÇçÏê¨
" 2011/04/18  namutaka@gmail.com
" =========================================

let g:dayliy_memo_directory = "~/Memo"

com! Memo call s:open_or_create_today_memo()

function! s:open_or_create_today_memo()
  let today = strftime("%Y%m%d")
  let today_file = g:dayliy_memo_directory . "/" . today . ".txt"

  exec ":e " . today_file
  if !filereadable(today_file)
    exec ":r " . s:set_recent_filename()
  endif
endfunction

function! s:set_recent_filename()
  let filelist = glob(g:dayliy_memo_directory . "/*.txt")
  let splitted = split(filelist, "\n")
  let recent = ""
  for file in splitted
    let basename = fnamemodify(file, ":t:r")
    if basename =~ "^[0-9]\\+$"
      if recent < file
        let recent = file
      endif
    endif
  endfor
  return recent
endfunction

