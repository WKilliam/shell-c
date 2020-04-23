#!/bin/bash

#this variable take the first arguments of generation.sh
valueTick=$1
valueCountG=0
valueCountE=0

#./tick $1 | ./sensorData 2>&1
./tick $1 | ./sensorData 2>&1 | {
	while IFS= read -r RAW_LINE;do

		#echo "la ligne = $RAW_LINE"

		raw=$(echo $RAW_LINE | cut -d ";" -s -f4)

		#echo "ici je test raw = $raw" 

		#echo $RAW_LINE | cut -d ";" -s -f4


		echo "$raw"

		if [[ $raw == M* ]]; then
			echo $RAW_LINE >> good.log
		fi

	done
}
#./tick $1 1> value  | ./sensorData value
