" Show svn diff on footer.
" Language: svn
" Version:  0.3.2
" Author:   thinca <thinca+vim@gmail.com>
" License:  License: zlib License
" URL:      https://github.com/thinca/vim-ft-svn_diff
"
" ChangeLog: {{{
" 0.3.2   2012-12-10
"         - Fix for reload.
"
" 0.3.1   2012-02-07
"         - Don't show a diff of a directory.
"
" 0.3.0   2012-01-14
"         - Check the "svn" command.
"         - Fixed current directory.
"
" 0.2.4   2010-12-21
"         - Improved the pattern to extract file name.
"
" 0.2.3   2010-03-18
"         - Improved syntax timing.
"         - Added the include guard.
"
" 0.2.2   2010-03-17
"         - Remove \r on tail.
"         - Improved file name escape.
"         - Improved view.
"
" 0.2.1   2010-03-16
"         - Improved for added/removed files.
"         - Improved for property changes.
"
" 0.2.0   2010-03-05
"         - Use :read! instead of system() to detect encoding automatically.
"         - Check whether b:current_syntax exists.
"
" 0.1.0   2010-02-19
"         - Initial version.
" }}}

if !executable('svn') || exists('b:loaded_ftplugin_svn_diff')
  finish
endif
let b:loaded_ftplugin_svn_diff = 1

let s:undo_ftplgin = 'unlet! b:loaded_ftplugin_svn_diff'
if exists('b:undo_ftplugin')
  let  b:undo_ftplugin = s:undo_ftplgin . ' | ' . b:undo_ftplugin
else
  let  b:undo_ftplugin = s:undo_ftplgin
endif


function! s:get_file_list()
  let pat =  '^.\{5}\s*\zs.*'
  let list = []
  silent global/^[ADM_]/call add(list, matchstr(getline('.'), pat))
  return list
endfunction

function! s:syntax()
  unlet! b:current_syntax
  syntax include @svnDiff syntax/diff.vim
  syntax region svnDiff start="^=\+$" end="^\%$" contains=@svnDiff
  let b:current_syntax = 'svn'
endfunction

function! s:show_diff()
  let list = s:get_file_list()
  if empty(list)
    return
  endif

  $put =[]

  let lang = $LANG
  "let $LANG = 'C'
  let $LANG = 'ja_JP.UTF-8'
  lcd %:h
  call filter(list, '!isdirectory(v:val)')
  let q = '"'
  call map(list, 'q . escape(v:val, "!%#") . q')
  execute '$read !svn diff' join(list, ' ') ' | nkf'
  let $LANG = lang
  % substitute/\r$//e

  if exists('b:current_syntax')
    call s:syntax()
  else
    augroup ftplugin-svn-diff
      autocmd! Syntax svn call s:syntax() | autocmd! ftplugin-svn-diff
    augroup END
  endif

  global/^Index:/-1put =[]
  1
endfunction

call s:show_diff()
