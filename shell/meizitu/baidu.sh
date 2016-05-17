#!/bin/bash
if [ ! -n "$1" ]; then
  exit
fi
search=$1
if [ -n "$2" ]; then
  max=$2
else
  max=1000
fi
row=60
save=1
echo $max
for pn in `seq 0 $row $max`; do
  url="http://image.baidu.com/search/avatarjson?tn=resultjsonavatarnew&ie=utf-8&word=${search}&cg=girl&pn=${pn}&rn=${row}&itg=0&z=0&fr=&width=&height=&lm=-1&ic=0&s=0&st=-1&gsm=1e0000001e"
  echo $url
  curl -m 30 --retry 20 $url\
    |grep -o -P "(?=objURL\"\:\").*?\..*?(?=\")" \
    |grep -o http.* |grep -v "image.niaola.com" > page.txt
  while read line ; do
    echo $save ":" $line
    name=$save`echo $line |sed "s/.*\./\./" |sed "s/?.*//"`
    wget -nv -O $search/$name  -t 3 -T 10 $line
    let save=save+1
  done < page.txt
done
rm page.txt
