#! /bin/bash

##获取时间戳
current=`date "+%Y-%m-%d %H:%M:%S"`  
timeStamp=`date -d "$current" +%s`   
#将current转换为时间戳，精确到毫秒  
currentTimeStamp=$((timeStamp*1000+`date "+%N"`/1000000))
echo "时间戳: $currentTimeStamp"

git add .
git commit -m "工作区更新时间：$current"
git push -u origin master

echo '更新成功'

