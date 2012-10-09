" Show git diff on footer.
" Language: git
" Version:  0.2.0
" Author:   namu
" License:  Creative Commons Attribution 2.1 Japan License
"           <http://creativecommons.org/licenses/by/2.1/jp/deed.en>
" URL:
"
" ChangeLog: {{{
" 0.2.0   2012-05-27
"         - Show diff contents in splited other buffer
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


function! GIT_COMMIT_SHOW_DIFF()
  autocmd BufWinEnter COMMIT_EDITMSG
  let list = s:get_file_list()
  goto 1
  if empty(list)
    return
  endif

  new
  setlocal syntax=diff
  setlocal noswapfile
  setlocal buftype=quickfix
  setlocal bufhidden=hide
  setlocal readonly

  let _modified = &modified

  let q = '"'
  call map(list, 'q . substitute(v:val, "[!%#]", "\\\\\\0", "g") . q')

  execute '0read !LANG=C git diff --cached -- ' join(list, ' ')
  % substitute/\r$//e
  global/^diff /-1put =[]

  let &modified = _modified
  1
endfunction

autocmd BufWinEnter COMMIT_EDITMSG silent call GIT_COMMIT_SHOW_DIFF()

