title: centos 7 安装mariadb
date: 2017-08-23 10:33:42
tags: linux
categories: 数据库
---
<!-- more -->


@[TOC](Centos安装MariaDB)

##### 序言
**听说Oracle 公司要对mysql 进行推出收费版本了,一般收费版本肯定要比免费使用的版本功能更强大些,所以我感觉说不定要对免费版本限制功能了,那这样的话,还不如开始使用MySQL原作者推出的免费版--mariadb
其实就一点,跟centos一个样  免费跟收费的区别,所以一般公司用的还大多是centos  ,为啥 不收费呀!  ,而且centos就是rhel是一模一样的,唯一的差别改了一个图标而已,t同理,mysql跟mariadb底层是通用的,mariadb兼容MySQL,而且在MySQL的基础上增加了很多功能,更为强大好用**

---
&nbsp; 




  由于官网的MariaDB版本要比阿里云的版本要高，所以我们应该优先使用官方的版本
> 注意:　在centos7 中默认使用的数据库已经切换成了mariadb,所以我们通过yum安装的时候,直接安装MySQL就行

首先 添加MariaDB yum仓库

###### 1、首先在 RHEL/CentOS 和 Fedora 操作系统中添加 MariaDB 的 YUM 配置文件 MariaDB.repo 文件。
```shell
# 编辑创建mariadb.repo仓库文件
vi /etc/yum.repos.d/MariaDB.repo
```
###### 2、添加repo仓库配置

```shell
[mariadb]
name=MariaDB
baseurl=http://yum.mariadb.org/10.1/centos7-amd64
gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
gpgcheck=1
```

###### 3、当 MariaDB 仓库地址添加好后，你可以通过下面的一行命令轻松安装 MariaDB。

```shell
yum install MariaDB-server MariaDB-client -y
```

###### 4、如果官方的版本下载太慢，我们就直接使用阿里云的比较低的版本也可以

(1) 删除或者重命名刚才创建的Mariadb.repo文件
```shell
cd /etc/yum.repos.d
mv Mariadb.repo Mariadb.repo.bak
```
(2) 然后一条命令安装Mariadb
```shell
yum install mariadb-server mariadb -y
```

###### 5  启动mariadb命令

mariadb数据库的相关命令是：
```sehll
systemctl start mariadb  # 启动MariaDB
systemctl stop mariadb  # 停止MariaDB
systemctl restart mariadb  # 重启MariaDB
systemctl enable mariadb  # 设置开机启动
```

###### 6 初始化mysql

```shell
mysql_secure_installation
```

![](https://imgconvert.csdnimg.cn/aHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL2NoZW5sdXpob25nMTUwMzk0L2ltZy9tYXN0ZXIvMTIzLnBuZw)
![](https://imgconvert.csdnimg.cn/aHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL2NoZW5sdXpob25nMTUwMzk0L2ltZy9tYXN0ZXIvMi5wbmc)

###### 7 使用mysql命令进入数据库

```shell
mysql -u root -p
```

###### 8 mysql基本操作

```sql
1 创建数据库
2 创建表
create table qishitb (id int, name char(11));
3 插入数据
insert into qishitb values(1, "陈鹏");
4 查看数据
select * from qishitb;
```

```sql
查看数据库的信息
\s

查看表的编码信息
show create table qishitb
```

###### 9 解决中文乱码问题

(1)  修改配置文件

```sehll
vim /etc/my.cnf
```

(2) 添加以下配置文件(如图)

```sehll
[mysqld]
character-set-server=utf8
collation-server=utf8_general_ci
log-error=/var/log/mysqld.log
[client]
default-character-set=utf8
[mysql]
default-character-set=utf8
```

![](https://imgconvert.csdnimg.cn/aHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL2NoZW5sdXpob25nMTUwMzk0L2ltZy9tYXN0ZXIvZGF5OTQucG5n)

(3)  重启数据库
```shell
systemctl restart mariadb
```

 


