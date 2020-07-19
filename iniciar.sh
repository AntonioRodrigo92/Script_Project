#!/bin/bash
PATH=$PATH:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/opt/bin
#echo "0 0 * * * $HOME/public_html/statsHTML.sh" > $HOME/cronometro.txt
echo "0 0 * * *  $HOME/publica_playlists.sh" > $HOME/cronometro.txt
crontab $HOME/cronometro.txt
