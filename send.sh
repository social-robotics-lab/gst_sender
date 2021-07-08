#! /bin/bash
if [ $# -lt 2 ]
then
  echo "Usage: ./gst_send.sh host port"
  exit
fi
gst-launch-1.0 -v autovideosrc !  videoconvert ! videoscale ! video/x-raw,width=320,height=240 ! jpegenc ! rtpjpegpay ! udpsink host=$1 port=$2
