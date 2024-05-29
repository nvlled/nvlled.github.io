#!/bin/bash

cd `dirname $(readlink $0)`

filename=`date +"%Y-%m-%d-%H:%M:%S.jpg"`

flags=${1:--s}
scrot -q 60 -f -i "../pages/screenshots/$filename" -z $flags

if [ "$?" = 0 ]; then
    notify-send screenshot $filename
fi

