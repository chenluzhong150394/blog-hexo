---
title: 数据库常用操作
date: 2019-08-10 13:52:50
tags: linux
categories: 数据库
---
<!-- more -->



## 数据库操作



### 数据库的基本操作



#### 修改root密码

~~~mysql
alter user root identifiled by password 'password'
~~~



MySQL修改用户的密码主要有两种方法：ALTER USER 和SET PASSWORD

### ALTER USER 

**基本使用**

```
ALTER USER testuser IDENTIFIED BY '123456';
```

**修改当前登录用户**

```
ALTER USER USER() IDENTIFIED BY '123456';
```

**使密码过期**

```
ALTER USER testuser IDENTIFIED BY '123456' PASSWORD EXPIRE;
```

**使密码从不过期**

```
ALTER USER testuser IDENTIFIED BY '123456' PASSWORD EXPIRE NEVER;
```

**按默认设置过期时间**

```
ALTER USER testuser IDENTIFIED BY '123456' PASSWORD EXPIRE DEFAULT;
```

**指定过期间隔**

```
ALTER USER testuser IDENTIFIED BY '123456' PASSWORD EXPIRE INTERVAL 90 DAY;
```

**在MySQL文档里，推荐使用ALTER USER修改用户密码**

### SET PASSWORD

使用SET PASSWORD的password有两种：

使用默认加密

```
SET PASSWORD FOR testuser = '123456'
```

使用PASSWORD()函数加密

```
SET PASSWORD FOR testuser = PASSWORD("123456")
```

































### 增删查改



#### 增加

1、增加一个字段

~~~mysql
insert 
~~~

2、增加一条记录

~~~mysql

~~~

3、在多表关联的情况下，新增一条数据

~~~mysql

~~~



#### 删除

1、删除一个字段

~~~mysql

~~~

2、删除一条记录

~~~mysql

~~~

3、删除多表中相关联的数据

~~~mysql

~~~



#### 更新

1、更新一个字段名（在不改变原来数据的情况下）

~~~mysql

~~~

2、更新一条数据中的某个字段的数据

~~~mysql

~~~

3、在多表关联的情况下更新相关联的字段数据

~~~mysql

~~~





#### 查询

1、单表查询（查询满足特定条件的所有数据）

~~~mysql

~~~

2、使用左连接查询多表

~~~mysql

~~~







#### 修改

1、给字段添加注释

~~~mysql
#### 创建表的时候加注释
create table test1(name char(32) comment'字段注释') comment=‘表注释’；

### 修改某个字段的属性并加上注释
ALTER table table_name MODIFY `column_name` datetime DEFAULT NULL COMMENT '这是字段的注释'  
~~~

2、给表加注释

~~~mysql
alter table table_name comment='这是表的注释'
~~~







