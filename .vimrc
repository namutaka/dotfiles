".vimrc
set runtimepath+=$HOME/.vim
set winaltkeys=no
set clipboard=unnamed

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

" 標準プラグインの制御
let plugin_dicwin_disable=1

"------------------------------------
" 表示設定
"------------------------------------

syntax on
let mapleader = ","              " キーマップリーダー
set hidden
set nobackup
set noswapfile
"set noimdisable " ime設定
set path+=~/
let g:netrw_liststyle=3
set mouse=a  " screenからのマウス操作
set ttymouse=xterm2
set whichwrap=b,s,h,l,<,>,[,]    " カーソルを行頭、行末で止まらないようにする
set splitbelow
set splitright
let g:vimball_home = expand("~/.vim/bundle/vimball")
let &grepprg="grep -n -r --exclude-dir='.git' --exclude-dir=docs --exclude='*\\tags' --exclude='*.db' --exclude='*.log'  --exclude='*.tmp' --exclude='*.swp' $*"
set virtualedit=block
let g:Align_xstrlen = 3
let g:buffer_close_after_buf = -1
set foldmethod=syntax
set tags+=../../../tags
set tags+=../../tags
set tags+=../tags

" 表示
set number
set nowrap
set cursorline
set list " 特殊文字
set listchars=tab:>\ ,eol:\ ,trail:_,extends:\
set showmatch         " 括弧の対応をハイライト

" インデント
set tabstop=2
set shiftwidth=2
set softtabstop=0
set expandtab
set smartindent
set autoindent

