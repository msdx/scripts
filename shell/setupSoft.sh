#安装git curl fcitx输入法
#安装系统之后，需要安装的软件
echo "install git, curl, git-flow";
sudo apt-get install -y git curl git-flow 

#安装IBUS五笔输入法
echo "install wubi input method";
sudo apt-get install -y fcitx im-switch fcitx-table-wbpy
sudo im-switch -s fcitx
im-switch -s fcitx

#安装eclipse
#echo "install ecilpse";
#sudo apt-get install -y eclipse

#安装gradle
echo "install Java, Gradle";
sudo apt-get install -y openjdk-7-jdk gradle

#安装mysql
#echo "install mysql"
#sudo apt-get install mysql-server

#sudo apt-get install -y samba subversion 
#firefox -url "http://blog.csdn.net/maosidiaoxian/article/details/22372403"
#sudo vi /etc/samba/smb.conf

sudo apt-get install -y vim

#sudo apt-get install -y synergy

#sudo apt-get install -y libstdc++6:i386 libgcc1:i386 zlib1g:i386 libncurses5:i386

#sudo add-apt-repository ppa:peterlevi/ppa
#sudo apt-get update

#sudo apt-get install -y variety
