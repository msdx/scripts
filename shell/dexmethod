#统计apk中的dex一共有多少个方法
cat $1 |head -c 92 |tail -c 4 |hexdump -e '1/4 "%d\n"'
