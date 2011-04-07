" Show git diff on footer.
" Language: git
" Version:  0.1.0
" Author:   namu
" License:  Creative Commons Attribution 2.1 Japan License
"           <http://creativecommons.org/licenses/by/2.1/jp/deed.en>
" URL:
"
" ChangeLog: {{{
" 0.1.0   2011-04-07
"         - Initial version.
"         - Modified from svn_diff.vim(http://gist.github.com/307495)
" }}}

if exists('b:loaded_ftplugin_git_diff')
  finish
endif
let b:loaded_ftplugin_git_diff = 1


function! s:get_file_list()
  let list = []
  silent global/^#\t[^:]\+:/call add(list, substitute(getline('.'), '^#\t[^:]\+:\s*\(.*\)', '\1', ''))
  return list
endfunction


function! s:syntax()
  let prev_syntax = b:current_syntax
  unlet! b:current_syntax
  syntax include @gitDiff syntax/diff.vim
  syntax region gitDiff start="^=\+$" end="^\%$" contains=@gitDiff
  let b:current_syntax = prev_syntax
endfunction


function! s:show_diff()
  let list = s:get_file_list()
  if empty(list)
    return
  endif

  let q = '"'
  call map(list, 'q . substitute(v:val, "[!%#]", "\\\\\\0", "g") . q')

  $put =[]

  let lang = $LANG
  let $LANG = 'C'
  execute '$read !git diff --cached ' join(list, ' ')
  let $LANG = lang
  % substitute/\r$//e

  if exists('b:current_syntax')
    call s:syntax()
  else
    augroup ftplugin-git-diff
      autocmd! Syntax git call s:syntax() | autocmd! ftplugin-git-diff
    augroup END
  endif

  global/^diff /-1put =[]
  1
endfunction

call s:show_diff()

