#!/bin/bash
name=$1
maxPage=$2
for i in {2..$maxPage}; do curl "http://$1.tumblr.com/page/"$i/ |grep -o "<img src.*\"" |grep  "[^(com)]/tumblr" |grep -o "http[^\"]*" |xargs wget -t15 -T20 ||break; done


