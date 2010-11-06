".vimrc

"------------------------------------
" pathogen
"------------------------------------
" pathogenでftdetectなどをloadさせるために一度ファイルタイプ判定をoff
filetype off
" pathogen.vimによってbundle配下のpluginをpathに加える
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
set helpfile=$VIMRUNTIME/doc/help.txt
" ファイルタイプ判定をon
filetype plugin on


"------------------------------------
" 表示設定
"------------------------------------

syntax on
let mapleader = ","              " キーマップリーダー
set tabstop=4
set shiftwidth=4
set softtabstop=0
set number
set smartindent
set incsearch
set hlsearch
set nowrap
set hidden
set path+=~/
set nobackup
set cursorline
set whichwrap=b,s,h,l,<,>,[,]    " カーソルを行頭、行末で止まらないようにする

" ステータスバー
set cmdheight=1
set laststatus=2
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%y%=%l,%c%V%8P

" 特殊文字
set list
set listchars=tab:>\ ,eol:\ ,trail:_,extends:\

" screenからのマウス操作
set mouse=a
set ttymouse=xterm2


"------------------------------------
" 個別コマンド
"------------------------------------
" Man
runtime! ftplugin/man.vim
" 保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//ge

set runtimepath+=~/.vim/bundle/vim-ref

let g:netrw_liststyle=3

"------------------------------------
" Quickfix
"------------------------------------
autocmd FileType make setlocal noexpandtab
au QuickfixCmdPost make,grep,grepadd,vimgrep copen

"------------------------------------
" grep.vim settings
"------------------------------------
let Grep_Find_Use_Xargs = 0

"------------------------------------
" MiniBufExplorer
"------------------------------------
"set minibfexp
let g:miniBufExplMapWindowNavVim=1 "hjklで移動
let g:miniBufExplSplitBelow=0  " Put new window above
let g:miniBufExplMapWindowNavArrows=1
let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplModSelTarget=1
let g:miniBufExplSplitToEdge=1
let g:miniBufExplMaxSize = 10

":TmでMiniBufExplorerの表示トグル
command! Mt :TMiniBufExplorer


"------------------------------------
" FuzyFinder
"------------------------------------
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




"------------------------------------
" Key map
"------------------------------------
"Escの2回押しでハイライト消去
nmap <ESC><ESC> :nohlsearch<CR><ESC>
" Ctrl-iでヘルプ
nnoremap <C-i>  :<C-u>help<Space>
" カーソル下のキーワードをヘルプでひく
nnoremap <C-i><C-i> :<C-u>help<Space><C-r><C-w><Enter>

map <silent> gw :macaction selectNextWindow:<CR>
map <silent> gW :macaction selectPreviousWindow:<CR>
map <silent> gt :tabnext<CR>
map <silent> gT :tabprev<CR>
map <silent> <C-Tab> :bn<CR>
" CTRL-hjklでウィンドウ移動
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

map <silent> <C-S-Tab> :bp<CR>

" s, ssで選択範囲を指定文字でくくる
nmap s <Plug>Ysurround
nmap ss <Plug>Yssurround

" :Gb <args> でGrepBufferする
command! -nargs=1 Gb :GrepBuffer <args>
" カーソル下の単語をGrepBufferする
nnoremap <C-g><C-b> :<C-u>GrepBuffer<Space><C-r><C-w><Enter>

" カーソルを表示行で移動する。論理行移動は<C-n>,<C-p>
nnoremap h <Left>
nnoremap j gj
nnoremap k gk
nnoremap l <Right>
nnoremap <Down> gj
nnoremap <Up>   gk

" F2で前のバッファ
map <F2> <ESC>:bp<CR>
" F3で次のバッファ
map <F3> <ESC>:bn<CR>
" F4でバッファを削除する
map <F4> <ESC>:bw<CR>

