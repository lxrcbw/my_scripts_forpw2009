#!/bin/bash

# 脚本作者 ：  lpssxs
# 更新时间 ：  2021/5/24

rm -rf /ql/repo/lpssxs/*.js
cp -rf /ql/repo/chinnkarahoi_jd_scripts/jd*.js /ql/repo/lpssxs/
find /ql/repo/monk-coder_dust/ -name "monk_*.js"  -exec cp -rf {} /ql/repo/lpssxs/ \;
find /ql/repo/monk-coder_dust/ -name "adolf_*.js"  -exec cp -rf {} /ql/repo/lpssxs/ \;
find /ql/repo/nianyuguai_longzhuzhu/ -name "jd_*.js"  -exec cp -rf {} /ql/repo/lpssxs/ \;
find /ql/repo/whyour_hundun/ -name "jx_*.js"  -exec cp -rf {} /ql/repo/lpssxs/ \;

cd  /ql/repo/lpssxs

git add .

remark=$(date +"%Y-%m-%d %H:%M:%S")
git commit -m "同步时间：${remark}"

git pull origin main
git push origin main

echo "JD Scripts 同步成功~"
