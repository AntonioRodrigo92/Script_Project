#!/bin/bash
if [ $(grep $3 /etc/passwd) -n ]; then
	echo "aluno nao existe no tigre"
	exit
fi
aux=""
if [ "$4" = "ETI" ] || [ "$4" = "LEI" ] || [ "$4" = "IGE" ]; then
	aux=$4
else
	echo "O aluno tem de ser de LEI, ETI ou IGE"
	exit
fi
if [ "$(grep $3 ouvintes.txt | wc -l)" -eq "1" ]; then
	echo "o aluno ja existe no ficheiro ouvintes.txt"
	exit
fi
echo "$(grep $1 ouvintes.txt | wc -l)"
if [ "$(grep $1 ouvintes.txt | wc -l)" -eq "1"  ]; then
	echo "O nickname ja existe"
	exit
fi
echo "$1:$2:$(grep $3 /etc/passwd | awk -F '[:,]' '{print $5}'):a$3@iscte-iul.pt:$aux:$5" >> ouvintes.txt

