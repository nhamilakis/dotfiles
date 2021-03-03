#!/usr/bin/env bash

FILE="audio.wav"
if [ ! -z $1 ]; then
  FILE=$1
fi

if [ ! ${file: -4} == ".wav" ]; then
  FILE="$FILE.wav"
fi

# record audio
gst-launch-1.0 -e autoaudiosrc ! audioconvert ! wavenc ! filesink location=/tmp/audio_tmp.wav


if [ -f /tmp/audio_tmp.wav ]; then
    mv /tmp/audio_tmp.wav $FILE
fi