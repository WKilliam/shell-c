#!/bin/bash

valueTick=$1
dossiervalue=$2
fileAcces=$3
fileError=$4

#start  generation.sh
./generation.sh $1 $2 $3 $4 &


while true;do

valuetext=$(ls -l $HOME/$2/$3 | cut -d " " -f5)

echo $valuetext

#compress file of check size with condition check size file acces and error
	if [[ $valuetext -lt 640 ]];then
		echo "good"
	else
		pgrep generation | xargs kill
		echo "nop"
		cd $HOME/$2/
		echo ls -l | wc $3 | cut -d "" -f1 
		#echo cat $4 | wc -l
	       	tar -cvf archiveLog.tar $3 $4

		rm -r *.log
		cd -
		./generation.sh $1 $2 $3 $4 &
	fi
	sleep 1
done
