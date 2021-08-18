#!/usr/bin/env bash

# 脚本作者 ：  落魄书生
# 更新时间 ：  2021/5/24

#以下脚本主要适用 jd docker v3 & v4  , jd_ql 暂时无法使用
#下载后请放于  /jd/config/ 目录下
#赋予脚本执行权限 chmod +x /jd/config/lpss_diy.sh
#建议手动添加以下计划任务 */10 * * * * bash /jd/config/lpss_diy.sh >> /jd/log/lpss_diy.log 2>&1


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


if [ $my_download_flag = "opens" ];then

	echo -e "开始更新 home.html & sendNotify.js 文件\n"
	wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/my_scripts/main/html/home.html  -O /jd/home.html
	wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/my_scripts/main/js_code/sendNotify_FLC.js -O /jd/sendNotify.js 
	wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/my_scripts/main/shell/jd/lpss_lxk.sh -O /jd/lpss_lxk.sh && chmod +x /jd/lpss_lxk.sh
	wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/my_scripts/main/shell/jd/lpss_del_log.sh -O /jd/config/lpss_del_log.sh  && chmod +x /jd/config/lpss_del_log.sh
    wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/my_scripts/main/shell/jd/export_sharecodes.sh -O /jd/export_sharecodes.sh && chmod +x /jd/export_sharecodes.sh
	echo -e "更新 home.html & sendNotify.js 文件完成\n"
else
	echo -e "无需更新 home.html & sendNotify.js 文件\n"
fi 



# 下载需要添加的脚本 link 

#wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/my_scripts/main/shell/list/lpss_jdc.sh -O /jd/sample/lpss_jdc.sh && chmod +x /jd/sample/lpss_jdc.sh
#wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/my_scripts/main/shell/jd/lpss_del_log.sh -O /jd/pro/lpss_del_log.sh  && chmod +x /jd/pro/lpss_del_log.sh

#wget -q --no-check-certificate https://raw.githubusercontent.com/longzhuzhu/nianyu/main/qx/long_hby_lottery.js -O /jd/scripts/jd_long_hby_lottery.js 
#wget -q --no-check-certificate https://raw.githubusercontent.com/panghu999/panghu/master/jd_lsj.js -O /jd/scripts/jd_lsj.js
#wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/backup/main/panghu999/jd_hwsx.js -O /jd/scripts/jd_hwsx.js
#wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/backup/main/tmp/jd_dogsEmploy.js -O /jd/scripts/jd_dogsEmploy.js
#wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/backup/main/npc/jd_small_home.js -O /jd/scripts/jd_small_home.js
#wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/backup/main/npc/jd_rankingList.js -O /jd/scripts/jd_rankingList.js
#wget -q --no-check-certificate https://raw.githubusercontent.com/star261/jd/main/scripts/jd_jxmc.js -O /jd/scripts/jd_jxmc.js
#wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/backup/main/npc/jd_joy_reward.js -O /jd/scripts/jd_joy_reward.js 
#wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/backup/main/panghu999/jd_wsdlb.js -O /jd/scripts/jd_wsdlb.js
#wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/backup/main/npc/jd_summer_movement_help.js -O /jd/scripts/jd_summer_movement_help.js
#wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/backup/main/npc/jd_pk.js -O /jd/scripts/jd_jxzpk.js
#wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/backup/main/npc/jd_senbeans.js -O /jd/scripts/jd_lkyl.js
#wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/backup/main/npc/jd_syj.js -O /jd/scripts/jd_zjd.js
#wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/backup/main/npc/jd_tyt.js -O /jd/scripts/jd_tyt.js
#wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/backup/main/npc/jd_wish.js -O /jd/scripts/jd_wish.js
#wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/backup/main/npc/jd_cfd.js -O /jd/scripts/jd_cfd.js
#wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/backup/main/star261/jd_star_movement_bet.js -O /jd/scripts/jd_star_movement_bet.js
#wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/backup/main/star261/jd_star_movement_map.js -O /jd/scripts/jd_star_movement_map.js

wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/my_scripts/main/js_code/jd/server.js -O /jd/panel/server.js

wget -q --no-check-certificate https://raw.githubusercontent.com/shufflewzc/faker2/main/jd_super_redrain.js  -O /jd/scripts/jd_super_redrain.js
wget -q --no-check-certificate https://raw.githubusercontent.com/shufflewzc/faker2/main/jd_half_redrain.js -O /jd/scripts/jd_half_redrain.js
wget -q --no-check-certificate https://raw.githubusercontent.com/shufflewzc/faker2/main/jd_live_redrain.js -O /jd/scripts/jd_live_redrain.js
wget -q --no-check-certificate https://raw.githubusercontent.com/shufflewzc/faker2/main/jd_fcffl.js -O /jd/scripts/jd_ffl.js
wget -q --no-check-certificate https://raw.githubusercontent.com/smiek2221/scripts/master/jd_necklace.js -O /jd/scripts/jd_necklace.js
wget -q --no-check-certificate https://raw.githubusercontent.com/smiek2221/scripts/master/ZooFaker_Necklace.js -O /jd/scripts/ZooFaker_Necklace.js
wget -q --no-check-certificate https://raw.githubusercontent.com/smiek2221/scripts/master/JDJRValidator_Pure.js -O /jd/scripts/JDJRValidator_Pure.js
wget -q --no-check-certificate https://raw.githubusercontent.com/smiek2221/scripts/master/jd_joy.js -O /jd/scripts/jd_joy.js
wget -q --no-check-certificate https://raw.githubusercontent.com/smiek2221/scripts/master/jd_joy_steal.js -O /jd/scripts/jd_joy_steal.js
wget -q --no-check-certificate https://raw.githubusercontent.com/shufflewzc/faker2/main/jd_joy_reward.js -O /jd/scripts/jd_new_joy_reward.js
wget -q --no-check-certificate https://raw.githubusercontent.com/smiek2221/scripts/master/jd_summer_movement.js -O /jd/scripts/jd_summer_movement.js
wget -q --no-check-certificate https://raw.githubusercontent.com/smiek2221/scripts/master/jd_summer_movement_help.js -O /jd/scripts/jd_summer_movement_help.js
wget -q --no-check-certificate https://raw.githubusercontent.com/smiek2221/scripts/master/MovementFaker.js -O /jd/scripts/MovementFaker.js
wget -q --no-check-certificate https://raw.githubusercontent.com/smiek2221/scripts/master/sign_graphics_validate.js -O /jd/scripts/sign_graphics_validate.js
wget -q --no-check-certificate https://raw.githubusercontent.com/smiek2221/scripts/master/jd_sign_graphics.js -O /jd/scripts/jd_sign_graphics.js
wget -q --no-check-certificate https://raw.githubusercontent.com/smiek2221/scripts/master/gua_wealth_island.js -O /jd/scripts/jd_wealth_island.js
wget -q --no-check-certificate https://raw.githubusercontent.com/smiek2221/scripts/master/gua_wealth_island_help.js -O /jd/scripts/jd_wealth_island_help.js
wget -q --no-check-certificate https://raw.githubusercontent.com/wuzhi04/MyActions/main/jd_nzmh.js -O /jd/scripts/jd_nzmh.js
wget -q --no-check-certificate https://raw.githubusercontent.com/wuzhi04/MyActions/main/jd_qjd.js -O /jd/scripts/jd_qjd.js
wget -q --no-check-certificate https://raw.githubusercontent.com/shufflewzc/faker2/main/jd_goodMorning.js -O /jd/scripts/jd_goodMorning.js
wget -q --no-check-certificate https://raw.githubusercontent.com/shufflewzc/faker2/main/jd_dreamFactory_tuan.js -O /jd/scripts/jd_Factory_tuan.js
wget -q --no-check-certificate https://raw.githubusercontent.com/shufflewzc/faker2/main/jd_fc.js -O /jd/scripts/jd_fcyqm.js
wget -q --no-check-certificate https://raw.githubusercontent.com/shufflewzc/faker2/main/jd_fcdyj.js -O /jd/scripts/jd_fcdyj.js
wget -q --no-check-certificate https://raw.githubusercontent.com/shufflewzc/faker2/main/jd_kd.js -O /jd/scripts/jd_kd.js
wget -q --no-check-certificate https://raw.githubusercontent.com/shufflewzc/faker2/main/jd_wxFans.js -O /jd/scripts/jd_wxFans.js
wget -q --no-check-certificate https://raw.githubusercontent.com/shufflewzc/faker2/main/jd_fan.js -O /jd/scripts/jd_fan.js
wget -q --no-check-certificate https://raw.githubusercontent.com/shufflewzc/faker2/main/jd_cfdtx.js -O /jd/scripts/jd_cfdtx.js
wget -q --no-check-certificate https://raw.githubusercontent.com/shufflewzc/faker2/main/jd_ddnc_farmpark.js -O /jd/scripts/jd_ddnc_farmpark.js
wget -q --no-check-certificate https://raw.githubusercontent.com/shufflewzc/faker2/main/jd_esManager.js -O /jd/scripts/jd_esManager.js
wget -q --no-check-certificate https://raw.githubusercontent.com/shufflewzc/faker2/main/jd_blueCoin.js -O /jd/scripts/jd_new_blueCoin.js
wget -q --no-check-certificate https://raw.githubusercontent.com/shufflewzc/faker2/main/jd_cash_exchange.js -O /jd/scripts/jd_exchange_cash.js
wget -q --no-check-certificate https://raw.githubusercontent.com/smiek2221/scripts/master/gua_MMdou.js -O /jd/scripts/jd_gua_MMdou.js
wget -q --no-check-certificate https://raw.githubusercontent.com/shufflewzc/faker2/main/jd_mb.js -O /jd/scripts/jd_mb.js
wget -q --no-check-certificate https://raw.githubusercontent.com/shufflewzc/faker2/main/jd_jump.js -O /jd/scripts/jd_jump.js
wget -q --no-check-certificate https://raw.githubusercontent.com/shufflewzc/faker2/main/jd_gold_creator.js -O /jd/scripts/jd_gold_creator.js
wget -q --no-check-certificate https://raw.githubusercontent.com/shufflewzc/faker2/main/jd_bean_home.js -O /jd/scripts/jd_bean_home.js
wget -q --no-check-certificate https://raw.githubusercontent.com/DovFork/Wenmoux/master/jd/jd_qqxing.js -O /jd/scripts/jd_qqxing.js
wget -q --no-check-certificate https://raw.githubusercontent.com/shufflewzc/faker2/main/jd_jxlhb.js -O /jd/scripts/jd_jxlhb.js
wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/backup/main/npc/jd_jxqd_new.js -O /jd/scripts/jd_new_jxqd.js
wget -q --no-check-certificate https://raw.githubusercontent.com/shufflewzc/faker2/main/jd_dpqd.js -O /jd/scripts/jd_dpqd.js
wget -q --no-check-certificate https://raw.githubusercontent.com/shufflewzc/faker2/main/jd_speed_redpocke.js -O /jd/scripts/jd_new_speed_redpocke.js
wget -q --no-check-certificate https://raw.githubusercontent.com/shufflewzc/faker2/main/jd_bookshop.js -O /jd/scripts/jd_bookshop.js
wget -q --no-check-certificate https://raw.githubusercontent.com/shufflewzc/faker2/main/jd_wish.js -O /jd/scripts/jd_wish.js
wget -q --no-check-certificate https://raw.githubusercontent.com/shufflewzc/faker2/main/jd_health.js -O /jd/scripts/jd_health.js
wget -q --no-check-certificate https://raw.githubusercontent.com/shufflewzc/faker2/main/jd_jxmc.js -O /jd/scripts/jd_jxmc.js
wget -q --no-check-certificate https://raw.githubusercontent.com/smiek2221/scripts/master/gua_doge.js -O /jd/scripts/jd_gua_doge.js
wget -q --no-check-certificate https://raw.githubusercontent.com/smiek2221/scripts/master/gua_carnivalcity.js -O /jd/scripts/jd_gua_carnivalcity.js
wget -q --no-check-certificate https://raw.githubusercontent.com/shufflewzc/faker2/main/jd_ldhwj.js -O /jd/scripts/jd_ldhwj.js
wget -q --no-check-certificate https://raw.githubusercontent.com/shufflewzc/faker2/main/jd_mohe.js -O /jd/scripts/jd_mohe.js
wget -q --no-check-certificate https://raw.githubusercontent.com/shufflewzc/faker2/main/jx_sign.js -O /jd/scripts/jx_sign.js
wget -q --no-check-certificate https://raw.githubusercontent.com/shufflewzc/faker2/main/jd_nzmh.js -O /jd/scripts/jd_nzmh.js
wget -q --no-check-certificate https://raw.githubusercontent.com/shufflewzc/faker2/main/jd_ryhxj.js -O /jd/scripts/jd_ryhxj.js
wget -q --no-check-certificate https://raw.githubusercontent.com/shufflewzc/faker2/main/jd_ylyn.js -O /jd/scripts/jd_ylyn.js
wget -q --no-check-certificate https://raw.githubusercontent.com/smiek2221/scripts/master/jd_qcshj.js -O /jd/scripts/jd_qcshj.js
wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/backup/main/npc/gua_xmGame.js -O /jd/scripts/gua_xmGame.js
wget -q --no-check-certificate https://raw.githubusercontent.com/smiek2221/scripts/master/gua_xiaolong.js -O /jd/scripts/gua_xiaolong.js
wget -q --no-check-certificate https://raw.githubusercontent.com/shufflewzc/faker2/main/jd_appliances.js -O /jd/scripts/jd_appliances.js
wget -q --no-check-certificate https://raw.githubusercontent.com/shufflewzc/faker2/main/jd_decompression.js -O /jd/scripts/jd_decompression.js
wget -q --no-check-certificate https://raw.githubusercontent.com/shufflewzc/faker2/main/jd_lotteryMachine.js -O /jd/scripts/jd_lotteryMachine.js
wget -q --no-check-certificate https://raw.githubusercontent.com/shufflewzc/faker2/main/jd_sendBeans.js -O /jd/scripts/jd_senbeans.js
wget -q --no-check-certificate https://raw.githubusercontent.com/shufflewzc/faker2/main/jd_pigPet.js -O /jd/scripts/jd_pigPet.js
wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/backup/main/npc/jd_dreamFactory.js -O /jd/scripts/jd_dreamFactory.js
wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/backup/main/npc/jd_cash.js -O /jd/scripts/jd_new_cash.js
wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/backup/main/npc/jd_carnivalcity_help.js -O /jd/scripts/jd_help_carnivalcity.js
wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/backup/main/npc/jd_jdzz.js -O /jd/scripts/jd_jdzz.js
wget -q --no-check-certificate https://raw.githubusercontent.com/shufflewzc/faker2/main/jd_star_shop.js -O /jd/scripts/jd_star_shop.js
wget -q --no-check-certificate https://raw.githubusercontent.com/shufflewzc/faker2/main/jd_golden_machine.js -O /jd/scripts/jd_golden_machine.js
wget -q --no-check-certificate https://raw.githubusercontent.com/NobyDa/Script/master/JD-DailyBonus/JD_DailyBonus.js -O /jd/scripts/jd_new_sign.js
wget -q --no-check-certificate https://raw.githubusercontent.com/NobyDa/Script/master/JD-DailyBonus/JD_DailyBonus.js -O /jd/scripts/JD_DailyBonus.js 
wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/backup/main/lpssxs/gua_opencard12.js -O /jd/scripts/gua_opencard12.js
wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/backup/main/lpssxs/gua_opencard13.js -O /jd/scripts/gua_opencard13.js
wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/backup/main/lpssxs/gua_opencard14.js -O /jd/scripts/gua_opencard14.js

