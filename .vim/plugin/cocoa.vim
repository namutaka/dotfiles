" File: cocoa.vim
" Author: Michael Sanders (msanders42 [at] gmail [dot] com)
if exists('s:did_cocoa') || &cp || version < 700
	finish
endif
let s:did_cocoa = 1

" These have to load after the normal ftplugins to override the defaults; I'd
" like to put this in ftplugin/objc_cocoa_mappings.vim, but that doesn't seem
" to work..
" au FileType objc,objcpp ru after/syntax/objc_enhanced.vim
" 			\| let b:match_words = '@\(implementation\|interface\):@end'
" 			\| setl inc=^\s*#\s*import omnifunc=objc#cocoacomplete#Complete
" 			\| if b:cocoa_proj != '' |
" 			\  setl makeprg=open\ -a\ xcode\ &&\ osascript\ -e\ 'tell\ app\ \"Xcode\"\ to\ build'
" 			\| endif

augroup MyObjcAutoCmd

autocmd!
"autocmd FileType objc,objcpp setlocal makeprg=xcodebuild\ -activetarget\ -activeconfiguration\ \\\|\ grep\ -e\ \"^/.*\"\ \\\|\ sort\ -u
autocmd FileType objc,objcpp setlocal makeprg=xcodebuild\ -activetarget\ -activeconfiguration\ \\\|\ grep\ -e\ \"^/.*\"

autocmd FileType objc,objcpp nnoremap <buffer> <d-9> :call XcodeBuildCheck()<CR>
autocmd FileType objc,objcpp inoremap <buffer> <d-9> <C-o>:call XcodeBuildCheck()<CR>

function! XcodeBuildCheck() "{{{
	let proj_dir = substitute(b:cocoa_proj, '(.*)/.*' , '1', '')
	let current_dir = getcwd()
	execute ":lcd " . escape(expand(proj_dir), " #\\")
	make
	execute ":lcd " . escape(expand(current_dir), " #\\")
endfunction

augroup END

