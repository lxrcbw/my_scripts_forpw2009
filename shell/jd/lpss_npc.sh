#!/usr/bin/env bash

# 脚本作者 ：  落魄书生
# 更新时间 ：  2021/6/13

#以下脚本主要适用 jd docker v4, jd_ql 暂时无法使用
#下载后请放于  /jd/pro/ 目录下
#赋予脚本执行权限 chmod +x /jd/pro/lpss_npc.sh
#建议手动添加以下计划任务 */10 * * * * bash /jd/pro/lpss_npc.sh >> /jd/log/lpss_npc.log 2>&1


#定义变量参数和相关路径
my_cron_file="/jd/config/crontab.list"
my_config_file="/jd/config/config.sh"
notify="/jd/notify.js"
my_notify="/jd/sendNotify.js"
my_sendNotify_file="/jd/sendNotify.js"
my_ver_str=`cat ${my_config_file} | grep "Version"`
my_docker_str=`cat ${my_config_file} | grep "NPCTL"`
my_download_str=`cat ${my_config_file} | grep "DWCTL"`
my_ver_id=${my_ver_str: 12: 2}
my_docker_id=${my_docker_str: 10: 7}
my_download_flag=${my_download_str: 10: 5}
target_ver_id="v4"

#赋予脚本修改权限
chmod 666 $my_cron_file
chmod 666 /jd/sendNotify.js

echo "你好，你当前使用JD Docker 版本：$my_ver_id"
echo "你好，你当前使用JD Docker ID： $my_docker_id"
echo -e "你好，你当前Download Flag是：$my_download_flag \n"


if [ $my_download_flag = "trues" ];then

	echo -e "开始更新 home.html & sendNotify.js 文件\n"
	wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/my_scripts/main/html/home.html  -O /jd/home.html
	wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/my_scripts/main/js_code/sendNotify.js -O /jd/sendNotify.js 
	wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/my_scripts/main/shell/jd/lpss_del_log.sh -O /jd/pro/lpss_del_log.sh  && chmod +x /jd/pro/lpss_del_log.sh
    wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/my_scripts/main/shell/jd/export_sharecodes.sh -O /jd/export_sharecodes.sh && chmod +x /jd/export_sharecodes.sh
	
	#更新推送ck

	my_tg_token_str=`cat ${my_config_file} | grep "TG_BOT_TOKEN"`
	my_tg_id_str=`cat ${my_config_file} | grep "TG_ID"`
	#my_tg_user_id_str=`cat ${my_config_file} | grep "TG_USER_ID"`

	my_dd_token_str=`cat ${my_config_file} | grep "DD_BOT_TOKEN"`
	my_dd_sc_str=`cat ${my_config_file} | grep "DD_BOT_SECRET"`

	my_push_token_str=`cat ${my_config_file} | grep "PUSH_PLUS_TOKEN"`
	my_push_sc_str=`cat ${my_config_file} | grep "PUSH_PLUS_USER"`


	#TG
	sed -i "s/TG_BOT_TOKEN = ''/${my_tg_token_str}/g" ${my_sendNotify_file}
	sed -i "s/TG_ID = ''/${my_tg_id_str}/g" ${my_sendNotify_file}
	#sed -i "s/TG_USER_ID = ''/${my_tg_user_id_str}/g" ${my_sendNotify_file}
	#DD
	sed -i "s/DD_BOT_TOKEN = ''/${my_dd_token_str}/g" ${my_sendNotify_file}
	sed -i "s/DD_BOT_SECRET = ''/${my_dd_sc_str}/g" ${my_sendNotify_file}

	#push
	sed -i "s/PUSH_PLUS_TOKEN = ''/${my_push_token_str}/g" ${my_sendNotify_file}
	sed -i "s/PUSH_PLUS_USER = ''/${my_push_sc_str}/g" ${my_sendNotify_file}

	sed -i "s/JD-FLC/$my_docker_id/g" $my_notify

	cp -rf /jd/sendNotify.js /jd/scripts/
	echo -e "多用户推送脚本更新完成!!!\n"


	cp -rf  /jd/home.html /jd/panel/public
	echo -e "Home cookies 按钮修复完成!!!\n"
	
else
	echo -e "无需更新 home.html & sendNotify.js 文件\n"
fi 


# 下载需要添加的脚本 link 

