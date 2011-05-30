" for java

set tabstop=4
set shiftwidth=4
set expandtab

"set errorformat=%Z%f:%l:\ %m,%A%p^,%-G%*[^sl]%.%#
"set makeprg=/opt/qcom/jdk6/jdk1.6.0_23/bin/javac\ -sourcepath\ src\ %\ 2>&1\ \\\|\ vim-javac-filter
set efm=%A\ %#[javac]\ %f:%l:\ %m,%-Z\ %#[javac]\ %p^,%-C%.%#
set makeprg=ant\ compile\ 2>&1

