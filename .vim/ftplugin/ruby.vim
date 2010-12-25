" for ruby

fun! s:RubyGrep(pat)
	let paths = system("ruby -e \'a=$LOAD_PATH.dup; a.delete(\".\"); print a.join(\" \")\'")
	let @a=":grep -r ".a:pat." --include='*.rb' ".paths
	execute @a
endf

com! -nargs=1 Rug call s:RubyGrep(<f-args>)

set tags+=~/.vim/tags/ruby.tags

set ts=2 sw=2 expandtab

