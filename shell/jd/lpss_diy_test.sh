#!/usr/bin/env bash

# 脚本作者 ：  lpssxs
# 更新时间 ：  2021/5/10 

#以下脚本主要适用 jd docker v3 & v4  , jd_ql 暂时无法使用
#下载后请放于  /jd/config/ 目录下
#赋予脚本执行权限 chmod +x /jd/config/lpss_diy.sh
#建议手动添加以下计划任务 */10 * * * * bash /jd/config/lpss_diy.sh >> /jd/log/lpss_diy.log 2>&1


# 下载需要添加的脚本 link 

#wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/my_scripts/main/js_code/sendNotify_5.js -O /jd/sendNotify.js 
wget -q --no-check-certificate  https://raw.githubusercontent.com/forpw2009/my_scripts/main/js_code/jd_unsubscribe_2.js -O /jd/scripts/jd_unsubscribe_2.js
wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/my_scripts/main/js_code/jd/jd_super_redrain.js -O /jd/scripts/jd_super_redrain.js
wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/my_scripts/main/js_code/jd/jd_half_redrain.js -O /jd/scripts/jd_half_redrain.js
wget -q --no-check-certificate https://raw.githubusercontent.com/monk-coder/dust/dust/car/adolf_ETIP.js -O /jd/scripts/jd_adolf_ETIP.js
wget -q --no-check-certificate https://jdsharedresourcescdn.azureedge.net/jdresource/jd_syj.js -O /jd/scripts/jd_syj.js 


my_cron_file="/jd/config/crontab.list"
chmod 666 $my_cron_file

#添加需要添加的脚本 name
my_scripts_list_add="
lpss_diy
jd_super_redrain
jd_half_redrain
jd_unsubscribe_2
jd_adolf_ETIP
jd_syj
"

#添加需要添加脚本的 cron
lpss_diy="*/10 * * * * bash /jd/config/lpss_diy.sh >> /jd/log/lpss_diy.log 2>&1"
jd_super_redrain="0 0-23/1 * * * jd jd_super_redrain"
jd_half_redrain="30 20-23/1 * * * jd jd_half_redrain"
jd_unsubscribe_2="45 22 * * * jd jd_unsubscribe_2"
jd_adolf_ETIP="15 8 9-31 5 * jd jd_adolf_ETIP"
jd_syj="10 0,7,23 * * * jd jd_syj"


#添加需要删除的脚本的 name
my_scripts_list_del=""



#遍历 my_scripts_list_add 进行添加
for npc_scripts in $my_scripts_list_add

    do 

          sc_result=$(cat /jd/config/crontab.list | grep "${npc_scripts}")

            if [[ "$sc_result" != "" ]];then
                echo -e "${npc_scripts} 脚本计划任务已存在，检查是否需要更新计划任务～ \n"
                
                #取行号
                line_id=`sed -n "/${npc_scripts}/=" ${my_cron_file}`
                echo “$line_id”
                old_cron=`cat $my_cron_file | grep "$npc_scripts"`
                echo “$old_cron”
                eval new_cron=\${${npc_scripts}}
                echo “$new_cron”
                
                #判断是否需要更新计划任务
                if [ "$old_cron" = "$new_cron" ];then       
                    echo -e "${npc_scripts} 新旧计划任务相同，无需更新～ \n"
                else
                    echo -e "正在更新 ${npc_scripts} 脚本计划任务 ～ \n"
                    sed -i "${line_id} d" ${my_cron_file}
                    sed -i "${line_id} i ${new_cron}" $my_cron_file
                    crontab /jd/config/crontab.list
                    echo -e " ${npc_scripts} 脚本计划任务更新完成 ～ \n"
                
                fi
            else
                echo -e "${npc_scripts} 脚本计划任务不存在，准备更新～ \n"
                eval npc_cron=\${${npc_scripts}}
                echo "$npc_cron" >> /jd/config/crontab.list
                crontab /jd/config/crontab.list
                echo -e "${npc_scripts} 脚本添加完成～ \n"
            fi
    done

    #遍历 my_scripts_list_del 进行删除~





cp -rf  /jd/sendNotify.js /jd/scripts
echo -e "多用户推送脚本更新完成!!!\n"

cp -rf  /jd/home.html /jd/panel/public
echo -e "Home cookies 按钮修复完成!!!\n"

#执行完毕后自动更新 lpss_diy.sh 
echo -e "自动更新 lpss_diy 中～～～ \n"
wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/my_scripts/main/shell/jd/lpss_diy_test.sh -O /jd/config/lpss_diy_test.sh && chmod +x /jd/config/lpss_diy_test.sh
echo -e "lpss_diy 脚本自动更新完成，感谢使用 (下次更新时间为10min后) ～ \n"







