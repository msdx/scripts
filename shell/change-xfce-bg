#!/bin/bash
#随机修改我的xfce终端的背景
dir="/home/haohang/tmp/meizitu/dofay"
count=`ls $dir |wc -l`
rand=`awk 'BEGIN{srand();print rand()}'`
rand=`echo $rand \* $count + 1 | bc | awk -F. '{printf $1}'`

bg=`ls $dir|head -n $rand |tail -n 1 |sed "s:^:$dir/:"`
#gconftool-2 --type string --set /apps/gnome-terminal/profiles/Profile0/background_image $bg
#gnome-terminal --window-with-profile=custom
sed -i "s#BackgroundImageFile=.*#BackgroundImageFile=${bg}#" ~/.config/xfce4/terminal/terminalrc


