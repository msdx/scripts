#!/bin/bash
#统计git项目中我增加或删除的行数，包括总行数，24小时内的行数，今天的行数
function count() {
    local insert=0
    local delete=0
    while read line ;do
        current=`echo $line| grep -oP '\d+(?= insertions)'`
        if [[ -n $current ]]; then 
            insert=`expr $insert + $current`
        fi
        current=`echo $line | grep -oP '\d+(?= deletions)'`
        if [[ -n $current ]]; then
            delete=`expr $delete + $current`
        fi
    done < .tmp.count
    echo "$insert insertions, $delete deletions"
}

function countAll() {
    git log --author=msdx --shortstat --pretty=format:"" | sed /^$/d >.tmp.count
    count;
    rm .tmp.count
}

function countToday() {
    local current=`date +%s`;
    local begin=`date +%Y-%m-%d |xargs date +%s -d`;
    local seconds=$(($current - $begin));

    git log --author=msdx --since="$seconds seconds ago" --shortstat --pretty=format:"" | sed /^$/d >.tmp.count
    count;
    rm .tmp.count

}

function countOneDay() {
    git log --author=msdx --since="1 days ago" --shortstat --pretty=format:"" | sed /^$/d >.tmp.count
    count;
    rm .tmp.count

}

if [[ ! -n $1 ]] || [[ $1 = "all" ]] ; then 
    countAll;
elif [[ $1 = "oneday" ]]; then
    countOneDay;
elif [[ $1 = "today" ]]; then
    countToday;
else
    echo "args: all | oneday | today";
fi