wget -q --no-check-certificate https://raw.githubusercontent.com/jiulan/platypus/main/scripts/jd_ffl.js -O /jd/scripts/jd_ffl.js
wget -q --no-check-certificate https://ghproxy.com/https://raw.githubusercontent.com/xl2101200/-/main/jdmn.js -O /jd/scripts/jdmn.js


#添加需要添加的脚本 name
my_scripts_list_add="
lpss_npc
lpss_del_log
jd_ffl
jdmn
"

#添加需要添加脚本的 cron
lpss_npc="*/10 * * * * bash /jd/pro/lpss_npc.sh >> /jd/log/lpss_npc.log 2>&1"
lpss_del_log="23 23 * * * bash /jd/pro/lpss_del_log.sh >> /jd/log/lpss_del_log.log 2>&1"

jd_ffl="5,35 * * 6 * jd jd_ffl"
jdmn="7 0,8,11,15 * * * jd jdmn"




#添加需要删除的脚本的 name
my_scripts_list_del="
jd_lpss_zoo
"

#awk '{print $NF}' filename



#遍历 my_scripts_list_del 进行删除~

for my_del_scripts in $my_scripts_list_del

    do

      del_result=`cat ${my_cron_file} | grep "${my_del_scripts}"`

        if [[ "$del_result" != "" ]];then

        echo -e "计划删除脚本 ${my_del_scripts} 存在，现在进行删除该脚本计划任务～ \n"
        line_id=`sed -n "/${my_del_scripts}/=" ${my_cron_file}`
        sed -i "${line_id} d" ${my_cron_file}
        crontab /jd/config/crontab.list
        echo -e "${my_del_scripts} 脚本计划任务已删除，请刷新查看~ \n"
		node $notify "失效脚本删除通知：" "${my_del_scripts} 脚本计划任务已删除,请知晓~"
        else
        echo -e "无需删除脚本的计划任务～ \n"
        fi

    done


#遍历 my_scripts_list_add 进行添加
for npc_scripts in $my_scripts_list_add

    do 

          sc_result=`cat ${my_cron_file} | grep "${npc_scripts}"`

            if [[ "$sc_result" != "" ]];then
                echo -e "${npc_scripts} 脚本计划任务已存在，检查是否需要更新计划任务~ \n"
                
                #取行号
                line_id=`sed -n "/${npc_scripts}/=" ${my_cron_file}`
                old_cron=`cat $my_cron_file | grep "$npc_scripts"`
                eval new_cron=\${${npc_scripts}}

                
                #判断是否需要更新计划任务
                if [ "$old_cron" = "$new_cron" ];then       
                    echo -e "${npc_scripts} 新旧计划任务相同，无需更新~ \n"
                else
                    echo -e "正在更新 ${npc_scripts} 脚本计划任务~ \n"
                    sed -i "${line_id} d" ${my_cron_file}
                    sed -i "${line_id} i ${new_cron}" $my_cron_file
                    crontab /jd/config/crontab.list
                    echo -e " ${npc_scripts} 脚本计划任务更新完成~ \n"
                
                fi
            else
                echo -e "${npc_scripts} 脚本计划任务不存在，准备更新~ \n"
                eval npc_cron=\${${npc_scripts}}
                echo "$npc_cron" >> /jd/config/crontab.list
                crontab /jd/config/crontab.list
                echo -e "${npc_scripts} 脚本添加完成~ \n"
				node $notify "新增脚本通知：" "${npc_scripts} 脚本添加完成~"
            fi
    done

#关闭部分脚本助力 
#关闭：jd_cfd , jd_cash , jd_bean_home , jd_jdzz 
#关闭：jd_superMarket , jx_sign , jd_monk_shop_lottery 

sed -i "s/let helpAuthor = true/let helpAuthor = false/g" /jd/scripts/*.js
sed -i "s/const helpAuthor = true/const helpAuthor = false/g" /jd/scripts/*.js
sed -i "s/const helpAu = true/const helpAu = false/g" /jd/scripts/*.js
sed -i "s/let helpAu = true/let helpAu = false/g" /jd/scripts/*.js


#执行完毕后自动更新 lpss_npc.sh 
echo -e "自动更新lpss_npc中~\n"
wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/my_scripts/main/shell/jd/lpss_npc.sh -O /jd/pro/lpss_npc.sh && chmod +x /jd/pro/lpss_npc.sh
echo -e "lpss_pro脚本自动更新完成,感谢使用---下次同步时间为10min后"






