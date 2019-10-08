".vimrc

" 全体設定 {{{

syntax on
let mapleader = ","              " キーマップリーダー
set hidden
set nobackup
set noswapfile
"set noimdisable " ime設定
set mouse=a
set ttymouse=xterm2
set whichwrap=b,s,h,l,<,>,[,]    " カーソルを行頭、行末で止まらないようにする
set splitbelow
set splitright
set virtualedit=block
set winaltkeys=no
set clipboard=unnamed
set encoding=utf-8
"" 標準入力はUTF-8と見なす
autocmd StdinReadPre * set fileencodings=utf-8

" パス設定
set runtimepath+=$HOME/.vim
set path+=~/
let g:vimball_home = expand("~/.vim/bundle/vimball")
set tags+=../../../tags
set tags+=../../tags
set tags+=../tags
let $PATH = $PATH . ':~/local/bin'
"set undodir=$HOME/.vim/tmp
set backupskip=/tmp/*,/private/tmp/*

" 表示
set number
set nowrap
set cursorline
set list " 特殊文字
set listchars=tab:>\ ,eol:\ ,trail:_,extends:\
set showmatch         " 括弧の対応をハイライト
set foldmethod=syntax
set foldlevel=1000

" インデント
set tabstop=2
set shiftwidth=2
set softtabstop=0
set expandtab
set smartindent
set autoindent
set textwidth=0
autocmd FileType text setlocal textwidth=0
autocmd FileType gitcommit set fenc=utf-8|setlocal textwidth=0|DiffGitCached|resize 10


" ステータスバー
set cmdheight=1
set laststatus=2
"set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%y\ %{cfi#format('<%s()>','')}%=%l,%c%V%8P
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%y\ %=%l,%c%V%8P
highlight CursorLine term=reverse cterm=none ctermbg=232

" 標準プラグインの制御
let plugin_dicwin_disable=1
let g:netrw_liststyle=3
let g:Align_xstrlen = 3
let g:buffer_close_after_buf = -1

" Man
runtime! ftplugin/man.vim

" Quickfix
autocmd FileType make setlocal noexpandtab
au QuickfixCmdPost make,grep,grepadd,vimgrep cwindow

" }}}


" Key mapping {{{

" for us-keyboard
noremap ; :
noremap : ;

" カーソルを表示行で移動する。論理行移動は<C-n>,<C-p>
nnoremap h <Left>
nnoremap j gj
nnoremap k gk
nnoremap l <Right>
nnoremap <Down> gj
nnoremap <Up>   gk

" CTRL-hjklでウィンドウ移動
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

" ウインドウサイズ変更
nnoremap + <C-w>+
nnoremap - <C-w>-
nnoremap <F7> :wincmd ><CR>
nnoremap <F8> :wincmd <lt><CR>

" ウインドウ／タブ切り換え
nnoremap <silent> <C-Tab> :bn<CR>
nnoremap <silent> <C-S-Tab> :bp<CR>
nnoremap <silent> gt :tabnext<CR>
nnoremap <silent> gT :tabprev<CR>

" 頻出文字入力
nmap <Leader><Space> a<Space><ESC>
nmap <Leader><CR> o<ESC>

" 新規バッファ
nnoremap <silent> <C-n> :enew<CR>

" 比較
command! Diff :windo diffthis
command! Doff :windo diffoff

" inc,dec
vnoremap <c-a> <c-a>gv
vnoremap <c-x> <c-x>gv

" }}}


" 検索設定 Search {{{

set wrapscan   " 最後まで検索したら先頭へ戻る
set ignorecase " 大文字小文字無視
set smartcase  " 検索文字列に大文字が含まれている場合は区別して検索する
set incsearch  " インクリメンタルサーチ
set hlsearch   " 検索文字をハイライト
let &grepprg="grep -n -r --exclude='tags' --exclude='*.db' --exclude='*.log'  --exclude='*.tmp' --exclude='*.svn*' --exclude='*.swp' $*"

"Escの2回押しでハイライト消去
nnoremap <ESC><ESC> :nohlsearch<CR><ESC>

"選択した文字列を検索
vnoremap <silent> // y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>
"選択した文字列を置換
vnoremap /r "xy:%s/<C-R>=escape(@x, '\\/.*$^~[]')<CR>//gc<Left><Left><Left>

"s*置換後文字列/g<Cr>でカーソル下のキーワードを置換
nnoremap <expr> s* ':%substitute/\<' . expand('<cword>') . '\>/'

" Ctrl-iでヘルプ
nnoremap <Leader><C-i>  :<C-u>help<Space>
" カーソル下のキーワードをヘルプでひく
nnoremap <Leader><C-i><C-i> :<C-u>help<Space><C-r><C-w><Enter>

" :Gb <args> でGrepBufferする
command! -nargs=1 Gb ;GrepBuffer <args>
" カーソル下の単語をGrepBufferする
nnoremap <C-g><C-b> :<C-u>GrepBuffer<Space><C-r><C-w><Enter>

nnoremap <C-g><C-r> :grep<Space><C-r><C-w>

" }}}


" Utilities {{{

" .vimrcを開く
command! Vimrc edit ~/.vimrc

" F2 キーでセッションを保存する
nmap <F2> ;wa<Bar>exe "mksession! ~/.vim/tmp/" . v:this_session<CR>

" ファイル名とカーソルの行数をコピー
nmap <Leader>% ;let @+=(expand("%:p") . ":" . line("."))<CR>

" 保存時に行末の空白を除去する
augroup RemoveLineEndSpace
  autocmd!
  autocmd BufWritePre * ;%s/\s\+$//ge
augroup END
command! AllowLineEndSpace autocmd! RemoveLineEndSpace
autocmd FileType seizo AllowLineEndSpace
autocmd FileType mako AllowLineEndSpace
autocmd FileType markdown AllowLineEndSpace


" grep.vim settings
let Grep_Find_Use_Xargs = 0

" DirDiff
let g:DirDiffExcludes = "CVS,.*.swp,.svn,*.log,*.tmp,.DS_Store,thumb.db,.git"

"タイムスタンプを挿入してinsertモードへ移行
nnoremap <Leader>n <ESC>i<C-R>=strftime("%Y/%m/%d %H:%M")<CR><ESC>
nnoremap <Leader>N <ESC>o<C-R>=strftime("%Y/%m/%d %H:%M")<CR><ESC>

" spaceで次のbufferへ。back-spaceで前のbufferへ
nmap <BS> ;bn<CR>
nmap <C-BS> ;bp<CR>

" }}}


" vim:ft=vim foldmethod=marker sw=2
