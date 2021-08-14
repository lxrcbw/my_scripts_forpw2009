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
	wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/my_scripts/main/js_code/sendNotify_5.js -O /jd/sendNotify.js 
	wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/my_scripts/main/shell/jd/lpss_lxk.sh -O /jd/lpss_lxk.sh && chmod +x /jd/lpss_lxk.sh
	wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/my_scripts/main/shell/jd/lpss_del_log.sh -O /jd/config/lpss_del_log.sh  && chmod +x /jd/config/lpss_del_log.sh
    wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/my_scripts/main/shell/jd/export_sharecodes.sh -O /jd/export_sharecodes.sh && chmod +x /jd/export_sharecodes.sh
	echo -e "更新 home.html & sendNotify.js 文件完成\n"
else
	echo -e "无需更新 home.html & sendNotify.js 文件\n"
fi 

# 下载需要添加的脚本 link 

#wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/my_scripts/main/js_code/jd/jd_super_redrain.js -O /jd/scripts/jd_super_redrain.js
#wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/my_scripts/main/js_code/jd/jd_half_redrain.js -O /jd/scripts/jd_half_redrain.js
#wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/my_scripts/main/js_code/jd/jd_friend.js -O /jd/scripts/jd_friend.js


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

wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/my_scripts/main/shell/jd/lpss_del_log.sh -O /jd/config/lpss_del_log.sh  && chmod +x /jd/config/lpss_del_log.sh

wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/backup/main/npc/jd_super_redrain.js  -O /jd/scripts/jd_super_redrain.js
wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/backup/main/npc/jd_half_redrain.js -O /jd/scripts/jd_half_redrain.js
wget -q --no-check-certificate https://raw.githubusercontent.com/shufflewzc/faker2/main/jd_live_redrain.js -O /jd/scripts/jd_live_redrain.js
wget -q --no-check-certificate https://raw.githubusercontent.com/longzhuzhu/nianyu/main/qx/long_hby_lottery.js -O /jd/scripts/jd_long_hby_lottery.js 
wget -q --no-check-certificate https://raw.githubusercontent.com/wuzhi04/MyActions/main/jd_ddopk.js -O /jd/scripts/ddo_pk.js
wget -q --no-check-certificate https://raw.githubusercontent.com/jiulan/platypus/main/scripts/jd_ffl.js -O /jd/scripts/jd_ffl.js
wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/backup/main/npc/jd_joy_reward.js -O /jd/scripts/jd_joy_reward.js 
wget -q --no-check-certificate https://raw.githubusercontent.com/JDHelloWorld/jd_scripts/main/jd_necklace_new.js -O /jd/scripts/jd_necklace.js
wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/backup/main/panghu999/jd_wsdlb.js -O /jd/scripts/jd_wsdlb.js
wget -q --no-check-certificate https://raw.githubusercontent.com/smiek2221/scripts/master/JDJRValidator_Pure.js -O /jd/scripts/JDJRValidator_Pure.js
wget -q --no-check-certificate https://raw.githubusercontent.com/smiek2221/scripts/master/jd_joy.js -O /jd/scripts/jd_joy.js
wget -q --no-check-certificate https://raw.githubusercontent.com/smiek2221/scripts/master/jd_joy_steal.js -O /jd/scripts/jd_joy_steal.js
wget -q --no-check-certificate https://raw.githubusercontent.com/shufflewzc/faker2/main/jd_joy_reward.js -O /jd/scripts/jd_new_joy_reward.js
wget -q --no-check-certificate https://raw.githubusercontent.com/panghu999/panghu/master/jd_lsj.js -O /jd/scripts/jd_lsj.js
wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/backup/main/panghu999/jd_hwsx.js -O /jd/scripts/jd_hwsx.js
wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/backup/main/tmp/jd_dogsEmploy.js -O /jd/scripts/jd_dogsEmploy.js
wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/backup/main/npc/jd_small_home.js -O /jd/scripts/jd_small_home.js
wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/backup/main/npc/jd_rankingList.js -O /jd/scripts/jd_rankingList.js
wget -q --no-check-certificate https://raw.githubusercontent.com/cdle/jd_study/main/jd_joy_park_help.js -O /jd/scripts/jd_joy_park_help.js
wget -q --no-check-certificate https://raw.githubusercontent.com/smiek2221/scripts/master/jd_summer_movement.js -O /jd/scripts/jd_summer_movement.js
wget -q --no-check-certificate https://raw.githubusercontent.com/smiek2221/scripts/master/jd_summer_movement_help.js -O /jd/scripts/jd_summer_movement_help.js
wget -q --no-check-certificate https://raw.githubusercontent.com/smiek2221/scripts/master/MovementFaker.js -O /jd/scripts/MovementFaker.js
wget -q --no-check-certificate https://raw.githubusercontent.com/smiek2221/scripts/master/sign_graphics_validate.js -O /jd/scripts/sign_graphics_validate.js
wget -q --no-check-certificate https://raw.githubusercontent.com/smiek2221/scripts/master/jd_sign_graphics.js -O /jd/scripts/jd_sign_graphics.js
wget -q --no-check-certificate https://raw.githubusercontent.com/wuzhi04/MyActions/main/jd_nzmh.js -O /jd/scripts/jd_nzmh.js
wget -q --no-check-certificate https://raw.githubusercontent.com/wuzhi04/MyActions/main/jd_qjd.js -O /jd/scripts/jd_qjd.js
wget -q --no-check-certificate https://raw.githubusercontent.com/wuzhi04/MyActions/main/jd_goodMorning.js -O /jd/scripts/jd_goodMorning.js
wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/backup/main/npc/jd_pk.js -O /jd/scripts/jd_jxzpk.js
wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/backup/main/npc/jd_senbeans.js -O /jd/scripts/jd_lkyl.js
wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/backup/main/npc/jd_syj.js -O /jd/scripts/jd_zjd.js
wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/backup/main/npc/jd_tyt.js -O /jd/scripts/jd_tyt.js
wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/backup/main/npc/jd_wealth_island.js -O /jd/scripts/jd_wealth_island.js
wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/backup/main/star261/jd_star_movement_bet.js -O /jd/scripts/jd_star_movement_bet.js
wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/backup/main/star261/jd_star_movement_map.js -O /jd/scripts/jd_star_movement_map.js
wget -q --no-check-certificate https://raw.githubusercontent.com/shufflewzc/faker2/main/jd_fc.js -O /jd/scripts/jd_fcyqm.js
wget -q --no-check-certificate https://raw.githubusercontent.com/shufflewzc/faker2/main/jd_fcdyj.js -O /jd/scripts/jd_fcdyj.js
wget -q --no-check-certificate https://raw.githubusercontent.com/shufflewzc/faker2/main/jd_kd.js -O /jd/scripts/jd_kd.js
wget -q --no-check-certificate https://raw.githubusercontent.com/shufflewzc/faker2/main/jd_wxFans.js -O /jd/scripts/jd_wxFans.js
wget -q --no-check-certificate https://raw.githubusercontent.com/JDHelloWorld/jd_scripts/main/jd_big_winner.js -O /jd/scripts/jd_big_winner.js
wget -q --no-check-certificate https://raw.githubusercontent.com/shufflewzc/faker2/main/jd_ddnc_farmpark.js -O /jd/scripts/jd_ddnc_farmpark.js
wget -q --no-check-certificate https://raw.githubusercontent.com/shufflewzc/faker2/main/jd_esManager.js -O /jd/scripts/jd_esManager.js
wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/backup/main/npc/jd_blueCoin.js -O /jd/scripts/jd_new_blueCoin.js
wget -q --no-check-certificate https://raw.githubusercontent.com/smiek2221/scripts/master/gua_MMdou.js -O /jd/scripts/jd_gua_MMdou.js
wget -q --no-check-certificate https://raw.githubusercontent.com/shufflewzc/faker2/main/jd_jump.js -O /jd/scripts/jd_jump.js
wget -q --no-check-certificate https://raw.githubusercontent.com/shufflewzc/faker2/main/jd_gold_creator.js -O /jd/scripts/jd_gold_creator.js
wget -q --no-check-certificate https://raw.githubusercontent.com/shufflewzc/faker2/main/jd_productZ4Brand.js -O /jd/scripts/jd_productZ4Brand.js
wget -q --no-check-certificate https://raw.githubusercontent.com/shufflewzc/faker2/main/jd_bean_home.js -O /jd/scripts/jd_bean_home.js
wget -q --no-check-certificate https://raw.githubusercontent.com/shufflewzc/faker2/main/jd_angryBean.js -O /jd/scripts/jd_angryBean.js
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
wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/backup/main/smiek2221/gua_opencard9.js -O /jd/scripts/gua_opencard9.js
wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/backup/main/smiek2221/gua_opencard10.js -O /jd/scripts/gua_opencard10.js
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
wget -q --no-check-certificate https://raw.githubusercontent.com/forpw2009/backup/main/npc/jd_carnivalcity_help.js -O /jd/scripts/jd_help_carnivalcity.js

#添加需要添加的脚本 name
my_scripts_list_add="
lpss_vip
lpss_del_log
jd_clear_shop
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
jd_help_carnivalcity
"

