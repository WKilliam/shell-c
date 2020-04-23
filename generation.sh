#!/bin/bash

#this variable take the first arguments of generation.sh
valueTick=$1

#./tick $1 | ./sensorData 2>&1
./tick $1 | ./sensorData 2>&1 | {
	while IFS= read -r RAW_LINE;do
		echo "ligne = $RAW_LINE"
	done
}
#./tick $1 1> value  | ./sensorData value
