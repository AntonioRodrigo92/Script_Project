#!/bin/bash

echo -n "Nome da playlist: "
read p

if grep $p  playlists.txt; then
 echo "playlist existe"
else
 echo nao existe
 exit 0
fi

aux=$(cat playlists.txt | grep $p |tr ":" "\n" | tail +3)
for mus in $aux
do 
 echo "$mus"
done

echo -n "Musicas a serem removidas: "
read rm

linhaOriginal=$(cat playlists.txt | grep "$p")
m=$(cat ouvintes.txt | grep -w "$p" | cut -d ':' -f5 )
linhaRemover=$(cat playlists.txt | grep "$p" | sed -E "s/:$rm//")
grep $p playlists.txt | sed -e "s/$linhaOriginal/$linhaRemover/g" -i  playlists.txt
count=$(cat playlists.txt | grep "$p" | tr ":" " " | wc -w)
echo $count
aux=''
aux2=2
if [ $count = $aux2 ]; then
 sed -e "s/$linhaRemover/$aux/g" -i playlists.txt
 sed -e "s/:$p/$aux/g" -i ouvintes.txt
 echo "Envia email para" $m "Conteudo: foi apagada a playlist" $p "que estava associada aos ouvintes">>emails.txt
fi 


