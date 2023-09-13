#!/usr/bin/env bash

port="9123"

# declare array of lights
lights[0]="10.0.0.20"
lights[1]="10.0.0.22"

# if an argument exists, manage that individual light
if [ $# == 1 ]; then
    curl --location --request PUT 'http://'"$1"':'"$port"'/elgato/lights' \
         --header 'Content-Type: application/json' \
         --data-raw '{"lights":[{"brightness":30,"temperature":186,"on":1}],"numberOfLights":1}'
fi

# if no arguments exist, loop through lights
if [ $# == 0 ]; then
    for item in "${lights[@]}"; do
        curl --location --request PUT 'http://'"$item"':'"$port"'/elgato/lights' \
            --header 'Content-Type: application/json' \
            --data-raw '{"lights":[{"brightness":30,"temperature":186,"on":1}],"numberOfLights":1}'
        echo ""
    done
fi

