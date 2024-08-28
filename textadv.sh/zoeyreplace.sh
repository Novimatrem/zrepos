#!/bin/bash
# zoeyreplace.sh

# requires snap install dm-tools

#echo "requires snap install dm-tools"
#echo ""
#echo "ZOEY REPLACEMENT SCRIPT STARTS"
#echo ""

array[0]="meow"
array[1]="nya"
array[2]="wife"
array[3]="futa"
array[4]="Jan"
array[5]="Lachti"
array[6]="Jasmine"
array[7]="Theo"
array[8]="zoey"
array[9]="life"
array[10]="love"
array[11]="care"

size=${#array[@]}
index=$(($RANDOM % $size))


function randword {
WORDFILE=/usr/share/dict/words
# seed random from pid
RANDOM=$$;
# using cat means wc outputs only a number, not number followed by filename
lines=$(cat $WORDFILE  | wc -l);
rnum=$((RANDOM*RANDOM%$lines+1));
sed -n "$rnum p" $WORDFILE;
}


# PRINT THE FIRST WORD (DICT)
printf %s "$(randword)" | tr [:upper:] [:lower:] | fold -w 99999 | sed "s/'s.*//" | tr -s " "

# PRINT THE SECOND WORD (CUSTOM)
printf %s " " $(echo ${array[$index]} ) && printf %s ""


dm-tools.plebs | grep problem: | sed 's/^[ \t]*//' | tr [:upper:] [:lower:] | fold -w 99999 | sed "s/'s.*//" | tr -s " " | sed -e "s/^problem://"

#echo ""



# echo 'espeak -p 66 -s 150 "'


#echo ""





