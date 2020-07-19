#!/bin/bash

echo "----------MENU----------"
echo "1. Cria Ouvinte"
echo "2. Adiciona Musica"
echo "3. Atualiza Musica"
echo "4. Cria Playlist"
echo "5. Associa Ouvinte a Playlist"
echo "6. Remove Musica da Playlist"
echo "7. Mostra Estatisticas"
echo "8. Publica Playlists"
echo "9. Atualização diária HTML"
echo "0. Sair"

chmod 755 iniciar.sh
./iniciar.sh

chmod 755 cria_ouvinte.sh
chmod 755 adiciona_musica.sh
chmod 755 atualiza_musicas.sh
chmod 755 cria_playlist.sh
chmod 755 associa_ouvinte_playlist.sh
chmod 755 remove_musica_playlist.sh
chmod 755 stats.sh
chmod 755 publica_playlists.sh
chmod 755 diario_atualiza_html.sh

echo -n "selecionar opção: "
read x

while [ $x -ne 0 ]; do
	if [ $x -eq 1 ]; then
		echo -n "indique nickname, pass, numero de aluno e curso "
		read ouvinte
		./cria_ouvinte.sh $ouvinte
	elif [ $x -eq 2 ]; then
		./adiciona_musica.sh
	elif [ $x -eq 3 ]; then
		./atualiza_musicas.sh
    elif [ $x -eq 4 ]; then
        ./cria_playlist.sh
	elif [ $x -eq 5 ]; then
	   	./associa_ouvinte_playlist.sh
	elif [ $x -eq 6 ]; then
	    ./remove_musica_playlist.sh
	elif [ $x -eq 7 ]; then
        ./stats.sh
    elif [ $x -eq 8 ]; then
        ./publica_playlists.sh
   	elif [ $x -eq 9 ]; then
        ./diario_atualiza_html.sh
    fi
	echo -n "selecionar opção: "
    read x
done

