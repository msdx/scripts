curl "http://sexy.faceks.com/sitemap.xml" |grep -o "http://.*post/.\{14\}" |xargs curl -m 60 --retry 20 |grep "bigimgsrc" |grep -o "http://imglf.*.jpg" > faceks.txt;
wget -i faceks.txt -P faceks -t 10 -T 30 -N


