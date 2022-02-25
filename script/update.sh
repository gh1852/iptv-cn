#!/bin/bash

git_pull() {
  cd ~/localProjects/iptv
  proxychains git reset --hard origin/master
}

iptv_check() {
  cat $(find . -name "cn.m3u") | iptv-checker -t 3000 -o temp -p 10
  mv -f temp/online.m3u ../iptv-cn/iptv-cn.m3u
  rm -rf temp
}

git_push(){
  cd ~/localProjects/iptv-cn
  git commit -am "- 更新频道源"
  proxychains git push
}

echo 'git pull start'
git_pull
echo 'git pull done'

echo 'iptv check start'
iptv_check
echo 'iptv check finish'

git_push
echo 'update channels finish'