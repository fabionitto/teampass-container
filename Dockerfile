FROM php:5.6-apache
MAINTAINER Fabio Nitto fabio.nitto@gmail.com

COPY config/php.ini /usr/local/etc/php/
RUN apt-get update && apt-get -y install \
		libmcrypt-dev \
		libssl-dev \
		openssl \
#		php5-dev \
		wget && \
	
	#Rename config0.m4 from openssl module to prevent phpize error
	cp /usr/src/php/ext/openssl/config0.m4 /usr/src/php/ext/openssl/config.m4 && \

	docker-php-ext-install -j$(nproc) mcrypt mbstring openssl && \
	mkdir /teampass-src && \
	cd /teampass-src && \

	wget https://github.com/nilsteampassnet/TeamPass/archive/2.1.24.4.tar.gz && \
	tar zxvf 2.1.24.4.tar.gz && \
	mkdir /var/www/html/src && \
	mv TeamPass-2.1.24.4/* /var/www/html/src/
