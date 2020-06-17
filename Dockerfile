# 正常的拓展包用docker-php-ext-install可以进行安装
# zend和redis需要准备拓展包进行安装拓展
FROM php:5.6-fpm
MAINTAINER Sheltie "sheltieey@gmail.com"

COPY ./source/zend-loader-php5.6-linux-x86_64 /root/zendGuardLoader
COPY ./source/redis-2.2.5 /root/redis-2.2.5
RUN cd \
	# 更新
	&& apt-get update \
	# 开启ini文件
	&& cp /usr/local/etc/php/php.ini-development /usr/local/etc/php/php.ini \
	# 打开docker的资源 将redis的拓展包放进去
	&& docker-php-source extract \
	&& mv /root/redis-2.2.5/redis /usr/src/php/ext/redis \
	# 安装所需的库
	&& apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libmcrypt-dev libpng-dev libxml2-dev \
	# 安装拓展
	&& docker-php-ext-install -j$(nproc) iconv mcrypt \
	&& docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
	&& docker-php-ext-install -j$(nproc) gd \
	&& docker-php-ext-install pdo pdo_mysql bcmath mysqli mysql soap zip redis \
	# 安装zend拓展
	&& docker-php-ext-enable /root/zendGuardLoader/ZendGuardLoader \
	&& cp /root/zendGuardLoader/ZendGuardLoader.so /usr/local/lib/php/extensions/no-debug-non-zts-20131226/ZendGuardLoader.so \
	&& rm -rf /usr/local/etc/php/conf.d/docker-php-ext-ZendGuardLoader.ini \
	&& mv /root/zendGuardLoader/docker-php-ext-ZendGuardLoader.ini /usr/local/etc/php/conf.d/docker-php-ext-ZendGuardLoader.ini \
	&& rm -rf /root/zendGuardLoader \
	# redis配置文件
	&& rm -rf /usr/local/etc/php/conf.d/docker-php-ext-redis.ini \
	&& mv /root/redis-2.2.5/docker-php-ext-redis.ini /usr/local/etc/php/conf.d/docker-php-ext-redis.ini \
	&& rm -rf /root/redis-2.2.5 \
	&& docker-php-source delete 
	
EXPOSE 9000

