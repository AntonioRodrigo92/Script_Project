#!/bin/bash
echo -n "Nome da playlist? "
read p

if grep  "$p:" playlists.txt; then
 echo "A playlist $p ja existe"
 exit 0
fi


cat musicas.txt
count=$(cat playlists.txt|wc -l) 
i=$(($count+1))
str="PL_$i:$p"

arg=1
echo -n "Musicas?"
read v
 
echo $str":"$v | tr " " ":"  >> playlists.txt

