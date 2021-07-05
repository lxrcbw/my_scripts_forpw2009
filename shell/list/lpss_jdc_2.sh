#!/usr/bin/env bash

# 脚本作者 ：  落魄书生
# 更新时间 ：  2021/6/29
# 脚本功能：   JD v3 & v4 对接 JDC

echo " 开始下载cookie list "
wget -q --no-check-certificate https://sm.lpssxs.com/cookie.db -O /jd/sample/cookie.db
echo " cookie list 下载完成"

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
			
			echo "$line"

            
			ql_ck_id=${line##*;}
            echo "$ql_ck_id"
            
			ql_ck_value=${line%%;*}
            echo "$ql_ck_value"

            ck_id_check_result=`cat ${jd_v34_config} | grep "${ql_ck_id}"`
            echo "$ck_id_check_result"

            cat ${jd_v34_config} | grep ${ql_ck_id} > /jd/sample/temp_update_ck.list
            cat /jd/sample/temp_update_ck.list

            if [[ "$ck_id_check_result" != "" ]];then

                echo -e "老用户存在，检查是否需要更新ck_value "

                line_id=`sed -n "/${ql_ck_id}/=" ${jd_v34_config}`
                old_ck_value=`awk -F '"' '{print $2 }' "${tmp_ck_list}"`
				
				if [[ "$old_ck_value" != "$ql_ck_value" ]];then
				
				ck_num=${ck_id_check_result%%\"*}
                new_ck="${ck_num}\"$ql_ck_value;$ql_ck_id;\""
				
				echo "旧cookie : $ck_id_check_result"
				echo "新cookie : $new_ck"
				echo -e "新旧cookie不同，准备更新 v3/4 cookie \n"
				
				#sed -i "${line_id}c ${new_ck}" ${jd_v34_config} 

                echo -e "v3/4 cookie 更新成功！"
				
				fi

                echo "$line_id"
                echo "$ck_num"
                echo "$new_ck"
                echo "$ql_ck_id"
                echo "$old_ck_value"
                echo "$ql_ck_value"
                echo "$ck_id_check_result"
 

            fi

            

            done








