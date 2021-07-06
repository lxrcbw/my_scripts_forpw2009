#!/usr/bin/env bash

# 脚本作者 ：  落魄书生
# 更新时间 ：  2021/6/29
# 脚本功能：   JD v3 & v4 对接 JDC

tm=$(date +"%Y-%m-%d %H:%M:%S")
echo "$tm 开始下载cookie-list ！"
wget -q --no-check-certificate https://sm.lpssxs.com/cookie.db -O /jd/sample/cookie.db

tm=$(date +"%Y-%m-%d %H:%M:%S")
echo "$tm 下载Cookie-list 完成 ！"

notify="/jd/notify.js"
jd_v34_config="/jd/config/config.sh"
jd_ql_ck_list="/jd/sample/cookie.db"
ql_ck="/jd/sample/ql_ck.list"
jd_ck="/jd/sample/jd_ck.list"
tmp_ck_list="/jd/sample/temp_update_ck.list"


awk -F '"' '{print $4 }' /jd/sample/cookie.db > /jd/sample/ql_ck.list
awk -F ';' '{print $2 }' /jd/sample/cookie.db > /jd/sample/ql_id.list

grep "pt_key=AA" /jd/config/config.sh > /jd/sample/jd_vck.list

awk -F '"' '{print $2 }' /jd/sample/jd_vck.list > /jd/sample/jd_ck.list
awk -F ';' '{print $2 }' /jd/sample/jd_vck.list > /jd/sample/jd_id.list



# 遍历 v3/4 config.sh ， 查看有没有需要更新的 ck


        for line in `cat $ql_ck`

            do 
			
			ql_ck_id=${line#*;}
            
            
			ql_ck_value=${line%%;*}
            

            ck_id_check_result=`cat ${jd_v34_config} | grep "${ql_ck_id}"`
            

            cat ${jd_v34_config} | grep ${ql_ck_id} > /jd/sample/temp_update_ck_2.list
			awk -F '"' '{print $2 }' /jd/sample/temp_update_ck_2.list >  /jd/sample/temp_update_ck.list

            if [[ "$ck_id_check_result" != "" ]];then

				tm=$(date +"%Y-%m-%d %H:%M:%S")
                echo -e "$tm 老用户存在，检查是否需要更新CK "

                line_id=`sed -n "/${ql_ck_id}/=" ${jd_v34_config}`
                old_ck_value=`awk -F ';' '{print $1 }' "${tmp_ck_list}"`
				
				if [[ "$old_ck_value" != "$ql_ck_value" ]];then
				
				ck_num=${ck_id_check_result%%\"*}
                new_ck="${ck_num}\"$ql_ck_value;$ql_ck_id\""
				
				tm=$(date +"%Y-%m-%d %H:%M:%S")
				echo "$tm 旧cookie : $ck_id_check_result"
				echo "$tm 新cookie : $new_ck"
				
				tm=$(date +"%Y-%m-%d %H:%M:%S")
				echo -e "$tm 新旧cookie不同，准备更新 v3/4 cookie \n"
				
				sed -i "${line_id} d" ${jd_v34_config}
				sed -i "${line_id} i ${new_ck}" $jd_v34_config

				tm=$(date +"%Y-%m-%d %H:%M:%S")
				echo "$tm $ck_num$ql_ck_id CK更新成功！"
				node $notify  "CK更新通知：" "${ck_num}${ql_ck_id} CK更新成功！"
				
				fi
				
				tm=$(date +"%Y-%m-%d %H:%M:%S")
				echo -e "$tm 新旧CK相同，无需更新CK！"
				
            fi

            

            done
			tm=$(date +"%Y-%m-%d %H:%M:%S")
			echo "$tm 扫描 JDC-ck 结束，下次启动时间为1小时后 ！"








