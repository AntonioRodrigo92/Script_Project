#!/bin/bash
read file
i=1
d=$(cat $file | wc -l)
b=$(($d+1))
while [ $i -lt $b ]; do

	titulo1=$(cat $file | cut -d ':' -f1 | head -$i | tail -1)
	artista1=$(cat $file | cut -d ':' -f2 | head -$i | tail -1)
	ii=1
	dd=$(cat musicas.txt | wc -l)
	bb=$((dd+1))
	templinefile=$(cat $file | head -$i | tail -1)


	while [ $ii -lt $bb ]; do
		templinemusicas=$(cat musicas.txt | head -$ii | tail -1)
		titulo2=$(cat musicas.txt | cut -d ':' -f2 | head -$ii | tail -1)
		artista2=$(cat musicas.txt | cut -d ':' -f3 | head -$ii | tail -1)
			if [ "$(cat musicas.txt | head -$ii | tail -1 | grep "$titulo1:$artista1" | wc -l)" -eq "1" ]; then
				mus=$(cat musicas.txt | cut -d ':' -f1 | head -$ii | tail -1)

 
				sed -i "s/$templinemusicas/$mus:$templinefile/" musicas.txt
			fi
			if [ "$(grep "$titulo1:$artista1" musicas.txt | wc -l)" -ne "1" ]; then
				aux=$(cat musicas.txt | wc -l)
				aux=$(($aux+1))
				dd=$aux
				bb=$(($dd+1))

				echo "MUS_$aux:$templinefile" >> musicas.txt
			fi
		ii=$(($ii+1))
		
	done
	i=$(($i+1))
done

