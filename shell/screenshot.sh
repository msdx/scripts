#对当前连接的android设备进行截屏，并输出到电脑上
screen()
{
    local FILE=HD`date +%Y%m%d-%H%M%S`;
    [ -n "$1" ] && FILE="$1";
    echo Save in ~/tmp/$FILE.PNG;
    adb shell /system/bin/screencap -p /sdcard/test.png && adb pull /sdcard/test.png ~/tmp/$FILE.png;
}
screen
