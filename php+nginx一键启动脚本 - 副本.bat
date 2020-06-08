@echo off
color 0a

title php+nginx启动 ---

echo php正在重启，请稍等.....

docker restart php-server

echo php启动成功

echo nginx正在重启，请稍等.....

docker restart nginx-server

echo nginx启动成功

ver