#!/bin/bash
curl --user-agent "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:33.0) Gecko/20100101 Firefox/33.0" http://www.mzitu.com/all |grep -o "http:\/\/www.mzitu.com\/[0-9]\+" > all.txt

while read line ; do
    dir=`echo $line |sed -n "s/http:.*\///p"`
    touch ${dir}.txt
    i=1;
    curl --user-agent "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:33.0) Gecko/20100101 Firefox/33.0" -m 30 --retry 20 $line > tmp.html
    cat tmp.html |grep -o -P "img src.*\".*" |grep -o -P "http.*?\.(jp|pn)g" -m 1 >${dir}.txt
    hasNext=`cat tmp.html|grep "下一页"`
    while [[ -n "$hasNext" ]]; do
        i=$(($i+1))
        curl --user-agent "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:33.0) Gecko/20100101 Firefox/33.0"  -m 30 --retry 20 $line/$i > tmp.html
        cat tmp.html |grep -o -P "img src.*\".*" |grep -o -P "http.*?\.(jp|pn)g" -m 1>>${dir}.txt
        hasNext=`cat tmp.html |grep "下一页"`
    done
    wget -nv -i ${dir}.txt -P ${dir} -t 10 -T 30 -N
    rm ${dir}.txt
    echo "休息一秒钟"
    sleep 1
done < all.txt
rm tmp.html

