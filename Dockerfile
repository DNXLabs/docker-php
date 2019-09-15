FROM php:5.6-apache

RUN apt-get update \
        &&  apt-get install -y libssl-dev \
                libmcrypt-dev \
                zlib1g-dev \
                libxml2-dev \
                libpng-dev \
                libxpm-dev \
                libfreetype6-dev \
                libjpeg-dev \
                libfreetype6-dev \
                libjpeg62-turbo-dev \
        && pecl install mongo \
        && docker-php-ext-install mcrypt \
        && docker-php-ext-install pdo pdo_mysql mysqli mbstring zip xml gettext exif \
        && docker-php-ext-enable exif mcrypt mongo\
        && docker-php-ext-configure gd --with-gd \ 
                --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/include/ --with-zlib-dir \
                --with-xpm-dir=/usr/include/ --with-freetype-dir=/usr/include/ \ 
        && docker-php-ext-install gd 

EXPOSE 80