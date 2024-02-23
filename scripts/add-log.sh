#!/bin/bash

cd `dirname $(readlink $0)`

if [[ -z "$1" ]]; then
    now=`date "+%Y-%m-%d %H:%M"`
    echo -e "\n@$now" "$@" "\n" >> ../logs.txt
fi

nvim +"execute 'normal G'" ../logs.txt
