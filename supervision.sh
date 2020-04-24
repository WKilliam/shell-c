#!/bin/bash

valueTick=$1
dossiervalue=$2
fileAcces=$3
fileError=$4

#lancement de generation.sh
while ./generation.sh $1 $2 $3 $4 &;do
#nohup {{./generation.sh $1 $2 $3 $4 &}}
#while true;do

valuetext=$(ls -l $HOME/$2/$3 | cut -d " " -f5)

echo $valuetext

#compress file of check size  
	if [[ $valuetext -lt 2500 ]];then
		echo "good"
	else
#		pgrep generation | xargs kill
		echo "nop"
#		$HOME/$2/ tar cvf archiveLog.tar $3 $4
	fi
	sleep 1
done
