#!/bin/bash
date;
echo "ctags done......"
find -L . -name  "*.h" -o -name "*.c" -o -name "*.cc" -o -name "*.cpp" -o -name "*.py" > cscope.files;
find -L . -name "*.pl" >>cscope.files

date;
cscope -RCbq -i cscope.files;
ctags -R -L cscope.files;
echo "cscope done......"
date;
