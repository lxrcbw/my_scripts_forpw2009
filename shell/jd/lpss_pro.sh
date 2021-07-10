#!/usr/bin/env bash

# 脚本作者 ：  落魄书生
# 更新时间 ：  2021/5/25

#以下脚本主要适用 jd docker v3 & v4  , jd_ql 暂时无法使用
#下载后请放于  /jd/pro/ 目录下
#赋予脚本执行权限 chmod +x /jd/pro/lpss_pro.sh
#建议手动添加以下计划任务 */10 * * * * bash /jd/pro/lpss_pro.sh >> /jd/log/lpss_pro.log 2>&1


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

if [ $target_ver_id = $my_ver_id ];then
	echo -e "无需更新 notify 文件~\n"
else
	echo -e "正在更新 notify 文件~\n"
	wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/my_scripts/main/js_code/jd/notify.js -O /jd/notify.js
	echo -e "更新 notify 文件完成~\n"
fi


if [ $my_download_flag = "opens" ];then

	echo -e "开始更新 home.html & sendNotify.js 文件\n"
	wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/my_scripts/main/html/home.html  -O /jd/home.html
	wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/my_scripts/main/js_code/sendNotify.js -O /jd/sendNotify.js 
	wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/my_scripts/main/shell/jd/lpss_lxk.sh -O /jd/lpss_lxk.sh && chmod +x /jd/lpss_lxk.sh
	wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/my_scripts/main/shell/jd/lpss_del_log.sh -O /jd/pro/lpss_del_log.sh  && chmod +x /jd/pro/lpss_del_log.sh
    wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/my_scripts/main/shell/jd/export_sharecodes.sh -O /jd/export_sharecodes.sh && chmod +x /jd/export_sharecodes.sh
	echo -e "更新 home.html & sendNotify.js 文件完成\n"
else
	echo -e "无需更新 home.html & sendNotify.js 文件\n"
fi 


# 下载需要添加的脚本 link 
#wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/my_scripts/main/js_code/jd/jd_super_redrain.js -O /jd/scripts/jd_super_redrain.js
#wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/my_scripts/main/js_code/jd/jd_half_redrain.js -O /jd/scripts/jd_half_redrain.js
#wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/my_scripts/main/js_code/jd/jd_friend.js -O /jd/scripts/jd_friend.js
#wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/lpss_scripts/main/chenzhe/z_mother_jump.js -O /jd/scripts/jd_z_mother_jump.js
#wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/lpss_scripts/main/adolf/adolf_martin.js -O /jd/scripts/jd_adolf_martin.js
#wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/lpss_scripts/main/chenzhe/z_carnivalcity.js -O /jd/scripts/jd_z_carnivalcity.js
#wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/my_scripts/main/js_code/jd/jd_lxk_city.js -O /jd/scripts/jd_lxk_city.js 

#wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/lpss_scripts/main/monk/monk_shop_lottery.js -O /jd/scripts/jd_monk_shop_lottery.js
#wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/lpss_scripts/main/lxk/jd_syj.js -O /jd/scripts/jd_syj.js 
#wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/my_scripts/main/js_code/jd/jd_daily_lottery.js -O /jd/scripts/jd_daily_lottery.js
#wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/my_scripts/main/js_code/jd/jd_redPacket.js -O /jd/scripts/jd_redPacket.js
#wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/lpss_scripts/master/jd_market_lottery.js -O /jd/scripts/jd_market_lottery.js
#wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/lpss_scripts/master/jd_unsubscribe.js -O /jd/scripts/jd_clear_shop.js
#wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/lpss_scripts/main/adolf/adolf_oneplus.js -O /jd/scripts/jd_adolf_oneplus.js
#wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/lpss_scripts/main/adolf/adolf_superbox.js -O /jd/scripts/jd_adolf_superbox.js
#wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/lpss_scripts/main/adolf/adolf_newInteraction.js -O /jd/scripts/jd_adolf_newInteraction.js
#wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/lpss_scripts/main/adolf/adolf_jxhb.js -O /jd/scripts/jd_adolf_jxhb.js
#wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/lpss_scripts/main/lxk/jd_xtg.js -O /jd/scripts/jd_xtg.js
#wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/lpss_scripts/main/lxk/jd_xtg_help.js -O /jd/scripts/jd_help_xtg.js
#wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/lpss_scripts/main/lxk/jd_gold_creator.js -O /jd/scripts/jd_gold_creator.js
#wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/lpss_scripts/main/Kyle0816/jd_cctx.js -O /jd/scripts/jd_cctx.js
#wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/lpss_scripts/main/npc/jd_mcxhd_brandcity.js -O /jd/scripts/jd_mcxhd_brandcity.js
#wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/lpss_scripts/main/panghu999/jd_ppdz.js -O /jd/scripts/jd_ppdz.js
#wget -q --no-check-certificate https://raw.githubusercontent.com/zooPanda/zoo/dev/zooLongzhou.js -O /jd/scripts/jd_zooLongzhou.js
#wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/lpss_scripts/main/lxk/jd_big_winner.js -O /jd/scripts/jd_big_winner.js

#wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/my_scripts/main/shell/list/lpss_jdc.sh -O /jd/sample/lpss_jdc.sh && chmod +x /jd/sample/lpss_jdc.sh
wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/my_scripts/main/shell/jd/lpss_del_log.sh -O /jd/pro/lpss_del_log.sh  && chmod +x /jd/pro/lpss_del_log.sh

wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/backup/main/lxk/jd_jxmc.js -O /jd/scripts/jd_jxmc.js
wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/backup/main/npc/jd_super_redrain.js  -O /jd/scripts/jd_super_redrain.js
wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/backup/main/npc/jd_half_redrain.js -O /jd/scripts/jd_half_redrain.js
wget -q --no-check-certificate https://raw.githubusercontent.com/longzhuzhu/nianyu/main/qx/long_hby_lottery.js -O /jd/scripts/jd_long_hby_lottery.js 
wget -q --no-check-certificate https://raw.githubusercontent.com/wuzhi04/MyActions/main/jd_ddopk.js -O /jd/scripts/ddo_pk.js
wget -q --no-check-certificate https://raw.githubusercontent.com/jiulan/platypus/main/scripts/jd_ffl.js -O /jd/scripts/jd_ffl.js
wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/backup/main/npc/jd_joy_reward.js -O /jd/scripts/jd_joy_reward.js 
wget -q --no-check-certificate https://raw.githubusercontent.com/wuzhi04/MyActions/main/jd_necklace.js -O /jd/scripts/jd_necklace.js
wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/backup/main/panghu999/jd_wsdlb.js -O /jd/scripts/jd_wsdlb.js
wget -q --no-check-certificate https://raw.githubusercontent.com/wuzhi04/MyActions/main/jd_joy.js -O /jd/scripts/jd_joy.js
wget -q --no-check-certificate https://raw.githubusercontent.com/panghu999/panghu/master/jd_lsj.js -O /jd/scripts/jd_lsj.js
wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/backup/main/panghu999/jd_hwsx.js -O /jd/scripts/jd_hwsx.js
wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/backup/main/tmp/jd_dogsEmploy.js -O /jd/scripts/jd_dogsEmploy.js
wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/backup/main/npc/jd_small_home.js -O /jd/scripts/jd_small_home.js
wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/backup/main/npc/jd_rankingList.js -O /jd/scripts/jd_rankingList.js
wget -q --no-check-certificate https://raw.githubusercontent.com/cdle/jd_study/main/jd_joy_park_help.js -O /jd/scripts/jd_joy_park_help.js
wget -q --no-check-certificate https://raw.githubusercontent.com/smiek2221/scripts/master/jd_summer_movement.js -O /jd/scripts/jd_summer_movement.js
wget -q --no-check-certificate https://raw.githubusercontent.com/smiek2221/scripts/master/MovementFaker.js -O /jd/scripts/MovementFaker.js
wget -q --no-check-certificate https://raw.githubusercontent.com/smiek2221/scripts/master/sign_graphics_validate.js -O /jd/scripts/sign_graphics_validate.js
wget -q --no-check-certificate https://raw.githubusercontent.com/smiek2221/scripts/master/jd_sign_graphics.js -O /jd/scripts/jd_sign_graphics.js
wget -q --no-check-certificate https://raw.githubusercontent.com/wuzhi04/MyActions/main/jd_nzmh.js -O /jd/scripts/jd_nzmh.js
wget -q --no-check-certificate https://raw.githubusercontent.com/wuzhi04/MyActions/main/jd_qjd.js -O /jd/scripts/jd_qjd.js
wget -q --no-check-certificate https://raw.githubusercontent.com/wuzhi04/MyActions/main/jd_goodMorning.js -O /jd/scripts/jd_goodMorning.js
wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/backup/main/npc/jd_summer_movement_help.js -O /jd/scripts/jd_summer_movement_help.js
wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/backup/main/npc/jd_pk.js -O /jd/scripts/jd_jxzpk.js
wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/backup/main/npc/jd_senbeans.js -O /jd/scripts/jd_lkyl.js
wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/backup/main/npc/jd_syj.js -O /jd/scripts/jd_zjd.js
wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/backup/main/npc/jd_tyt.js -O /jd/scripts/jd_tyt.js
wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/backup/main/npc/jd_wish.js -O /jd/scripts/jd_wish.js

