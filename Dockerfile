FROM php:7.2-apache-stretch

RUN apt-get update \
    &&  apt-get install -y libmcrypt-dev \
      zlib1g-dev\
      libxml2-dev \
      libpng-dev \
      libxpm-dev \
      libfreetype6-dev \
      libjpeg62-turbo-dev \
    && a2enmod rewrite \
    && pecl install mcrypt-1.0.2 \
    && docker-php-ext-install gd pdo pdo_mysql mysqli mbstring zip xml gettext exif \
    && docker-php-ext-enable mcrypt exif \
    && docker-php-ext-configure gd --with-gd \ 
      --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/include/ --with-zlib-dir \
      --with-xpm-dir=/usr/include/ --with-freetype-dir=/usr/include/ 


EXPOSE 80


