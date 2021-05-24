#!/bin/bash

# 脚本作者 ：  lpssxs
# 更新时间 ：  2021/5/24


cp -rf /ql/repo/chinnkarahoi_jd_scripts/jd*.js /ql/repo/lpssxs/lxk/
find /ql/repo/monk-coder_dust/ -name "monk_*.js"  -exec cp -rf {} /ql/repo/lpssxs/monk/ \;
find /ql/repo/monk-coder_dust/ -name "adolf_*.js"  -exec cp -rf {} /ql/repo/lpssxs/adolf/ \;
find /ql/repo/nianyuguai_longzhuzhu/ -name "jd_*.js"  -exec cp -rf {} /ql/repo/lpssxs/longzhuzhu/ \;
find /ql/repo/whyour_hundun/ -name "jx_*.js"  -exec cp -rf {} /ql/repo/lpssxs/whyour/ \;
find /ql/repo/whyour_hundun/ -name "jd*.js"  -exec cp -rf {} /ql/repo/lpssxs/whyour/ \;

cd  /ql/repo/lpssxs

git add .

remark=$(date +"%Y-%m-%d %H:%M:%S")
git commit -m "同步时间：${remark}"

git pull origin main --allow-unrelated-histories
git push origin main

echo "JD Scripts 同步成功~"
