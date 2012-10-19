" for java

setl tabstop=4
setl shiftwidth=4
setl expandtab

"set errorformat=%Z%f:%l:\ %m,%A%p^,%-G%*[^sl]%.%#
"set makeprg=/opt/qcom/jdk6/jdk1.6.0_23/bin/javac\ -sourcepath\ src\ %\ 2>&1\ \\\|\ vim-javac-filter
setl efm=%A\ %#[javac]\ %f:%l:\ %m,%-Z\ %#[javac]\ %p^,%-C%.%#
setl makeprg=ant\ compile\ 2>&1

