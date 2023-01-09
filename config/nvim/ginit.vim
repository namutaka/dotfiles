" ginit.vim

colorscheme desert

"set guifont=IPAGothic:h15,Osaka-Mono:h15
"set guifontwide=IPAGothic\ for\ Powerline:h15,Osaka-Mono:h15
"set guifont=Osaka-Mono:h15
"set guifontwide=Osaka-Mono:h15

set guifont=Monaco:h16

set linespace=2

set cmdheight=1
set showtabline=2 " タブを常に表示
"set transparency=0 " 透明度を指定
set guioptions-=T
set guioptions-=a

map <silent> gw :macaction selectNextWindow:<CR>
map <silent> gW :macaction selectPreviousWindow:<CR>

call Restore_window_size()

source ~/.config/nvim/macmap.vim

