#!/bin/bash

#this variable take the first arguments of generation.sh
valueTick=$1
valueCountG=0
valueCountE=0

#./tick $1 | ./sensorData 2>&1
./tick $1 | ./sensorData 2>&1 | {
	while IFS= read -r RAW_LINE;do

		echo "la ligne = $RAW_LINE"

		raw=$(echo $RAW_LINE | cut -d ";" -s -f4)

		#echo "ici je test raw = $raw" 

		#echo $RAW_LINE | cut -d ";" -s -f4


		echo "$raw"

		if [[ $raw == m* ]]; then

			text1=$(echo $RAW_LINE | cut -d ";" -s -f1)

			text2=$(echo $RAW_LINE | cut -d ";" -s -f2)

			text3=$(echo $RAW_LINE | cut -d ";" -s -f3)

			text4=$(echo $RAW_LINE | cut -d ";" -s -f5)

			mytext=$(echo "SensorID : $text1 , SensorName : $text2 , Value : $text3 , MaxValue : $text4 ")


			echo $mytext  > acces.log

		else 
			echo $RAW_LINE > error.log
		fi

	done
}
