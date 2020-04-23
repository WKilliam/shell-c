#!/bin/bash

valueTick=$1
dossiervalue=$2
fileAcces=$3
fileError=$4

./generation.sh $1 $2 $3 $4 &

valuetext=sudo ls -l $HOME/$2/$3 | cut -d " " -f5

#valuetails=$($HOME/log/acces.log | cut -d " " -f5) 

#echo $valuetext
while $valuetext < 50000;do
if [[ $valuetext < 2000 ]];then
echo $valuetext
fi
done

#if [[ "$valuetails" > 200 ]];then
#	echo "YOOOOOOOOOOO"
#fi
