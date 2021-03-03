#!/bin/bash

FILE="video.mkv"
if [ ! -z $1 ]; then
  FILE=$1
fi

if [ ! ${file: -4} == ".mkv" ]; then
  FILE="$FILE.mkv"
fi


# record video
gst-launch-1.0 -e autovideosrc ! videoconvert ! matroskamux ! filesink location=recording.mkv


if [ -f /tmp/video_tmp.mkv ]; then
    mv /tmp/video_tmp.mkv $FILE
fi