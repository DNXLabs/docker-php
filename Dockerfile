FROM php:7.4-apache-buster

RUN apt-get update \
    &&  apt-get install -y build-essential \ 
        libmcrypt-dev \
        zlib1g-dev \
        libxml2-dev \
        libpng-dev \
        libxpm-dev \
        libfreetype6-dev \
        libjpeg-dev \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libonig-dev \
        libzip-dev \
    && a2enmod rewrite \
    && pecl install mcrypt-1.0.3 \
    && docker-php-ext-install pdo pdo_mysql mysqli mbstring zip xml gettext exif \
    && docker-php-ext-enable mcrypt exif \
    && docker-php-ext-configure gd --with-jpeg \
    --with-xpm --with-freetype \ 
    && docker-php-ext-install gd 

EXPOSE 80
