#! /bin/sh
# Written by David

 cat a.txt | tr -d '\r' > t.txt
 cat t.txt | tr -s '\n' 'j' >t1.txt
 sed 's/。j/。\n/g;s/？j/？\n/g;s/！j/！\n/g;s/“j/”\n/g;s/j//g' t1.txt
