#!/bin/bash
curl -m 60 --retry 20 http://www.meizitu.com/sitemap.xml >sitemap.xml
cat sitemap.xml | grep -o "http.*.html" > htmlurl.txt
while read line; do
    curl -m 60 --retry 20 $line |grep -a -P -o "http://pic.*?\.jpg" |grep -v "limg.jpg" >> urls.txt
done < htmlurl.txt

while read line ; do
    echo $line
    dir=`echo $line |sed -n "s#http:.*uploads/\(.*\)/\(.*\)/\(.*\)/.*#\1-\2-\3#p"`
    echo ${dir}
    wget -P ${dir} -t 10 -T 30 -N $line
done < urls.txt
