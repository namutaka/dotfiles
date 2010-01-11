"gvimrc

colorscheme desert
if has('gui_macvim')
    set showtabline=2 " タブを常に表示
    set imdisable " IMを無効化
    set transparency=0 " 透明度を指定
    map <silent> gw :macaction selectNextWindow:
    map <silent> gW :macaction selectPreviousWindow:
    "defaults write org.vim.MacVim MMOpenFilesInTabs yes
    "defaults write org.vim.MacVim MMTerminateAfterLastWindowClosed yes
endif


