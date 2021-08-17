#!/usr/bin/env bash

# 脚本作者 ：  落魄书生
# 更新时间 ：  2021/8/17
# 脚本功能 ：  check lpss_diy.sh exist or not 

my_diy_file_dir="/jd/config/lpss_diy.sh"
my_vip_file_dir="/jd/config/lpss_vip.sh"

check_result_1=`cat ${my_diy_file_dir} | grep "lpss_diy脚本自动更新完成"`
check_result_2=`cat ${my_diy_file_dir} | grep "lpss_vip脚本自动更新完成"`

if [[ "$check_result_1" = "" ]]; then 

    echo -e "自动更新lpss_diy中~\n"
    wget -q https://raw.githubusercontent.com/forpw2009/my_scripts/main/shell/jd/lpss_diy.sh -O /jd/config/lpss_diy.sh && chmod +x /jd/config/lpss_diy.sh
    echo -e "lpss_diy脚本自动更新完成,感谢使用---下次同步时间为10min后"

fi 
    echo -e "lpss_diy文件存在，无需更新~\n"
