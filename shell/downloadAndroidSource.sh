#!/bin/bash
#下载指定android分支的源码
branch=$1
echo "branch name: $branch"
if [[ ! -n $branch ]] ; then
    echo "Useage : ./autoGetAndroidSource <branch>"
    exit -1 ;
fi
basepath=`dirname $0`

set -v on
if [[ ! -d $branch ]] ; then
    echo "mkdir $branch";
    mkdir $branch;
fi
cd $branch;
echo "current dir : `pwd`";
if [[ -d .repo ]] && [[ -z .repo ]] ; then
    rm -rf .repo;
fi
if [[ ! -d .repo ]]; then
    while true; do
      repo init -u https://android.googlesource.com/platform/manifest -b $branch && break;
    done
fi
if [[ ! -f "NOTE.txt" ]]; then
    echo start at `date` > NOTE.txt
fi
while true; do
    repo sync && break;
    echo restart at `date`
done
if [[ -n `grep "finish" NOTE.txt` ]]; then
    echo update at `date` >> NOTE.txt
else
    echo finish at `date` >> NOTE.txt
fi
