"gvimrc

if has('gui_macvim')
	colorscheme macvim
	set background=light
	hi SpecialKey guifg=#aaaaaa

    set showtabline=2 " タブを常に表示
    set imdisable " IMを無効化
    set transparency=0 " 透明度を指定
    map <silent> gw :macaction selectNextWindow:<CR>
    map <silent> gW :macaction selectPreviousWindow:<CR>

    map <silent> gt :tabnext<CR>
    map <silent> gT :tabprev<CR>

	map <silent> <C-e> :tabclose<CR>
endif

