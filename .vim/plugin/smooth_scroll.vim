" ==========================================
" Smooth Scroll modified by namutaka
" 2011/01/18
" ==========================================

" Smooth Scroll
"
" Remamps
"  <C-U>
"  <C-D>
"  <C-F>
"  <C-B>
"
" to allow smooth scrolling of the window. I find that quick changes of
" context don't allow my eyes to follow the action properly.
"
" The global variable g:scroll_factor changes the scroll speed.
"
"
" Written by Brad Phelan 2006
" http://xtargets.com
"
"
"
if has('gui_macvim')
  finish
endif

let g:scroll_factor = 5000
let g:scroll_skip_size = 1
function! SmoothScroll(dir, windiv, factor)
   let wh=winheight(0)
   let i=0
   let j=0
   while i < wh / a:windiv
      let t1=reltime()
      let i = i + 1
      if a:dir=="d"
         if line('w$') == line('$')
           break
         endif
         normal j
      else
         if line('w0') == 1
           break
         endif
         normal k
      end

      if j >= g:scroll_skip_size
        let j = 0
        redraw
        while 1
           let t2=reltime(t1,reltime())
           if t2[1] > g:scroll_factor * a:factor
              break
           endif
        endwhile
      else
        let j = j + 1
      endif
   endwhile
endfunction
nmap <C-D> :call SmoothScroll("d",2, 2)<CR>
nmap <C-U> :call SmoothScroll("u",2, 2)<CR>
nmap <C-F> :call SmoothScroll("d",1, 1)<CR>
nmap <C-B> :call SmoothScroll("u",1, 1)<CR>

