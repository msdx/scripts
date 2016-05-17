#!/bin/sh
#压缩文件夹为7z格式，如果该文件夹大于4G，则分卷压缩
size=`du -s $1 |awk '{printf $1}'`
if [ $size -ge 4194304 ]; then
  args="-v4g"
fi
7z a -t7z $args $1.7z $1/ -mx=9 -ms=200m -mf -mhc -mhcf -r
