"
" 整形機能
"


" xml整形
command! XmlFormat :%s/></>\r</g | filetype indent on | setf xml | normal gg=G<CR>

autocmd! FileType javascript setl equalprg=uglifyjs\ -b


" Markdown table形式に変換する
function! MdTable(...) range
  let delim="\t"
  if a:0 >= 1
    let delim = a:1
  end
  let rng = a:firstline . "," . a:lastline
  exec rng . 's/^\|$\|' . delim . '/|/g'
  exec rng . 's/"//g'
  exec rng . 'EasyAlign *|'
endf

command! -range -nargs=? MdTable silent <line1>,<line2>call MdTable(<f-args>)


" SQLのin句に指定するような形式にする
function! SqlList() range
  let rng = a:firstline . "," . a:lastline
  exec rng . 's/"//g'
  exec rng . 's/^\|$/''/g'
  exec rng . 's/$/,/'
endf

command! -range SqlList silent <line1>,<line2>call SqlList()

" git log to CHANGELOG
function! GitLogToChangelog() range
  let rng = a:firstline . "," . a:lastline
  exec rng . 's/^[| ]\+//'
  exec rng . 's/Author[^<]*<\([^@]\+\)@.*/@\1/'
  exec rng . 's/\s*See merge request [^!]\+\(![0-9]\+\).*/\1/'
  exec rng . 's/^[|\\ ]*Merge:.*$/----- MERGED ------/'
  exec rng . 's/^.*\* \+commit.*$/ /'
  exec rng . 'g/^$\|Date:\|\d\+ files\? changed, \d\+ insertions\?\| | \d\+ [+-]\+$/d'
endf

command! -range Changlog silent <line1>,<line2>call GitLogToChangelog()


