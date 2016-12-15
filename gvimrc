"gvimrc
scriptencoding utf-8

if has('gui_macvim')
  colorscheme desert
  "source ~/.vim/colors/my_macvim_color.vim

  set guifont=IPAGothic:h15,Osaka-Mono:h15
  set guifontwide=IPAGothic:h15,Osaka-Mono:h15
  set linespace=2

  set cmdheight=1
  set showtabline=2 " タブを常に表示
  set transparency=0 " 透明度を指定
  set guioptions-=T
  set guioptions-=a

  map <silent> gw :macaction selectNextWindow:<CR>
  map <silent> gW :macaction selectPreviousWindow:<CR>

  call Restore_window_size()
endif

if has('win32') || has('gui_gnome')
  colorscheme desert
  highlight NonText guibg=gray15

  if has('win32')
    set guifont=ＭＳ\ ゴシック:h10:cSHIFTJIS
  endif
  if has('gui_gnome')
    set guifont=DejaVu\ Sans\ Mono\ 9
  endif
  set showtabline=2
  set guioptions-=T
  set cmdheight=1
  set guioptions+=b
  set guioptions-=a

endif

