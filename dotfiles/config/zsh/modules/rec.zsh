#!/usr/bin/env zsh


function rec () {
    location="$HOME/Videos/rec"
    mkdir -p $location
    count="$(ls $location | wc -l)"
    # echo "$location/video_$count.mkv"
    recme.sh "$location/video_$count.mkv"
}

function audio-rec () {
    location="$HOME/Music/rec"
    mkdir -p $location
    count="$(ls $location | wc -l)"
    # echo "$location/video_$count.mkv"
    rec_audio.sh "$location/video_$count.mkv"
}

function image-rec () {
    location="$HOME/Pictures/rec"
    mkdir -p $location
    count="$(ls $location | wc -l)"
    # echo "$location/video_$count.mkv"
    rec_video.sh "$location/video_$count.mkv"
}