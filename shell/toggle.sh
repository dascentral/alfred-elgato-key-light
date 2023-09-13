#!/usr/bin/env bash

port="9123"

lights[0]="10.0.0.20"
lights[1]="10.0.0.22"

lightsOn() {
    for item in "${lights[@]}"; do
        curl -s -L -X PUT 'http://'"$item"':'"$port"'/elgato/lights' \
            --header 'Content-Type: application/json' \
            --data-raw '{"lights":[{"brightness":30,"temperature":186,"on":1}],"numberOfLights":1}'
        echo ""
    done
}

lightsOff() {
    for item in "${lights[@]}"; do
        curl -s -L -X PUT 'http://'"$item"':'"$port"'/elgato/lights' \
            --header 'Content-Type: application/json' \
            --data-raw '{"lights":[{"on":0}],"numberOfLights":1}'
        echo ""
    done
}

# this script assumes all lights will be linked
# determine status of the first light
response=$(curl -s -X GET 'http://'"${lights[0]}"':'"$port"'/elgato/lights')

if [ $? != 0 ]; then
    echo "Curl request failed."
    exit 1;
fi

if [[ $response == *"\"on\":1"* ]]; then
    lightsOff
else
    lightsOn
fi
