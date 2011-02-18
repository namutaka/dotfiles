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

let s:TEST_CASE_PATTERN = '^\s*test\s\+\(["'']\)\([^\1]\+\)\1\s\+do.*'

function! s:find_test_case()
  let line_no_of_test = search(s:TEST_CASE_PATTERN, 'bcnW')
  if line_no_of_test == 0
    throw "RubyTest:TestCaseNotFound"
  endif

  let test_name = getline(line_no_of_test)
  let test_name = substitute(test_name, s:TEST_CASE_PATTERN, 'test_\2', '')
  let test_name = substitute(test_name, " ", "_", "g")
  return test_name
endfunction

function! s:ruby_test()
  try
    execute ':QuickRun -args "--name=' . s:find_test_case() . '"'
  catch /RubyTest:TestCaseNotFound/
    echo "TestCase Not Fount."
  endtry
endfunction

function! s:ruby_test_debug()
  try
    execute ':VimShellInteractive ruby -rdebug -I test '. expand('%'). ' --name=' . s:find_test_case()
  catch /RubyTest:TestCaseNotFound/
    echo "TestCase Not Fount."
  endtry
endfunction

com! RubyTest call s:ruby_test()
map <Leader>R :RubyTest<CR>

com! RubyDebug call s:ruby_test_debug()
map <Leader>D :RubyDebug<CR>
