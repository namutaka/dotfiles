".vimrc
syntax on

set tabstop=4
set shiftwidth=4
set softtabstop=0
set number
set smartindent
set incsearch
set hlsearch
set nowrap

" バックアップなし
set nobackup

" ステータスバー
set cmdheight=1
set laststatus=2
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

" 特殊文字
set list
set listchars=tab:>\ ,eol:\ ,trail:_,extends:\


" screenからのマウス操作
set mouse=a
set ttymouse=xterm2


autocmd FileType make setlocal noexpandtab
autocmd BufNewFile,BufRead *.gv setf groovy





nnoremap <unique> <silent> <space>fb :FufBuffer!<CR>
nnoremap <unique> <silent> <space>ff :FufFile!<CR>
nnoremap <unique> <silent> <space>fm :FufMruFile!<CR>
nnoremap <unique> <silent> <Space>fc :FufRenewCache<CR>
autocmd FileType fuf nmap <C-c> <ESC>
let g:fuf_patternSeparator = ' '
let g:fuf_modesDisable = ['mrucmd']
let g:fuf_mrufile_exclude = '\v\.DS_Store|\.git|\.swp|\.svn'
let g:fuf_mrufile_maxItem = 100
let g:fuf_enumeratingLimit = 20
let g:fuf_file_exclude = '\v\.DS_Store|\.git|\.swp|\.svn'

