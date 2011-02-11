" for ruby

set tags+=~/.vim/tags/ruby.tags
set ts=2 sw=2 expandtab
set nosmartindent
set autoindent

com! -nargs=1 Rug call s:RubyGrep(<f-args>)
fun! s:RubyGrep(pat)
  let paths = system("ruby -e \'a=$LOAD_PATH.dup; a.delete(\".\"); print a.join(\" \")\'")
  let paths .= " " . system("gem environment gemdir")
  let paths = substitute(paths, "[\n\r]", "", "g")
  exec ":grep  --include='*.rb' " . a:pat ." ". paths
endf

