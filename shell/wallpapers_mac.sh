#!/bin/bash
for i in `seq 1 1359`; do echo "page…$i"; for url in `curl https://wallpapershome.com/\?page\=$i |grep -o "a href=\"/[^\"]*.html" |sed -n 's/a href="/https:\/\/wallpapershome.com/p'|xargs curl -e "https_proxy=192.168.1.3:1080" -s -N |grep -o "/images[^\"]*/pic_[^\"]*.jpg"`; do wget -P `echo $url | grep -o "[^/]\+_[vh]"` -t 10 -T 10 -N https://wallpapershome.com$url; done; done;