#添加需要添加脚本的 cron
lpss_vip="*/10 * * * * bash /jd/config/lpss_vip.sh >> /jd/log/lpss_vip.log 2>&1"
lpss_del_log="23 23 * * * bash /jd/config/lpss_del_log.sh >> /jd/log/lpss_del_log.log 2>&1"
jd_super_redrain="0,1 0-23/1 * * * jd jd_super_redrain"
jd_half_redrain="30,31 20-23/1 * * * jd jd_half_redrain"
jd_clear_shop="45 22 * * * jd jd_clear_shop"
jd_monk_shop_lottery="1 15,23 * * * jd jd_monk_shop_lottery"
jd_npc_redrain="0 0-23/1 * * * jd jd_npc_redrain"
jd_daily_lottery="13 15,23 * * * jd jd_daily_lottery"
jd_friend="40 16 * * * jd jd_friend"
jd_zdjr="45 18 * * * jd jd_zdjr"
jd_babelDiy="50 15 * * * jd jd_babelDiy"
jd_mohe="0 0,15,16,17 * * * jd jd_mohe"
jd_ppdz="1 15 * * * jd jd_ppdz"
jd_star_shop="0 21 * * * jd jd_star_shop"
ddo_pk="16 15,19,21 * * * jd ddo_pk"
jd_jxlhb="5 15 * * * jd jd_jxlhb"
jd_lotteryMachine="10 15 * * * jd jd_lotteryMachine"
jd_starStore="5 15 * * * jd jd_starStore"
jd_ddo_joy_reward="15 15 * * * jd jd_ddo_joy_reward"
jd_big_winner="*/20 * * * * jd jd_big_winner"
jdmn="7 0,8,11,15 * * * jd jdmn"
jd_wsdlb="5 15-23/6 * * * jd jd_wsdlb"
jd_hwsx="20 12,15 * * * jd jd_hwsx"
jd_lsj="0 15,19 * * * jd jd_lsj"
jd_dogsEmploy="12 15 * * * jd jd_dogsEmploy"
jd_jxmc="20 15-23/3 * * * jd jd_jxmc"
jd_joy_park_help="30 15 * * * jd jd_joy_park_help"
jd_sign_graphics="10 15 * * * jd jd_sign_graphics"
jd_qjd="14 15 * * * jd jd_qjd"
jd_goodMorning="30 6 * * * jd jd_goodMorning"
jd_jxzpk="10 14,15,16 * * * jd jd_jxzpk"
jd_lkyl="13 15,18 * * * jd jd_lkyl"
jd_tyt="45 15,21 * * * jd jd_tyt"
jd_wish="3 15,18,21 * * * jd jd_wish"
jd_wealth_island="18 15-23/2 * * * jd jd_wealth_island"
jd_star_movement="20 15-23 * * * jd jd_star_movement"
jd_star_movement_bet="11 12,20 * * * jd jd_star_movement_bet"
jd_star_movement_map="7 15,20 * * * jd jd_star_movement_map"
jd_joy_steal="10 15-21/3 * * * jd jd_joy_steal"
jd_wxFans="1 15 * * * jd jd_wxFans"
jd_fcyqm="0,2 15 * * * jd jd_fcyqm"
jd_fcdyj="0,2 15 * * * jd jd_fcdyj"
jd_ddnc_farmpark="31 7 * * * jd jd_ddnc_farmpark"
jd_esManager="39 7 * * * jd jd_esManager"
jd_new_blueCoin="59 23 * * * jd jd_new_blueCoin"
jd_gua_MMdou="18 9 * * * jd jd_gua_MMdou"
jd_jump="1 0,11,21 * * * jd jd_jump"
jd_new_joy_reward="59 7,15,23 * * * jd jd_new_joy_reward"
jd_gold_creator="13 1,16,22 * * * jd jd_gold_creator"
jd_bean_home="23 1,12,22 * * * jd jd_bean_home"
jd_angryBean="0 0 * * * jd jd_angryBean"
jd_live_redrain="0,30 0-23/1 * * * jd jd_live_redrain"
jd_dpqd="12 12 * * * jd jd_dpqd"
jd_new_speed_redpocke="22 0,12,15,22 * * * jd jd_new_speed_redpocke"
jd_gua_doge="36 0,10,21 4-15 8 * jd jd_gua_doge"
jd_gua_carnivalcity="0 0-18/6 * * * jd jd_gua_carnivalcity"
jd_ldhwj="11 1,9,15,20 * * * jd jd_ldhwj"
jd_nzmh="35 1,8,15,23 * * * jd jd_nzmh"
jx_sign="20 1,8,15,22 * * * jd jx_sign"
jd_ryhxj="1 1 * * * jd jd_ryhxj"
gua_opencard9="45 11 * * * jd gua_opencard9"
gua_opencard10="45 11 * * * jd gua_opencard10"
jd_ylyn="40 5,18 * * * jd jd_ylyn"
jd_qcshj="30 9,21 12-20 8 * jd jd_qcshj"
gua_xmGame="33 8,22 13-31 8 * jd gua_xmGame"
gua_xiaolong="22 9,19 13-25 8 * jd gua_xiaolong"
jd_appliances="55 21,22 * * * jd jd_appliances"
jd_decompression="18,36 9,19,22 13-25 8 * jd jd_decompression"
jd_senbeans="45 16,22 * * * jd jd_senbeans"
jd_help_carnivalcity="10 15,17,22 * * * jd jd_help_carnivalcity"


#添加需要删除的脚本的 name
my_scripts_list_del="
gua_opencard9
gua_opencard10
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









