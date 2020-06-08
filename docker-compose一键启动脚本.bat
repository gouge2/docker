@echo off
color 0a

title docker-compose启动 ---

echo docker-compose 正在启动，请稍等.....

cmd /k "cd /d D:\docker\wnmp&&docker-compose up"

echo 启动成功

pause