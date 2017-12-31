#!/bin/sh

set -e

[ -d $SNAP_DATA/www ] || cp -a $SNAP/share/mjpg-streamer/www $SNAP_DATA/
[ -f $SNAP_DATA/config ] || cp -a $SNAP/config $SNAP_DATA/

. $SNAP_DATA/config

MACHINE=$(uname -m)
case "$MACHINE" in
  x86_64)
    ARCH="x86_64-linux-gnu"
    ;;
  i686)
    ARCH="i386-linux-gnu"
    ;;
  armv7l)
    ARCH="arm-linux-gnueabihf"
    ;;
  aarch64)
    ARCH="aarch64-linux-gnu"
    ;;
  *)
    echo "ERROR: Unknown architecture $ARCH"
    exit 1
    ;;
esac

export LD_LIBRARY_PATH="$SNAP/lib/mjpg-streamer:$SNAP/usr/lib/$ARCH:$SNAP/usr/lib/$ARCH/pulseaudio:$LD_LIBRARY_PATH"

if [ "$1" = "-d" ]; then
    if [ "$DAEMON" = "true" ]; then
        mjpg_streamer -i "input_uvc.so $INPUTOPTS" -o "output_http.so -w $SNAP_DATA/www $PORT"
    else
        exit 0
    fi
else
    mjpg_streamer "$@"
fi
