curl "http://sexy.faceks.com/sitemap.xml" |grep -o "http://.*post/.\{14\}" |xargs curl |grep "bigimgsrc" |grep -o "http://imglf.*.jpg" |xargs wget -t10 -T15

