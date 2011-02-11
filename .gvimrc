"gvimrc

if has('gui_macvim')
	source ~/.vim/colors/my_macvim_color.vim

	set guifont=Monaco:h12
	set guifontwide=Monaco:h12

	set cmdheight=1
	set showtabline=2 " タブを常に表示
	set transparency=0 " 透明度を指定
	set guioptions-=T

	call g:restore_window_size()
endif

