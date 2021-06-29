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



# 遍历 v3/4 config.sh ， 查看有没有需要更新的 ck

#for jd_id in $jd_v34_config

#    do 

        for ql_id in $ql_ck

            do 

            ql_ck_id=`awk -F ';' '{print $2 }' "$ql_id" `
            ql_ck_value=`awk -F ';' '{print $1 }' "$ql_id" `

            ck_id_check_result=`cat ${jd_v34_config} | grep "${ql_ck_id}"`

            if [[ "$ck_id_check_result" != "" ]];then
            echo -e " 老用户存在，检查是否需要更新ck_value "

            echo "$ql_ck_id"
            echo "$ql_ck_value"
            echo "$ck_id_check_result"

            else 

            fi 

            

            done

#    done






