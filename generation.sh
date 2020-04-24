#!/bin/bash

#this variable take the first arguments of generation.sh
valueTick=$1
valuefile=$2
valueAcces=$3
valuefileError=$4

#this line create all discovery
mkdir -p $HOME/$valuefile
touch $HOME/$valuefile/$valueAcces
touch $HOME/$valuefile/$valuefileError


# take code tick value and send sensor ( sensor take error and send message error in stdout )
./tick $1 | ./sensorData 2>&1 | {
	while IFS= read -r RAW_LINE;do

		raw=$(echo $RAW_LINE | cut -d ";" -s -f4)

		# check message with m character in message check acces and error
		if [[ $raw == m* ]]; then

			text1=$(echo $RAW_LINE | cut -d ";" -s -f1)

			text2=$(echo $RAW_LINE | cut -d ";" -s -f2)

			text3=$(echo $RAW_LINE | cut -d ";" -s -f3)

			text4=$(echo $RAW_LINE | cut -d ";" -s -f5)

			mytext=$(echo "User : $USER , IDuser : $INVOCATION_ID  , SensorID : $text1 , SensorName : $text2 , Value : $text3 , MaxValue : $text4 ")

			echo $mytext >> $HOME/$2/$3

		else 
			echo "erreur value $text1 , name : $text2" >> $HOME/$2/$4
		fi

	done
}
