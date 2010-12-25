"gvimrc

if has('gui_macvim')
	colorscheme macvim
	set background=light
	hi SpecialKey guifg=#aaaaaa

	set guifont=Monaco:h11
	set guifontwide=Monaco:h11

	set cmdheight=1
	set showtabline=2 " タブを常に表示
	set transparency=0 " 透明度を指定
	set guioptions-=T

	call g:restore_window_size()
endif

