"
" dein.vim 初期設定
"

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'

" Required:
if &runtimepath !~# '/dein.vim'
  " プラグインがなければgit clone
  let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" Required:
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " TOML 読み込み
  let g:config_dir = g:vim_home_path . '/setup'
  call dein#load_toml(g:config_dir . '/plugins.toml', {'lazy': 0})
  " call dein#load_toml(g:config_dir . '/plugins_lazy.toml', {'lazy': 1})

  " Required:
  call dein#end()
  call dein#save_state()
  autocmd VimEnter * call dein#call_hook('post_source')
endif

" 常にhook_source実行
call dein#call_hook('source')

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
"End dein Scripts-------------------------

