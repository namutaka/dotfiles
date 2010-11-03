"gvimrc

if has('gui_macvim')
	colorscheme macvim
	set background=light
	hi SpecialKey guifg=#aaaaaa

	set guifont=Monaco:h11
	set guifontwide=Monaco:h11

	set cmdheight=1
	set showtabline=2 " タブを常に表示
	set imdisable " IMを無効化
	set transparency=0 " 透明度を指定
	map <silent> gw :macaction selectNextWindow:<CR>
	map <silent> gW :macaction selectPreviousWindow:<CR>

  map <silent> gt :tabnext<CR>
  map <silent> gT :tabprev<CR>
  map <silent> <C-Tab> :bn<CR>
  map <silent> <C-S-Tab> :bp<CR>

	call g:restore_window_size()

	" ime設定
	set noimdisable

	set guioptions-=T
endif

