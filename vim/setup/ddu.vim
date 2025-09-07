" hook_add {{{

function! IfNvim(nvimValue, vimValue)
  return has('nvim') ?  a:nvimValue : a:vimValue
endfunction


" Note: ff ui
" https://github.com/Shougo/ddu-ui-ff
call ddu#custom#patch_global({
\   'ui': 'filer',
\   'actionOptions': {
\     'narrow': {
\       'quit': v:false,
\     },
\   },
\   'sources': [
\     {'name': 'file', 'params': {}},
\     {'name': 'file_old', 'params': {}},
\   ],
\   'sourceOptions': {
\     'file': {
\       'matchers': ['matcher_hidden'],
\       'columns': ['filename'],
\     },
\     'buffer': {
\       'matchers': ['matcher_substring'],
\       'columns': [],
\     },
\   },
\   'kindOptions': {
\     'file': {
\       'defaultAction': 'open',
\     },
\   },
\   'uiParams': {
\     'ff': {
\       'split': IfNvim('floating', 'no'),
\       'startFilter': v:false,
\       'prompt': '> ',
\     },
\     'filer': {
\       'split': IfNvim('floating', 'no'),
\       'previewFloating': v:true,
\       'sort': 'filename',
\     }
\   },
\ })


" prefix key
nnoremap    [ddu]   <Nop>
nmap    <C-q>  [ddu]

nmap <silent> [ddu]? <Cmd>map [ddu]<CR>

nmap <silent> [ddu]f <Cmd>call ddu#start({})<CR>

nmap <silent> [ddu]b <Cmd>call ddu#start({
\   'ui': 'ff',
\   'sources': [{'name': 'buffer'}],
\ })<CR>


" ddu filer UI内の操作
autocmd FileType ddu-filer call s:ddu_filer_settings()
function! s:ddu_filer_settings() abort
  nnoremap <buffer><silent> <CR>
        \ <Cmd>call ddu#ui#do_action('itemAction')<CR>
  nnoremap <buffer><silent> <Space>
        \ <Cmd>call ddu#ui#do_action('toggleSelectItem')<CR>
  nnoremap <buffer> o
        \ <Cmd>call ddu#ui#do_action('expandItem', {'mode': 'toggle'})<CR>
  nnoremap <buffer><silent> p
    \ <Cmd>call ddu#ui#do_action('preview')<CR>
  nnoremap <buffer><silent> <S-CR>
        \ <Cmd>call ddu#ui#do_action('itemAction', {'name': 'cd'})<CR>

  " quit
  nnoremap <buffer><silent> q
        \ <Cmd>call ddu#ui#do_action('quit')<CR>
  nnoremap <buffer><silent> <ESC>
        \ <Cmd>call ddu#ui#do_action('quit')<CR>

  " toggle hidden files
  nnoremap <buffer> I
    \ <Cmd>call ddu#ui#do_action('updateOptions', {
    \   'sourceOptions': {
    \     'file': {
    \       'matchers': ToggleHidden(),
    \     },
    \   },
    \ })<CR>

  function! ToggleHidden()
    let current = ddu#custom#get_current(b:ddu_ui_name)
    let source_options = get(current, 'sourceOptions', {})
    let source_options_all = get(source_options, '_', {})
    let matchers = get(source_options_all, 'matchers', [])
    return empty(matchers) ? ['matcher_hidden'] : []
  endfunction
endfunction


" ddu ff UI内の操作
autocmd FileType ddu-ff call s:ddu_ff_settings()
function! s:ddu_ff_settings() abort
  nnoremap <buffer><silent> <CR>
    \ <Cmd>call ddu#ui#do_action('itemAction', {'name': 'open'})<CR>

  nnoremap <buffer><silent> <Space>
    \ <Cmd>call ddu#ui#do_action('itemAction', {'name': 'open', 'params': {'command': 'vsplit'}})<CR>

  nnoremap <buffer><silent> d
    \ <Cmd>call ddu#ui#do_action('itemAction', {'name': 'delete'})<CR>

  nnoremap <buffer><silent> a
    \ <Cmd>call ddu#ui#do_action('openFilterWindow')<CR>

  nnoremap <buffer><silent> p
    \ <Cmd>call ddu#ui#do_action('preview')<CR>

  nnoremap <buffer><silent> q
    \ <Cmd>call ddu#ui#do_action('quit')<CR>
  nnoremap <buffer><silent> <Esc>
    \ <Cmd>call ddu#ui#do_action('quit')<CR>
endfunction

" ddu filter内の操作
autocmd FileType ddu-ff-filter call s:ddu_ff_filter_settings()
function! s:ddu_ff_filter_settings() abort
  inoremap <buffer><silent> <CR>  <Esc><Cmd>close<CR>
  nnoremap <buffer><silent> <CR>  <Cmd>close<CR>

  inoremap <buffer><silent> <Esc> <Esc><Cmd>call ddu#ui#do_action('quit')<CR>
  nnoremap <buffer><silent> <Esc> <Cmd>call ddu#ui#do_action('quit')<CR>
endfunction

" }}}

