# 注：目前网易lofter已经屏蔽了不能运行js的客户端的响应
for i in {1..50}; do curl "http://me2-sex.lofter.com/tag/美媛馆?page="$i |grep -o "http://imglf.*.jpg" |xargs wget ||break;done;


