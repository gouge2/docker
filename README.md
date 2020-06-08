# docker配置lnmp环境
- 若要新增nginx域名，如asd.com则先在yml文件的nginx容器加入
``
  extra_hosts:
      - ads.com:127.0.0.1
``
，然后在本地host 找到host.docker.internal对应ip，添加域名host信息，实现容器与宿主机实现host通信


### docker配置中可能需要用到的命令操作：
#### 1、更新apt: apt update
#### 2、使用apt安装 vim、yum等 如：apt-get update && apt-get install vim -y
#### 3、使用docker强制删除镜像：docker rmi -f 镜像id
#### 4、查看在运行的容器：docker ps
#### 5、查看镜像 ：docker images
#### 6、将容器的文件复制到宿主机如（在容器外执行）：docker cp 71f877560652:/var/log/mysql/error.log D:\docker\wnmp\mysql-log
#### 7、强制删除没用到的镜像：docker image prune -a -f 
#### 8、重命名镜像：docker tag 镜像id 新名称：新tag
#### 9、清理docker缓存：docker system prune --volumes
#### 10、查看当前mysql版本： mysql -uroot -p123456
#### 11、查看当前redis版本：docker exec -it  redis-server（这个是容器名称）  redis-server -v
#### 12、查看容器运行的各种数据：docker inspect 容器名称（容器ID）
