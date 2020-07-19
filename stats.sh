#!/bin/bash
#echo "--------------------STATS-----------------------"

echo "numero de ouvintes: " 
cat ouvintes.txt | wc -l
echo "numero de musicas: "
cat musicas.txt | wc -l
echo "numero de playlists: "
cat playlists.txt | wc -l
echo "tempo total de duraçao: "
cat musicas.txt | cut -d ':' -f4 | awk 'BEGIN{t=0} {t=t+$1; print t}' | tail -1

echo -n "selecionar playlist: "
read lista
if [ $( grep -w $lista playlists.txt ) ]; then
	num=$(cat playlists.txt | grep -w $lista | tr ":" "\n" | tail +3 | wc -l)
	echo $num "musicas"

else
	echo "a playlist não existe"
fi


echo "ouvintes por curso:"
#ov=$(cat  ouvintes.txt | awk '{print $NF}' | sort | uniq -c | awk '{print $2,":", $1}')

ov=$(cat ouvintes.txt | cut -d ':' -f6 | sort | uniq -c | awk '{print $2, $1}')
echo $ov

