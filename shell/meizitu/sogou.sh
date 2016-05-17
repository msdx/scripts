#!/bin/bash
rm sogou.txt
touch sogou.txt

function getId() {
    echo $1
    result=`curl http://bizhi.sogou.com/cate/getCate/4/$1`
    min_id=`echo $result |grep -o "min_wp_id.:\"[0-9]*"|grep -o "[0-9]*"`
    echo $result |grep -o "wp_id.:\"[0-9]*" |grep -o "[0-9]*" >> sogou.txt
    echo $min_id
    echo $min_id > min_id
}

getId 347938
rtn=`cat min_id`

echo -n "Get All Id"
for((i=1; i<=100; i++)); do
    echo "return value >>$rtn<<"
    if [ $rtn ] && [ $rtn -ge 0 ] ; then
        getId $rtn
        rtn=`cat min_id`
    else
        break;
    fi
done

echo -n "Get Image Url"
rm sogouimg.txt
touch sogouimg.txt
for line in `cat sogou.txt` ; do curl http://bizhi.sogou.com/detail/info/$line |grep -o "http://.*/[0-9]\{5,10\}.jpg" -m 1 >> sogouimg.txt ; done;

echo -n "Start Download"
wget -i sogouimg.txt -P sogou -t10 -T30 -N
