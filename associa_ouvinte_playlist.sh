#!/bin/bash

echo -n "Nickname do ouvinte:"
read  nick

if grep "$nick:" ouvintes.txt; then
 echo ouvinte existe
else 
 echo ouvinte nao existe
 exit 0
fi

echo -n "Playlist "
read play

if grep "$play" playlists.txt; then
 echo "playlist existe"
else 
 echo nao existe
 exit 0
fi

var=$(cat ouvintes.txt | grep "$nick")
var2=$(cat playlists.txt| grep $play | cut -d ":" -f1)
var3="${var}:$var2"

if grep $var2 ouvintes.txt; then
 echo "ouvinte ja tem esta playlist"
else 
 grep $nick | sed -e "s/$var/$var3/g" -i ouvintes.txt
 exit 0
fi


