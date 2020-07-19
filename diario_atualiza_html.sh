#!/bin/bash
PATH=$PATH:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/opt/bin
rm $HOME/cronometro.txt
touch $HOME/cronometro.txt
echo -n "diga a hora a atualizar (em formato hh:mm): "
read hora
echo $hora > temporario.txt
h=$(cat temporario.txt | cut -d ':' -f1)
m=$(cat temporario.txt | cut -d ':' -f2)
	
if [ $h -ge 0 ] && [ $h -le 23 ] && [ $m -ge 0 ] && [ $m -le 59 ]; then
	rm temporario.txt
	#echo "$m $h * * * $HOME/public_html/statsHTML.sh" > $HOME/cronometro.txt
	echo "$m $h * * * $HOME/publica_playlists.sh" > $HOME/cronometro.txt
	crontab $HOME/cronometro.txt
else
	echo "formato errado"
	rm temporario.txt
fi

