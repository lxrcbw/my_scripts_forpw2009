#!/usr/bin/env bash

# 脚本作者 ：  落魄书生
# 更新时间 ：  2021/6/29
# 脚本功能：   JD v3 & v4 对接 JDC


jd_v34_config="/root/jd/config/config.sh"
jd_ql_ck_list="/root/ql/db/cookie.db"
ql_ck="/root/jd/ql_ck.list"
jd_ck="/root/jd/jd_ck.list"


awk -F '"' '{print $4 }' /root/ql/db/cookie.db > /root/jd/ql_ck.list
awk -F ';' '{print $2 }' /root/ql/db/cookie.db > /root/jd/ql_id.list

grep "pt_key=AA" /root/jd/config/config.sh > /root/jd/jd_vck.list

awk -F '"' '{print $2 }' /root/jd/jd_vck.list > /root/jd/jd_ck.list
awk -F ';' '{print $2 }' /root/jd/jd_ck.list > /root/jd/jd_id.list



for id in $jd_ck

    do 

        jd_ck_id=`awk -F ';' '{print $2 }' "$id" `
        jd_ck_value=`awk -F ';' '{print $1 }' "$id" `
        echo "$jd_ck_id"
        echo "$jd_ck_value"

    done






