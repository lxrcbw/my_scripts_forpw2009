#!/usr/bin/env bash

stime=$(date +"%Y-%m-%d %H:%M:%S")

#同步 lxk scripts 脚本

if [ ! -d "/jd/pro/" ];then
  mkdir /jd/pro/
  echo "$stime : pro 文件夹创建完成，准备更新 lxk scripts "
  else
  echo "$stime : pro 文件夹已经存在，准备更新 lxk scripts "
fi

cd /jd/pro/

git clone https://ghproxy.com/https://github.com/forpw2009/lpss_scripts.git

cp -rf /jd/pro/lpss_scripts/lxk/*.js /jd/scripts/

rm -rf /jd/pro/lpss_scripts/

etime=$(date +"%Y-%m-%d %H:%M:%S")
echo "$etime : 更新 lxk scripts 完成 "