#添加需要添加的脚本 name
my_scripts_list_add="
lpss_diy
lpss_jdc
lpss_check
lpss_del_log
jd_clear_shop
jd_live_redrain
jd_dpqd
jd_new_speed_redpocke
jd_gua_doge
jd_gua_carnivalcity
jd_ldhwj
jx_sign
jd_nzmh
jd_ryhxj
jd_ylyn
jd_qcshj
gua_xmGame
gua_xiaolong
jd_appliances
jd_decompression
jd_senbeans
jd_new_cash
jd_exchange_cash
jd_help_carnivalcity
jd_fan
jd_star_shop
jd_golden_machine
jd_new_sign
gua_opencard12
gua_opencard13
gua_opencard14
"

#添加需要添加 lpss 脚本 cron
lpss_diy="*/10 * * * * bash /jd/config/lpss_diy.sh >> /jd/log/lpss_diy.log 2>&1"
lpss_jdc="*/12 * * * * bash /jd/sample/lpss_jdc.sh >> /jd/log/lpss_jdc.log 2>&1"
lpss_check="8 */2 * * * bash /jd/sample/lpss_check.sh >> /jd/log/lpss_check.log 2>&1"
lpss_del_log="23 12,23 * * * bash /jd/config/lpss_del_log.sh >> /jd/log/lpss_del_log.log 2>&1"

