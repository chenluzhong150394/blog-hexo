---
title: centos安装python3时候的坑
date: 2019-08-12 12:22:00
tags: linux
categories: linux
keywords: 博客文章密码
password: 123
abstract: 这是一篇加密的内容，没有密码不让看哦
message:  公司机密，谅解谅解
---




### 当使用源码编译安装`python3`的之后做软链接到/usr/bin,会出现问题,无法执行python命令,

就是无法直接做软链接到用户的命令目录下.执行不了



解决方法:  在python的安装目录,对python3.6 这个脚本做软链接,然后再将做好的软链接拷贝到/usr/bin 下就能正常执行python3命令了

pip同理
