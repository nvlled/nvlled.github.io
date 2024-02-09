#!/bin/bash

cd `dirname $(readlink $0)`

now=`date "+%Y-%m-%d %H:%M"`
echo -e "\n@$now" "$@" "\n" >> ../logs.txt
nvim +"execute 'normal G'" ../logs.txt
