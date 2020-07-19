#!/bin/bash
dest=($HOME/public_html/stats.html)

#echo "estamos no stats html"
#OUVINTES!!!
#rm stats.html

echo "<html>" > $dest
echo	"<head>" >> $dest
echo		"<meta charset="UTF-8">" >> $dest
echo		"<title>Ouvintes e playlists da aplicaçao Spotify-IUL</title>" >> $dest
echo	"</head>" >> $dest

echo	"<body>" >> $dest
i=1
a=$(cat ouvintes.txt | wc -l)
while [ $i -le $a ]; do

	nick=$(cat ouvintes.txt | head -$i | tail +$i | cut -d ':' -f1)
echo		"<h1>Nickname: "$nick"</h1>" >> $dest
	
	PLToColumn=$(cat ouvintes.txt | head -$i | tail +$i | tr ":" "\n" | tail +7)


	userI=1
	userA=$(cat ouvintes.txt | head -$i | tail +$i | tr ":" "\n" | tail +7 | wc -l)
	while [ $userI -le $userA ]; do
		PL=$(cat ouvintes.txt | head -$i | tr ":" "\n" | tail +7 | head -$userI | tail +$userI)




		#PLAYLISTS!!!
	
		ii=1
		aa=$(cat playlists.txt | grep $PL | wc -l )
		while [ $ii -le $aa ]; do

#			musPL=$(cat playlists.txt | grep $PL | tr ":" "\n" | tail +3 | head -$ii | tail +$ii)



			nomePL=$(cat playlists.txt | grep $PL | head -$ii | tail +$ii | cut -d ':' -f2)


echo		"<h2>Playlist: "$nomePL"</h2>" >> $dest
	
			#MUSICAS!!!


			iii=1
			aaa=$(cat playlists.txt | grep $nomePL | tr ":" "\n" | tail +2 | wc -l)
			while [ $iii -lt $aaa ]; do

				musPL=$(cat playlists.txt | grep $PL | tr ":" "\n" | tail +3 | head -$iii | tail +$iii)				


				titulo=$(cat musicas.txt | grep $musPL | cut -d ':' -f2)
				artista=$(cat musicas.txt | grep $musPL | cut -d ':' -f3)
				duracao=$(cat musicas.txt | grep $musPL | cut -d ':' -f4)
				ano=$(cat musicas.txt | grep $musPL | cut -d ':' -f5)
				genero=$(cat musicas.txt | grep $musPL | cut -d ':' -f6)
				top=$(cat musicas.txt | grep $musPL | cut -d ':' -f7)





echo		"<ol>" >> $dest
				echo "<li><strong>" $titulo "</strong> -<i> Artist: </i>" $artista";<i> Duration: </i>"$duracao "min; </i> Year: </i>" $ano";<i> Genre: </i>" $genero";<i> Top Position: </i>"$top "</li>" >> $dest
echo		"</ol>" >> $dest
					
				iii=$(( iii+1 ))
			done		

			ii=$(( ii+1 ))
		done

		userI=$(( userI+1 ))
	done
	
	i=$(( i+1 ))
done

	echo "</body>" >> $dest
echo "</html>" >> $dest


