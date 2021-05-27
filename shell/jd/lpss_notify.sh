#!/usr/bin/env bash



my_sendNotify_file="/jd/scripts/sendNotify.js"
my_config_file="/jd/config/config.sh"


my_tg_token_str=`cat ${my_config_file} | grep "TG_BOT_TOKEN"`
my_tg_id_str=`cat ${my_config_file} | grep "TG_ID"`

my_dd_token_str=`cat ${my_config_file} | grep "DD_BOT_TOKEN"`
my_dd_sc_str=`cat ${my_config_file} | grep "DD_BOT_SECRET"`


sed -i "s/let TG_BOT_TOKEN = ''/${my_tg_token_str}/g" ${my_sendNotify_file}
sed -i "s/let TG_USER_ID = ''/${my_tg_id_str}/g" ${my_sendNotify_file}

sed -i "s/let DD_BOT_TOKEN = ''/${my_dd_token_str}/g" ${my_sendNotify_file}
sed -i "s/let DD_BOT_SECRET = ''/${my_dd_sc_str}/g" ${my_sendNotify_file}

echo -e "推送 ck 更新完成 "
