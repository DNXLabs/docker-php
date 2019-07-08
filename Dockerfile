FROM php:7.2-apache

RUN apt-get update &&  apt-get install -y libmcrypt-dev \
    zlib1g-dev\
    libxml2-dev \
    libpng-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    && pecl install mcrypt-1.0.2 \
    && docker-php-ext-enable mcrypt \
    && docker-php-ext-install pdo pdo_mysql mysqli mbstring zip xml gettext exif \
    && docker-php-ext-enable mcrypt exif \
    && a2enmod rewrite \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/  \
    && docker-php-ext-install gd


EXPOSE 80


