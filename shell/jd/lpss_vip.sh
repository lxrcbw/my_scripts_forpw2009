#!/usr/bin/env bash

# 脚本作者 ：  落魄书生
# 更新时间 ：  2021/5/24

#以下脚本主要适用 jd docker v3 & v4  , jd_ql 暂时无法使用
#下载后请放于  /jd/config/ 目录下
#赋予脚本执行权限 chmod +x /jd/config/lpss_vip.sh
#建议手动添加以下计划任务 */10 * * * * bash /jd/config/lpss_vip.sh >> /jd/log/lpss_vip.log 2>&1


#定义变量参数和相关路径
my_cron_file="/jd/config/crontab.list"
my_config_file="/jd/config/config.sh"
notify="/jd/notify.js"
my_notify="/jd/sendNotify.js"
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

if [ $target_ver_id = $my_ver_id ];then
	echo -e "无需更新 notify 文件~\n"
else
	echo -e "正在更新 notify 文件~\n"
	wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/my_scripts/main/js_code/jd/notify.js -O /jd/notify.js
	echo -e "更新 notify 文件完成~\n"
fi


if [ $my_download_flag = "trues" ];then

	echo -e "开始更新 home.html & sendNotify.js 文件\n"
	wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/my_scripts/main/html/home.html  -O /jd/home.html
	wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/my_scripts/main/js_code/sendNotify.js -O /jd/sendNotify.js 
	wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/my_scripts/main/shell/jd/lpss_del_log.sh -O /jd/config/lpss_del_log.sh  && chmod +x /jd/config/lpss_del_log.sh
    wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/my_scripts/main/shell/jd/export_sharecodes.sh -O /jd/export_sharecodes.sh && chmod +x /jd/export_sharecodes.sh
	echo -e "更新 home.html & sendNotify.js 文件完成\n"
else
	echo -e "无需更新 home.html & sendNotify.js 文件\n"
fi 


# 下载需要添加的脚本 link 

wget -q --no-check-certificate https://ghproxy.com/https://raw.githubusercontent.com/monk-coder/dust/dust/normal/monk_shop_lottery.js -O /jd/scripts/jd_monk_shop_lottery.js
wget -q --no-check-certificate https://jdsharedresourcescdn.azureedge.net/jdresource/jd_syj.js -O /jd/scripts/jd_syj.js 
wget -q --no-check-certificate https://raw.githubusercontent.com/nianyuguai/longzhuzhu/main/qx/jd_super_redrain.js  -O /jd/scripts/jd_npc_redrain.js 
wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/my_scripts/main/js_code/jd/jd_daily_lottery.js -O /jd/scripts/jd_daily_lottery.js
wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/my_scripts/main/js_code/jd/jd_redPacket.js -O /jd/scripts/jd_redPacket.js
wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/lpss_scripts/master/jd_market_lottery.js -O /jd/scripts/jd_market_lottery.js
wget -q --no-check-certificate https://raw.githubusercontent.com/monk-coder/dust/dust/normal/adolf_pk.js -O /jd/scripts/jd_adolf_pk.js 
wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/lpss_scripts/master/jd_unsubscribe.js -O /jd/scripts/jd_clear_shop.js
wget -q --no-check-certificate https://raw.githubusercontent.com/monk-coder/dust/dust/i-chenzhe/z_mother_jump.js -O /jd/scripts/jd_z_mother_jump.js
wget -q --no-check-certificate https://raw.githubusercontent.com/monk-coder/dust/dust/member/adolf_flp.js -O /jd/scripts/jd_adolf_flp.js
wget -q --no-check-certificate https://raw.githubusercontent.com/monk-coder/dust/dust/member/adolf_oneplus.js -O /jd/scripts/jd_adolf_oneplus.js
wget -q --no-check-certificate https://raw.githubusercontent.com/monk-coder/dust/dust/normal/adolf_martin.js -O /jd/scripts/jd_adolf_martin.js
wget -q --no-check-certificate https://raw.githubusercontent.com/monk-coder/dust/dust/normal/adolf_mi.js -O /jd/scripts/jd_adolf_mi.js
wget -q --no-check-certificate https://jdsharedresourcescdn.azureedge.net/jdresource/jd_jump.js -O /jd/scripts/jd_jump.js
wget -q --no-check-certificate https://raw.githubusercontent.com/monk-coder/dust/dust/normal/adolf_urge.js -O /jd/scripts/jd_adolf_urge.js
wget -q --no-check-certificate https://raw.githubusercontent.com/monk-coder/dust/dust/i-chenzhe/z_carnivalcity.js -O /jd/scripts/jd_z_carnivalcity.js
wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/my_scripts/main/js_code/jd/jd_zoo.js -O /jd/scripts/jd_zoon.js
wget -q --no-check-certificate https://raw.githubusercontent.com/monk-coder/dust/dust/normal/adolf_superbox.js -O /jd/scripts/jd_adolf_superbox.js


