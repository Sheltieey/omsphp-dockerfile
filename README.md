## omephp56 镜像介绍

**此镜像build出来后一共500M,根据商派的oms所需环境写的dockerfile，所以此镜像用在商派的ome开发环境是100%拿来即用**

* work directory:  /var/www/html
* Configuration File path:  /usr/local/etc/php
* Scan this dir for additional .ini files:  /usr/local/etc/php/conf.d
* Installing shared extensions:  /usr/local/lib/php/extensions/no-debug-non-zts-20131226/
* Installing header files:  /usr/local/include/php/

*tips:大部分拓展都可以用docker的工具来进行安装，zend和redis的拓展是需要自行准备拓展文件*


## 安装的镜像拓展

* iconv
* mcrypt
* gd
* pdo
* pdo_mysql
* bcmath
* mysqli
* mysql
* soap
* zip
* redis
* ZendGuardLoader
* redis