#添加需要添加 js 脚本 cron
jd_super_redrain="0,1 0-23/1 * * * jd jd_super_redrain"
jd_half_redrain="30,31 20-23/1 * * * jd jd_half_redrain"
jd_clear_shop="45 22 * * * jd jd_clear_shop"
jd_monk_shop_lottery="1 0,10,23 * * * jd jd_monk_shop_lottery"
jd_syj="10 0,7,23 * * * jd jd_syj"
jd_npc_redrain="0 0-23/1 * * * jd jd_npc_redrain"
jd_daily_lottery="13 1,22,23 * * * jd jd_daily_lottery"
jd_friend="40 16 * * * jd jd_friend"
jd_jay_freshgoods="22 22 * * * jd jd_jay_freshgoods"
jd_xtg="0 0 * * * jd jd_xtg"
jd_help_xtg="0 0 * * * jd jd_help_xtg"
jd_cctx="*/5 0 * * * jd jd_cctx"
jd_zdjr="45 18 * * * jd jd_zdjr"
jd_babelDiy="50 10,11 * * * jd jd_babelDiy"
jd_long_hby_lottery="1 20 1-18 6 * jd jd_long_hby_lottery"
jd_mohe="0 0,1-23/3 * * * jd jd_mohe"
ddo_pk="16 0,6,13,19,21 * * * jd ddo_pk"
jd_jxlhb="5 2,10 * * * jd jd_jxlhb"
jd_lotteryMachine="10 1,15 * * * jd jd_lotteryMachine"
jd_ffl="20 * * * * jd jd_ffl"
jd_ddo_joy_reward="0 0-16/8 * * * jd jd_ddo_joy_reward"
jd_redPacket="11 1,9,17,23 * * * jd jd_redPacket"
jdmn="7 0,8,11,15 * * * jd jdmn"
jd_jxmc="20 0-23/3 * * * jd jd_jxmc"
jd_wsdlb="5 0-23/6 * * * jd jd_wsdlb"
jd_lsj="0 11,19 * * * jd jd_lsj"
jd_dogsEmploy="12 8,15 * * * jd jd_dogsEmploy"
jd_joy_park_help="30 23 * * * jd jd_joy_park_help"
jd_sign_graphics="10 10 * * * jd jd_sign_graphics"
jd_goodMorning="30 6 * * * jd jd_goodMorning"
jd_lkyl="13 9,15 * * * jd jd_lkyl"
jd_zjd="15 10,14 * * * jd jd_zjd"
jd_tyt="45 9,14,22 * * * jd jd_tyt"
jd_wish="3 6,12,15 * * * jd jd_wish"
jd_cfd="5 8,13,19 * * * jd jd_cfd"
jd_joy_steal="10 0-21/3 * * * jd jd_joy_steal"
jd_wealth_island="18 0-23/2 * * * jd jd_wealth_island"
jd_Factory_tuan="7 8,12,15 jd jd_Factory_tuan"
jd_wxFans="1 8,15 * * * jd jd_wxFans"
jd_fcyqm="0,2 0 * * * jd jd_fcyqm"
jd_fcdyj="0,2 0 * * * jd jd_fcdyj"
jd_ddnc_farmpark="31 7,15 * * * jd jd_ddnc_farmpark"
jd_esManager="39 7,15 * * * jd jd_esManager"
jd_cfdtx="59 11,12,23 * * * jd jd_cfdtx"
jd_new_blueCoin="59 23 * * * jd jd_new_blueCoin"
jd_exchange_cash="0,1 0 * * * jd jd_exchange_cash"
jd_gua_MMdou="18 9,15 * * * jd jd_gua_MMdou"
jd_mb="5 9,12,15 * * * jd jd_mb"
jd_jump="1 0,11,21 * * * jd jd_jump"
jd_new_joy_reward="59 7,15,23 * * * jd jd_new_joy_reward"
jd_gold_creator="13 1,16,22 * * * jd jd_gold_creator"
jd_bean_home="23 1,12,22 * * * jd jd_bean_home"
jd_wealth_island_help="25 0,1,9,14,18 * * * jd jd_wealth_island_help"
jd_qqxing="5 0-23/2 * * * jd jd_qqxing"
jd_new_jxqd="10 7-23 * * * jd jd_new_jxqd"
jd_live_redrain="0,30 0-23/1 * * * jd jd_live_redrain"
jd_dpqd="12 12 * * * jd jd_dpqd"
jd_new_speed_redpocke="22 0,12,15,22 * * * jd jd_new_speed_redpocke"
jd_gua_doge="36 0,10,21 4-15 8 * jd jd_gua_doge"
jd_gua_carnivalcity="0 0-18/6 * * * jd jd_gua_carnivalcity"
jd_ldhwj="11 1,9,15,20 * * * jd jd_ldhwj"
jd_nzmh="35 1,8,15,23 * * * jd jd_nzmh"
jx_sign="20 1,8,15,22 * * * jd jx_sign"
jd_ryhxj="1 1 * * * jd jd_ryhxj"
jd_ylyn="40 5,18 * * * jd jd_ylyn"
jd_qcshj="30 9,21 12-20 8 * jd jd_qcshj"
gua_xmGame="33 8,22 13-31 8 * jd gua_xmGame"
gua_xiaolong="22 9,19 13-25 8 * jd gua_xiaolong"
jd_appliances="55 21,22 * * * jd jd_appliances"
jd_decompression="18,36 9,19,22 13-25 8 * jd jd_decompression"
jd_senbeans="45 1,12,16,22 * * * jd jd_senbeans"
jd_new_cash="5 5,12,17,22 * * * jd jd_new_cash"
jd_help_carnivalcity="10 0,8,13,17,22 * * * jd jd_help_carnivalcity"
jd_fan="32 6,18 * * * jd jd_fan"
jd_golden_machine="10 9,18 9-25 8 * jd jd_golden_machine"
jd_star_shop="33 4,7 8-20 8 * jd jd_star_shop"
jd_new_sign="1 0,9,15,22 jd jd_new_sign"
gua_opencard12="15,23 11 * * * jd gua_opencard12"
gua_opencard13="15,23 12 * * * jd gua_opencard13"
gua_opencard14="15,23 15 * * * jd gua_opencard14"

#添加需要删除的脚本的 name
my_scripts_list_del="
jd_cash_exchange
jd_cash
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

#执行完毕后自动更新 lpss_diy.sh 
echo -e "自动更新lpss_diy中~\n"
wget -q https://raw.githubusercontent.com/forpw2009/my_scripts/main/shell/jd/lpss_diy.sh -O /jd/config/lpss_diy.sh && chmod +x /jd/config/lpss_diy.sh
echo -e "lpss_diy脚本自动更新完成,感谢使用---下次同步时间为10min后"









