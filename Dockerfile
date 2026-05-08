FROM php:8.3-fpm

RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libwebp-dev \
    libzip-dev \
    libxml2-dev \
    libicu-dev \
    libonig-dev \
    && docker-php-ext-configure gd --with-jpeg --with-webp \
    && docker-php-ext-install \
        pdo_mysql \
        mysqli \
        gd \
        zip \
        xml \
        mbstring \
        intl \
        exif \
        opcache \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /var/www/html
