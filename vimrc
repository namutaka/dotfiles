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


" パス設定
set runtimepath+=$HOME/.vim
set path+=~/
let g:vimball_home = expand("~/.vim/bundle/vimball")
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
set foldmethod=syntax
set foldlevel=1000

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
au QuickfixCmdPost make,grep,grepadd,vimgrep copen

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
map <silent> <C-Tab> ;bn<CR>
map <silent> <C-S-Tab> ;bp<CR>
map <silent> gt ;tabnext<CR>
map <silent> gT ;tabprev<CR>

" 頻出文字入力
nmap <Leader><Space> a<Space><ESC>
nmap <Leader><CR> o<ESC>

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
augroup CollectWritePre
  autocmd!
  autocmd BufWritePre * ;%s/\s\+$//ge
augroup END
command! ResetWritePre autocmd! CollectWritePre

" バッファを閉じる
nnoremap <Leader>q :BufferClose<CR>

" grep.vim settings
let Grep_Find_Use_Xargs = 0

" DirDiff
let g:DirDiffExcludes = "CVS,.*.swp,.svn,*.log,*.tmp"

" }}}


" Plugins {{{
set nocompatible               " be iMproved
filetype off                   " required!

set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'grep.vim'
Bundle 'project.tar.gz'
"Bundle 'AutoComplPop'
Bundle 'Align'
Bundle 'banyan/recognize_charcode.vim'
Bundle 'tyru/current-func-info.vim'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/vimproc'
Bundle 'scrooloose/nerdcommenter'
Bundle 'kana/vim-operator-user'
Bundle 'msanders/cocoa.vim'
Bundle 'msanders/snipmate.vim'

" Git
Bundle 'tpope/vim-fugitive'
Bundle 'digitaltoad/vim-jade'

" vim-smartword : 単語移動がスマートな感じで
Bundle 'smartword'

" camelcasemotion : CamelCaseやsnake_case単位でのワード移動
Bundle 'camelcasemotion'

" eregex.vim : vimの正規表現をrubyやperlの正規表現な入力でできる :%S/perlregex/
Bundle 'eregex.vim'

" coffiee
Bundle  'kchmck/vim-coffee-script'


" open-blowser.vim {{{
Bundle 'tyru/open-browser.vim'

" カーソル下のURLをブラウザで開く
nmap fu <Plug>(openbrowser-open)
vmap fu <Plug>(openbrowser-open)
" カーソル下のキーワードをググる
nnoremap fs :<C-u>OpenBrowserSearch<Space><C-r><C-w><CR>
vnoremap fs "xy:<C-u>OpenBrowserSearch<Space><C-R>x<CR>
" }}}


" operator-replace.vim {{{
Bundle 'kana/vim-operator-replace'
" RwなどでYankしてるもので置き換える
nmap <C-p> <Plug>(operator-replace)
" }}}


" vim-ref.vim {{{
Bundle 'thinca/vim-ref'
let g:ref_source_webdict_sites = {}
let g:ref_source_webdict_sites['lio'] = {'url' : 'http://ejje.weblio.jp/content/%s'}
" }}}

" vimshell {{{
Bundle 'Shougo/vimshell'
"let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
"let g:vimshell_right_prompt = 'vimshell#vcs#info("(%s)-[%b]", "(%s)-[%b|%a]")'
let g:vimshell_enable_smart_case = 1

if has('win32') || has('win64') " {{{
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
endif "}}}

function! g:my_preexec(cmdline, context) "{{{
  if a:cmdline =~# '^\s*diff\>'
    call vimshell#set_syntax('diff')
  endif
  return a:cmdline
endfunction "}}}

autocmd FileType vimshell
\ call vimshell#altercmd#define('g', 'git')
\| call vimshell#altercmd#define('i', 'iexe')
\| call vimshell#altercmd#define('l', 'll')
\| call vimshell#altercmd#define('ll', 'ls -l')
\| call vimshell#hook#set('preexec', ['g:my_preexec'])

command! Vs ;VimShell
command! -nargs=? -complete=dir Vsi ;VimShellInteractive <args>

