#!/bin/bash
if [ -z "$1" ]
then
  echo "Usage: `basename $0` arg [s]"
  echo "   arg - can be a part of a name, surname or a degree to search for"
  echo "   s   - if given, the search will be case-sensitive"
  exit 1
fi
int=$(wget -O- -q http://inf.ug.edu.pl/plan/pracownicy.php | egrep -e '<nobr>[^<]*</nobr>' -o | tac  | sed -e '{
N
N
s/\n/ /g}' -e 's/<[^>]*>//g');
if [ -z "$2" ]
then
echo "$int" | grep -i -e "$1";
else
echo "$int" | grep -e "$1";
fi
