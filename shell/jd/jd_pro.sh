docker run -dit \
   -v $PWD/ql/config:/ql/config \
   -v $PWD/ql/log:/ql/log \
   -v $PWD/ql/db:/ql/db \
   -p 10086:5700 \
   -e ENABLE_HANGUP=false \
   -e ENABLE_WEB_PANEL=true \
   --name ql \
   --hostname ql \
   --restart always \
   whyour/qinglong:latest
 
 152.67.210.63
   
   ############################## 更新diy.sh ##############################
# cd $ConfigDir
# echo -e "开始更新 diy.sh "
# wget -q --no-check-certificate https://ghproxy.com/https://raw.githubusercontent.com/Hydrahail-Johnson/diy_scripts/main/diy.sh -O diy.sh.new
# if [ $? -eq 0 ]; then
#  mv -f diy.sh.new diy.sh
#  echo -e "更新 diy.sh 成功!!! \n"
# else
#  rm -rf diy.sh.new
#  echo -e "更新 diy.sh 失败...\n"
# fi


docker run -dit \
   -v $PWD/ql/config:/ql/config \
   -v $PWD/ql/log:/ql/log \
   -v $PWD/ql/db:/ql/db \
   --net host \
   --name qinglong \
   --hostname qinglong \
   --restart always \
   whyour/qinglong:latest
   
   
   version: "2.0"
services:
  jd:
    image: lpssxs/jd_pro:latest
    container_name: jd
    restart: always
    tty: true
    network_mode: bridge
    hostname: jd
    volumes:
      - ./config:/jd/config
      - ./log:/jd/log
      - ./own:/jd/own
    ports:
      - 8765:5678
    environment: 
      - ENABLE_TTYD=true         # 是否在启动容器时自动启动网页终端，当ENABLE_WEB_PANEL=true时此项设置才生效，ttyd未做防护，容易被黑进去，建议不要启用
      - ENABLE_WEB_PANEL=true    # 是否在启动容器时自动启动控制面板，启用后不改密码导致被黑本人不负责
      - ENABLE_HANGUP=false       # 是否在启动容器时自动启动挂机程序