" <Leader>is: シェルを起動
nnoremap <silent> <Leader>is :VimShell<CR>
" <Leader>ipy: pythonを非同期で起動
nnoremap <silent> <Leader>ipy :VimShellInteractive python<CR>
" <Leader>irb: irbを非同期で起動
nnoremap <silent> <Leader>irb :VimShellInteractive irb<CR>
" <Leader>ss: 非同期で開いたインタプリタに現在の行を評価させる
nnoremap <silent> <Leader>ss <S-v>:VimShellSendString<CR>
" 選択中に<Leader>ss: 非同期で開いたインタプリタに選択行を評価させる
vnoremap <silent> <Leader>ss :VimShellSendString<CR>

" }}}


" unite.vim {{{
Bundle 'Shougo/unite.vim'

" The prefix key.
nnoremap    [unite]   <Nop>
nmap    <C-q>  [unite]

nnoremap [unite]u  :<C-u>Unite -no-split<Space>
nnoremap <silent> [unite]a  :<C-u>UniteWithCurrentDir -no-split -buffer-name=files buffer file_mru bookmark file<CR>
nnoremap <silent> [unite]f  :<C-u>Unite -no-split -buffer-name=files file<CR>
nnoremap <silent> [unite]b  :<C-u>Unite -no-split buffer<CR>
nnoremap <silent> [unite]m  :<C-u>Unite -no-split file_mru<CR>

" nnoremap <silent> [unite]b  :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings() "{{{
  " Overwrite settings.
  imap <buffer> jj      <Plug>(unite_insert_leave)
  nnoremap <silent><buffer> <C-k> :<C-u>call unite#mappings#do_action('preview')<CR>
  imap <buffer> <C-w>     <Plug>(unite_delete_backward_path)
  " Start insert.
  let g:unite_enable_start_insert = 1
endfunction "}}}

let g:unite_source_file_mru_limit = 200
" }}}


" MiniBufExplorer {{{
Bundle 'fholgado/minibufexpl.vim'

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
nmap <BS> ;MBEbp<CR>
nmap <C-BS> ;MBEbn<CR>

hi MBENormal ctermfg=0 ctermbg=255
hi MBEChanged ctermfg=0 ctermbg=255
hi MBEVisibleNormal  ctermfg=255 ctermbg=0 cterm=bold
hi MBEVisibleChanged ctermfg=255 ctermbg=0 cterm=bold
autocmd BufNew -MiniBufExplorer- setl nocursorline
" }}}


" Ysurround {{{
Bundle 'tpope/vim-surround'
" s, ssで選択範囲を指定文字でくくる
nmap s <Plug>Ysurround
nmap ss <Plug>Yssurround
" }}}


" QuickRun {{{
Bundle 'thinca/vim-quickrun'

let g:quickrun_config = {}
let g:quickrun_config['_'] = {'split' : ''}
let g:quickrun_config['ruby.rspec'] = {'command': 'rspec', 'cmdopt': '-d -fs',}
let g:quickrun_config['ruby.test'] = {'command': 'ruby', 'cmdopt': '-I test', 'runmode' : 'async:vimproc'}
let g:quickrun_config['ruby.runner'] = {'command': 'ruby', 'cmdopt': './script/runner', 'runmode' : 'async:vimproc'}
let g:quickrun_config['java'] = {
\   'exec': ['javac -encoding utf-8 %o %s', '%c %s:t:r %a', ':call delete("%S:t:r.class")'],
\   'output_encode': '&termencoding',
\ }
let g:quickrun_config['python.android'] = {'command' : 'monkeyrunner' }
let g:quickrun_config['coffee.compile'] = {'command' : 'coffee', 'cmdopt' : '-bpc'}

augroup RubyTest
  autocmd!
  autocmd BufWinEnter,BufNewFile *_test.rb set filetype=ruby.test
  autocmd BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec
augroup END

" }}}


filetype plugin indent on     " required!
" }}}


" vim:ft=vim foldmethod=marker sw=2
