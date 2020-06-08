FROM php:7.2-fpm

ENV TZ=Asia/Shanghai
ENV DEPENDENCIES curl gnupg git wget gcc g++ vim yum

ENV PHP_DEPENDENCIES \
    libwebp-dev libmcrypt-dev libmemcached-dev libbz2-dev libpng-dev \
    libxpm-dev librabbitmq-dev libfreetype6-dev libjpeg-dev libssh-dev
ENV PHP_EXT_INSTALLED \
    swoole redis memcached mcrypt

# INSTALL PHP
RUN apt-get update \
	&& apt-get install -y $PHP_DEPENDENCIES $DEPENDENCIES \
	&& pecl install -o -f $PHP_EXT_INSTALLED \
	&& docker-php-ext-configure gd --with-gd --with-webp-dir --with-jpeg-dir \
	  --with-png-dir --with-zlib-dir --with-xpm-dir --with-freetype-dir \
	&& docker-php-ext-install opcache bcmath bz2 gd iconv mysqli pdo pdo_mysql zip sockets \
	&& docker-php-ext-enable opcache redis memcached swoole mcrypt
  && apt-get update && apt-get install vim -y && apt-get update && apt-get install yum -y

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
ENV COMPOSER_ALLOW_SUPERUSER=1

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
  && apt-get -y remove $DEPENDENCIES \
  && apt-get purge -y --auto-remove \
  && rm -rf /var/lib/apt/lists/* \
  && rm -rf /tmp/pear ~/.pearrc