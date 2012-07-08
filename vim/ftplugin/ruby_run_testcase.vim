" Run TestCase
" require VimShell plugin

let s:TEST_CASE_PATTERNS = [
\  ['^\s*test\s\+\(["'']\)\([^\1]\+\)\1\s\+do.*', 'test_\2'],
\  ['^\s*def\s\+\(test_[^\s]\+\)\s*\(#.*\|$\)', '\1']
\]

function! s:find_test_case()
  for pattern in s:TEST_CASE_PATTERNS

    let line_no_of_test = search(pattern[0], 'bcnW')
    if line_no_of_test != 0
      let test_name = getline(line_no_of_test)
      let test_name = substitute(test_name, pattern[0], pattern[1], '')
      let test_name = substitute(test_name, " ", "_", "g")
      return test_name
    endif
  endfor

  throw "RubyTest:TestCaseNotFound"
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

