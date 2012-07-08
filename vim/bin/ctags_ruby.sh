#!/bin/bash

RUBY_PATHS=$(ruby -e 'a=$LOAD_PATH.dup;a.delete(".");print a.join(" ")')
RUBY_PATHS+=" $(gem environment gemdir)"
echo $RUBY_PATHS | xargs ctags -f ~/.vim/tags/ruby.tags -R --langmap=RUBY:.rb


