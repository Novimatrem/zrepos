cd $(dirname $0); pwd
perl -e 'open IN, "</usr/share/dict/words";rand($.) < 1 && ($n=$_) while <IN>;print $n' > randword.txt
