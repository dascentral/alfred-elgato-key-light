#!/usr/bin/env bash

lights[0]="10.0.0.20"
lights[1]="10.0.0.22"

port="9123"

for item in "${lights[@]}"; do
    curl --location --request PUT 'http://'"$item"':'"$port"'/elgato/lights' \
        --header 'Content-Type: application/json' \
        --data-raw '{"lights":[{"on":0}],"numberOfLights":1}'
    echo ""
done