" ステータスバー
set cmdheight=1
set laststatus=2
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%y\ %{cfi#format('<%s()>','')}%=%l,%c%V%8P

" Man
runtime! ftplugin/man.vim

" 保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//ge

" .vimrcを開く
command! Vimrc edit ~/.vimrc
nmap <F2> :wa<Bar>exe "mksession! ~/.vim/tmp/" . v:this_session<CR>

"------------------------------------
" Key map
"------------------------------------

" CTRL-hjklでウィンドウ移動
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

" カーソルを表示行で移動する。論理行移動は<C-n>,<C-p>
nnoremap h <Left>
nnoremap j gj
nnoremap k gk
nnoremap l <Right>
nnoremap <Down> gj
nnoremap <Up>   gk

" ウインドウサイズ変更
nnoremap + <C-w>+
nnoremap - <C-w>-
nnoremap <F7> :wincmd ><CR>
nnoremap <F8> :wincmd <lt><CR>

" ウインドウ／タブ切り換え
map <silent> gw :macaction selectNextWindow:<CR>
map <silent> gW :macaction selectPreviousWindow:<CR>
map <silent> gt :tabnext<CR>
map <silent> gT :tabprev<CR>
map <silent> <C-Tab> :bn<CR>
map <silent> <C-S-Tab> :bp<CR>

" 頻出文字入力
nmap <Leader><Space> a<Space><ESC>
nmap <Leader><CR> o<ESC>

"-------------------------------------------------------------------------------
" 検索設定 Search
"-------------------------------------------------------------------------------
set wrapscan   " 最後まで検索したら先頭へ戻る
set ignorecase " 大文字小文字無視
set smartcase  " 検索文字列に大文字が含まれている場合は区別して検索する
set incsearch  " インクリメンタルサーチ
set hlsearch   " 検索文字をハイライト

"Escの2回押しでハイライト消去
nmap <ESC><ESC> :nohlsearch<CR><ESC>

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
command! -nargs=1 Gb :GrepBuffer <args>
" カーソル下の単語をGrepBufferする
nnoremap <C-g><C-b> :<C-u>GrepBuffer<Space><C-r><C-w><Enter>

nnoremap <C-g><C-r> :grep<Space><C-r><C-w>

"------------------------------------
" Kwbd.vim
"------------------------------------

" バッファを閉じる
nnoremap <Leader>w :BufferClose<CR>

"------------------------------------
" YankRing.vim
"------------------------------------
let g:yankring_history_dir = '~/.vim/tmp/'
let g:yankring_history_file = '.yankring_history'

" Yankの履歴参照
nmap <Leader>y :YRShow<CR>

"------------------------------------
" BufExplorer
"------------------------------------
"<Leader>l<Space>でBufferList
nnoremap <Leader>l<Space> :BufExplorer<CR>

"------------------------------------
" open-blowser.vim
"------------------------------------

" カーソル下のURLをブラウザで開く
nmap fu <Plug>(openbrowser-open)
vmap fu <Plug>(openbrowser-open)
" カーソル下のキーワードをググる
nnoremap fs :<C-u>OpenBrowserSearch<Space><C-r><C-w><Enter>

"------------------------------------
" operator-replace.vim
"------------------------------------
" RwなどでYankしてるもので置き換える
nmap <C-p> <Plug>(operator-replace)

"------------------------------------
" vimshell
"------------------------------------
"let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
"let g:vimshell_right_prompt = 'vimshell#vcs#info("(%s)-[%b]", "(%s)-[%b|%a]")'
let g:vimshell_enable_smart_case = 1

if has('win32') || has('win64')
  " Display user name on Windows.
  let g:vimshell_prompt = $USERNAME."% "
else
  " Display user name on Linux.
  let g:vimshell_prompt = $USER."% "

  call vimshell#set_execute_file('bmp,jpg,png,gif', 'gexe eog')
  call vimshell#set_execute_file('mp3,m4a,ogg', 'gexe amarok')
  let g:vimshell_execute_file_list['zip'] = 'zipinfo'
  call vimshell#set_execute_file('tgz,gz', 'gzcat')
  call vimshell#set_execute_file('tbz,bz2', 'bzcat')
endif

function! g:my_preexec(cmdline, context)
  if a:cmdline =~# '^\s*diff\>'
    call vimshell#set_syntax('diff')
  endif
  return a:cmdline
endfunction

autocmd FileType vimshell
\ call vimshell#altercmd#define('g', 'git')
\| call vimshell#altercmd#define('i', 'iexe')
\| call vimshell#altercmd#define('l', 'll')
\| call vimshell#altercmd#define('ll', 'ls -l')
\| call vimshell#hook#set('preexec', ['g:my_preexec'])

command! Vs :VimShell
command! -nargs=? -complete=dir Vsi :VimShellInteractive <args>

" <Leader>is: シェルを起動
nnoremap <silent> <Leader>is :VimShell<CR>
" <Leader>ipy: pythonを非同期で起動
nnoremap <silent> <Leader>ipy :VimShellInteractive python<CR>
" <Leader>irb: irbを非同期で起動
nnoremap <silent> <Leader>irb :VimShellInteractive irb<CR>
" <Leader>ss: 非同期で開いたインタプリタに現在の行を評価させる
nnoremap <silent> <Leader>ss <S-v>:VimShellSendString<CR>
" 選択中に<Leader>ss: 非同期で開いたインタプリタに選択行を評価させる
vmap <silent> <Leader>ss :VimShellSendString<CR>



"------------------------------------
" unite.vim
"------------------------------------
" The prefix key.
nnoremap    [unite]   <Nop>
nmap    <C-a> [unite]

nnoremap [unite]u  :<C-u>Unite<Space>
nnoremap <silent> [unite]a  :<C-u>UniteWithCurrentDir -buffer-name=files buffer file_mru bookmark file<CR>
nnoremap <silent> [unite]f  :<C-u>Unite -buffer-name=files file<CR>
nnoremap <silent> [unite]b  :<C-u>Unite buffer<CR>
nnoremap <silent> [unite]m  :<C-u>Unite file_mru<CR>

" nnoremap <silent> [unite]b  :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
  " Overwrite settings.
  imap <buffer> jj      <Plug>(unite_insert_leave)
  nnoremap <silent><buffer> <C-k> :<C-u>call unite#mappings#do_action('preview')<CR>
  imap <buffer> <C-w>     <Plug>(unite_delete_backward_path)
  " Start insert.
  let g:unite_enable_start_insert = 1
endfunction"}}}

let g:unite_source_file_mru_limit = 200

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
let g:miniBufExplUseSingleClick=1

":MtでMiniBufExplorerの表示トグル
command! Mt :TMiniBufExplorer

" spaceで次のbufferへ。back-spaceで前のbufferへ
nmap <C-BS> :MBEbn<CR>

hi MBENormal ctermfg=0 ctermbg=255
hi MBEChanged ctermfg=0 ctermbg=255
hi MBEVisibleNormal  ctermfg=255 ctermbg=0 cterm=bold
hi MBEVisibleChanged ctermfg=255 ctermbg=0 cterm=bold
autocmd BufNew -MiniBufExplorer- setl nocursorline

"------------------------------------
" Ysurround
"------------------------------------
" s, ssで選択範囲を指定文字でくくる
nmap s <Plug>Ysurround
nmap ss <Plug>Yssurround


"------------------------------------
" QuickRun
"------------------------------------

let g:quickrun_config = {}
let g:quickrun_config['_'] = {'split' : ''}
let g:quickrun_config['ruby.rspec'] = {'command': 'spec'}
let g:quickrun_config['ruby.test'] = {'command': 'ruby', 'cmdopt': '-I test', 'runmode' : 'async:vimproc'}
let g:quickrun_config['ruby.runner'] = {'command': 'ruby', 'cmdopt': './script/runner', 'runmode' : 'async:vimproc'}
let g:quickrun_config['java'] = {
\   'exec': ['javac -encoding utf-8 %o %s', '%c %s:t:r %a', ':call delete("%S:t:r.class")'],
\   'output_encode': '&termencoding',
\ }

augroup RubyTest
  autocmd!
  autocmd BufWinEnter,BufNewFile *_test.rb set filetype=ruby.test
augroup END


"------------------------------------
" DirDiff
"------------------------------------
let g:DirDiffExcludes = "CVS,.*.swp,.svn,*.log,*.tmp"




"------------------------------------
" Utilities
"------------------------------------
nmap <Leader>% :let @+=(expand("%:p") . ":" . line("."))<CR>


