"
" 整形機能
"


" xml整形
command! -range XmlFormat silent <line1>,<line2>!xmllint --format -

autocmd! FileType javascript setl equalprg=uglifyjs\ -b


" Markdown table形式に変換する
function! MdTable(...) range
  let delim="\t"
  if a:0 >= 1
    let delim = a:1
  end
  let rng = a:firstline . "," . a:lastline
  exec rng . 's/' . delim . '/|/ge'
  exec rng . 's/^\|$/|/g'
  exec rng . 's/"//ge'
  exec rng . 'EasyAlign *|'
endf

command! -range -nargs=? MdTable silent <line1>,<line2>call MdTable(<f-args>)


" SQLのin句に指定するような形式にする
function! SqlList() range
  let rng = a:firstline . "," . a:lastline
  exec rng . 's/"//ge'
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


" 転置
function! Translate(sep) range
  let rng = a:firstline . "," . a:lastline

  exec rng . '!ruby -rcsv -e ''CSV.parse(ARGF, col_sep: "' . a:sep . '").transpose.each {|r| print r.to_csv(col_sep: "\t")}'''
endf

command! -range TransTsv silent <line1>,<line2>call Translate("\t")
command! -range TransCsv silent <line1>,<line2>call Translate(",")


