#!/bin/bash
if [ -z "$1" ]
then
  echo "Usage: `basename $0` arg"
  echo "   arg - can be a part of a name, surname or a title you want to search for (case-insensitive)"
  exit 1
fi
wget -O- -q http://inf.ug.edu.pl/plan/pracownicy.php | egrep -e '<nobr>[^<]*</nobr>' -o | tac  | sed -e 's/<[^>]*>//g' | sed -e '{
N
N
s/\n/ /g}' | sed -e 's/<[^>]*>//g' | grep -i -e "$1"