#添加需要添加的脚本 name
my_scripts_list_add="
lpss_pro
lpss_jdc
lpss_del_log
jd_clear_shop
jd_syj
jd_daily_lottery
jd_mohe
jd_star_shop
ddo_pk
jd_jxlhb
jd_lotteryMachine
jd_starStore
jd_ffl
jd_redPacket
jdmn
jd_jxmc
jd_wsdlb
jd_hwsx
jd_lsj
jd_dogsEmploy
jd_joy_park_help
jd_summer_movement
jd_summer_movement_help
jd_sign_graphics
jd_qjd
jd_goodMorning
jd_jxzpk
jd_lkyl
jd_zjd
jd_tyt
jd_wish
"

#添加需要添加脚本的 cron
lpss_pro="*/10 * * * * bash /jd/pro/lpss_pro.sh >> /jd/log/lpss_pro.log 2>&1"
lpss_jdc="*/12 * * * * bash /jd/sample/lpss_jdc.sh >> /jd/log/lpss_jdc.log 2>&1"
lpss_lxk="37 8,16,23 * * * bash /jd/lpss_lxk.sh >> /jd/log/lpss_lxk.log 2>&1"
lpss_del_log="23 12,23 * * * bash /jd/pro/lpss_del_log.sh > /jd/log/lpss_del_log.log 2>&1"
jd_super_redrain="0 0-23/1 * * * jd jd_super_redrain"
jd_half_redrain="30 20-23/1 * * * jd jd_half_redrain"
jd_clear_shop="45 22 * * * jd jd_clear_shop"
jd_monk_shop_lottery="1 0,10,23 * * * jd jd_monk_shop_lottery"
jd_syj="10 0,7,23 * * * jd jd_syj"
jd_npc_redrain="0 0-23/1 * * * jd jd_npc_redrain"
jd_daily_lottery="13 1,22,23 * * * jd jd_daily_lottery"
jd_friend="40 16 * * * jd jd_friend"
jd_adolf_oneplus="25 9 * 5,6 * jd jd_adolf_oneplus"
jd_zoo="35 0,6-23 * * * jd jd_zoo"
jd_star_zoo="5 0,6-23 * * * jd jd_star_zoo"
jd_jay_freshgoods="22 22 * * * jd jd_jay_freshgoods"
jd_adolf_superbox="11 9,20 * 5,6 * jd jd_adolf_superbox"
jd_adolf_newInteraction="15 9,20 * 5,6 * jd jd_adolf_newInteraction"
jd_adolf_jxhb="25 9 * 5,6 * jd jd_adolf_jxhb"
jd_xtg="0 0 * * * jd jd_xtg"
jd_help_xtg="0 0 * * * jd jd_help_xtg"
jd_cctx="*/5 0 * * * jd jd_cctx"
jd_gold_creator="10 1,22 * * * jd jd_gold_creator"
jd_zdjr="45 18 * * * jd jd_zdjr"
jd_babelDiy="50 10,11 * * * jd jd_babelDiy"
jd_mohe="0 0,1-23/3 * * * jd jd_mohe"
jd_mcxhd_brandcity="30 9,10 1-18 6 * jd jd_mcxhd_brandcity"
jd_brandcarnivalcity="15 9 1-18 6 * jd jd_brandcarnivalcity"
jd_ppdz="1 0 * * * jd jd_ppdz"
jd_star_shop="0 1,21 * * * jd jd_star_shop"
jd_618redpacket="1 0-23/1 * 6 * jd jd_618redpacket"
ddo_pk="16 0,6,13,19,21 * * * jd ddo_pk"
jd_jxlhb="5 10 * * * jd jd_jxlhb"
jd_lotteryMachine="10 1 * * * jd jd_lotteryMachine"
jd_starStore="5 9 * * * jd jd_starStore"
jd_ffl="5,35 * * 6 * jd jd_ffl"
zy_618jc="23 0 * 6 * jd zy_618jc"
long_super_redrain="0 0-23/1 * * * jd long_super_redrain"
long_half_redrain="30 16-23/1 * * * jd long_half_redrain"
jd_long_hby_lottery="1 20 1-18 6 * jd jd_long_hby_lottery"
jd_ddo_joy_reward="0 0-16/8 * * * jd jd_ddo_joy_reward"
jd_redPacket="11 1,9,17,23 * * * jd jd_redPacket"
jd_big_winner="*/20 * * * * jd jd_big_winner"
jdmn="7 0,8,11,15 * * * jd jdmn"
jd_jxmc="20 0-23/3 * * * jd jd_jxmc"
jd_wsdlb="5 0-23/6 * * * jd jd_wsdlb"
jd_hwsx="20 12,14 * * * jd jd_hwsx"
jd_sign_graphics="10 10 * * * jd jd_sign_graphics"
jd_lsj="0 11,19 * * * jd jd_lsj"
jd_dogsEmploy="12 12 * * * jd jd_dogsEmploy"
jd_joy_park_help="30 23 * * * jd jd_joy_park_help"
jd_summer_movement="15,45 7-23 * * * jd jd_summer_movement"
jd_qjd="14 7 * * * jd jd_qjd"
jd_goodMorning="30 6 * * * jd jd_goodMorning"
jd_summer_movement_help="19 7-23 * * * jd jd_summer_movement_help"
jd_jxzpk="10 10,11,14,15 * * * jd jd_jxzpk"
jd_lkyl="13 9,13 * * * jd jd_lkyl"
jd_zjd="15 10,14 * * * jd jd_zjd"
jd_tyt="45 9,14,22 * * * jd jd_tyt"
jd_wish="3 6,12,15 * * * jd jd_wish"


#添加需要删除的脚本的 name
my_scripts_list_del="
jd_zxry
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

#关闭部分脚本助力 - close_helpAuthor
#关闭：jd_cfd , jd_cash , jd_bean_home , jd_jdzz 
#关闭：jd_superMarket , jx_sign , jd_monk_shop_lottery 

sed -i "s/let helpAuthor = true/let helpAuthor = false/g" /jd/scripts/*.js
sed -i "s/const helpAuthor = true/const helpAuthor = false/g" /jd/scripts/*.js
sed -i "s/const helpAu = true/const helpAu = false/g" /jd/scripts/*.js
sed -i "s/let helpAu = true/let helpAu = false/g" /jd/scripts/*.js
echo -e "关闭脚本：jd_cfd,jd_cash,jd_bean_home,jd_jdzz,jd_superMarket,jx_sign,jd_monk_shop_lottery 助力成功~\n"



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

#执行完毕后自动更新 lpss_pro.sh 
echo -e "自动更新lpss_pro中~\n"
wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/my_scripts/main/shell/jd/lpss_pro.sh -O /jd/pro/lpss_pro.sh && chmod +x /jd/pro/lpss_pro.sh
echo -e "lpss_pro脚本自动更新完成,感谢使用---下次同步时间为10min后"






