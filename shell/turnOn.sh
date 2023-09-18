#!/usr/bin/env bash

lights[0]="10.0.0.20"
lights[1]="10.0.0.22"

port="9123"

brightness=$1
if [ -z "$brightness" ]; then
    brightness="30"
fi

temperature=$2
if [ -z "$temperature" ]; then
    temperature="186"
fi

if [ $# == 0 ]; then
    for item in "${lights[@]}"; do
        curl --location --request PUT 'http://'"$item"':'"$port"'/elgato/lights' \
            --header 'Content-Type: application/json' \
            --data-raw '{"lights":[{"brightness":'"$brightness"',"temperature":'"$temperature"',"on":1}],"numberOfLights":1}'
        echo ""
    done
fi
