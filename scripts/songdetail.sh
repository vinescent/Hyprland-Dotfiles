#!/bin/bash

song_info=$(playerctl -p spotify metadata --format "$status {{title}}      {{artist}}")

echo "$song_info"
