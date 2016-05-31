#!/bin/bash
#$1 tumblr二级域名
#$2 最大下载页数
for i in {2..$2}; do curl "http://$1.tumblr.com/page/"$i/ |grep -o "<img src.*\"" |grep  "[^(com)]/tumblr" |grep -o "http[^\"]*" |xargs wget -t15 -T20 ||break; done


