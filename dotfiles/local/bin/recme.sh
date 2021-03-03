#!/usr/bin/env bash

FILE="out.mkv"
if [ ! -z $1 ]; then
  FILE=$1
fi


# 1)   We get video feed from webcam using autovideosrc.

# 2)   Next, we place that feed in it's own thread by outputing it into queue.

# 3)  Video feed from queue goes to videoconvert where it is converted (I'm not sure is this step necessary).

# 4)  Finally, video feed goes into element named mkv, which is of type matroskamux.
#     This element converts video feed to Matroska.

# 5)  After that we get audio feed using autoaudiosrc.

# 6)  We place feed from autoaudiosrc in another thread using queue.

# 7)  From queue audio goes to audioconvert where it is converted (also not sure if necessary).

# 8)  Converted audio goes to the same matroskamux element mkv. Here audio feed is converted to Matroska.

# 9)  Since both audio and video feed go to the same element, they are merged into one Matroska feed.

# 10) At last, that Matroska feed is saved to a file using filesink.
#     You'll probably have to set sync=false if your computer isn't a beast.


# record audio & video
gst-launch-1.0 -e autovideosrc ! queue ! videoconvert ! mkv. autoaudiosrc ! queue ! audioconvert ! mkv. matroskamux name=mkv ! filesink location=/tmp/tmp.mkv sync=false


if [ -f /tmp/tmp.mkv ]; then
    mv /tmp/tmp.mkv $FILE
fi