"
" 整形機能
"
if exists('g:loaded_formatter')
  finish
endif

let g:loaded_formatter = 1

" xml整形
command! -range XmlFormat silent <line1>,<line2>!xmllint --format -


" Markdown table形式に変換する
function! s:md_table(delim="\t") range
  let rng = a:firstline . "," . a:lastline
  exec rng . 's/' . a:delim . '/|/ge'
  exec rng . 's/^\|$/|/g'
  exec rng . 's/"//ge'
  exec rng . 'EasyAlign *|'
endf

command! -range -nargs=? MdTable silent <line1>,<line2>call s:md_table(<f-args>)


" SQLのin句に指定するような形式にする
function! s:sql_list() range
  let rng = a:firstline . "," . a:lastline
  exec rng . 's/"//ge'
  exec rng . 's/^\|$/''/g'
  exec rng . 's/$/,/'
endf

command! -range SqlList silent <line1>,<line2>call s:sql_list()


" git log to CHANGELOG
function! s:git_log_to_changelog() range
  let rng = a:firstline . "," . a:lastline
  exec rng . 's/^[| ]\+//'
  exec rng . 's/Author[^<]*<\([^@]\+\)@.*/@\1/'
  exec rng . 's/\s*See merge request [^!]\+\(![0-9]\+\).*/\1/'
  exec rng . 's/^[|\\ ]*Merge:.*$/----- MERGED ------/'
  exec rng . 's/^.*\* \+commit.*$/ /'
  exec rng . 'g/^$\|Date:\|\d\+ files\? changed, \d\+ insertions\?\| | \d\+ [+-]\+$/d'
endf

command! -range Changlog silent <line1>,<line2>call s:git_log_to_changelog()


" 転置
function! s:translate(sep="\t") range
  let rng = a:firstline . "," . a:lastline

  exec rng . '!ruby -rcsv -e ''CSV.parse(ARGF, col_sep: "' . a:sep . '").transpose.each {|r| print r.to_csv(col_sep: "\t")}'''
endf

command! -range -nargs=? Trans silent <line1>,<line2>call s:translate(<f-args>)