#更新lxk scripts

#echo -e "准备更新lxk scripts \n"
#rm -rf /jd/pro/
#mkdir /jd/pro/
#git clone https://github.com/forpw2009/lpss_scripts.git /jd/pro/
#cp -rf /jd/pro/lxk/*.js /jd/scripts/
#echo -e "更新lxk scripts 完成 \n"

#添加需要添加的脚本 name
my_scripts_list_add="
lpss_vip
jd_super_redrain
jd_half_redrain
jd_clear_shop
jd_syj
jd_npc_redrain
jd_daily_lottery
jd_monk_shop_lottery
jd_adolf_pk
jd_z_mother_jump
jd_adolf_oneplus
jd_adolf_martin
jd_adolf_mi
jd_jump
jd_adolf_urge
jd_z_carnivalcity
jd_zoon
jd_adolf_superbox
"

#添加需要添加脚本的 cron
lpss_vip="*/10 * * * * bash /jd/config/lpss_vip.sh >> /jd/log/lpss_vip.log 2>&1"
lpss_del_log="23 23 * * * bash /jd/config/lpss_del_log.sh >> /jd/log/lpss_del_log.log 2>&1"
jd_super_redrain="0 0-23/1 * * * jd jd_super_redrain"
jd_half_redrain="30 20-23/1 * * * jd jd_half_redrain"
jd_clear_shop="45 22 * * * jd jd_clear_shop"
jd_monk_shop_lottery="1 0,10,23 * * * jd jd_monk_shop_lottery"
jd_syj="10 0,7,23 * * * jd jd_syj"
jd_npc_redrain="0 0-23/1 * * * jd jd_npc_redrain"
jd_daily_lottery="13 1,22,23 * * * jd jd_daily_lottery"
jd_adolf_pk="15 8,13,18 17-31 5 * jd jd_adolf_pk"
jd_friend="40 16 * * * jd jd_friend"
jd_z_mother_jump="5 8,14,20 19-25 5 * jd jd_z_mother_jump"
jd_adolf_flp="15 9 * 5,6 * jd jd_adolf_flp"
jd_adolf_oneplus="25 9 * 5,6 * jd jd_adolf_oneplus"
jd_adolf_martin="19 9 20-31 5 * jd jd_adolf_martin"
jd_adolf_mi="15 9 21-27 5 * jd jd_adolf_mi"
jd_jump="1 0,11,21 * * * jd jd_jump"
jd_adolf_urge="28 9 18-26 5 * jd jd_adolf_urge"
jd_z_carnivalcity="1 0-18/6 * 5 * jd jd_z_carnivalcity"
jd_zoon="4 * * * * jd jd_zoon"
jd_adolf_superbox="11 9,20 * 5,6 * jd jd_adolf_superbox"




#添加需要删除的脚本的 name
my_scripts_list_del="
jd_city
jd_z_city_cash
jd_jay_freshgoods
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

#关闭部分脚本帮助作者助力 - close_helpAuthor
#关闭：jd_cfd , jd_cash , jd_bean_home , jd_jdzz 
#关闭：jd_superMarket , jx_sign , jd_monk_shop_lottery 

sed -i "s/let helpAuthor = true/let helpAuthor = false/g" /jd/scripts/*.js
sed -i "s/const helpAuthor = true/const helpAuthor = false/g" /jd/scripts/*.js
sed -i "s/const helpAu = true/const helpAu = false/g" /jd/scripts/*.js
sed -i "s/let helpAu = true/let helpAu = false/g" /jd/scripts/*.js
echo -e "关闭脚本：jd_cfd,jd_cash,jd_bean_home,jd_jdzz,jd_superMarket,jx_sign,jd_monk_shop_lottery 助力成功~\n"


sed -i "s/JD-FLC/$my_docker_id/g" $my_notify
cp -rf  /jd/sendNotify.js /jd/scripts
echo -e "多用户推送脚本更新完成!!!\n"

cp -rf  /jd/home.html /jd/panel/public
echo -e "Home cookies 按钮修复完成!!!\n"

#执行完毕后自动更新 lpss_vip.sh 
echo -e "自动更新lpss_vip中~\n"
wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/my_scripts/main/shell/jd/lpss_vip.sh -O /jd/config/lpss_vip.sh && chmod +x /jd/config/lpss_vip.sh
echo -e "lpss_vip脚本自动更新完成,感谢使用---下次同步时间为10min后"









