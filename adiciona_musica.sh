#!/bin/bash
echo -n "nome da musica?"
read nome
echo -n "artista?"
read art
echo -n "duracao?"
read dur
echo -n "ano?"
read ano
echo -n "genero?"
read gen
i=0
if [ "$(grep "$nome:$art" musicas.txt | wc -l)" -eq "1" ]; then
	echo "musica ja existe"
	exit
else
	count=$(cat musicas.txt|wc -l)
	i=$(($count+1))
	echo "MUS_$i:$nome:$art:$dur:$ano:$gen: ">>musicas.txt
fi

