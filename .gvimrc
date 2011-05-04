"gvimrc

if has('gui_macvim')
	colorscheme desert
	"source ~/.vim/colors/my_macvim_color.vim

	set guifont=Monaco:h12
	set guifontwide=Monaco:h12

	set cmdheight=1
	set showtabline=2 " タブを常に表示
	set transparency=0 " 透明度を指定
	set guioptions-=T

	call g:restore_window_size()
endif

if has('win32')
	colorscheme desert
	highlight NonText guibg=gray15

	set guifont=ＭＳ\ ゴシック:h10:cSHIFTJIS
	set showtabline=2
	set guioptions-=T
	set cmdheight=1
  set guioptions+=b

	" Windowsの操作をする
	"map <C-c> "+y
	"map <C-v> "+gP
	"map <C-z> u
	"map <A-F4> :qa<CR>
endif
