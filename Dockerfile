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

RUN { \
    echo 'opcache.enable=1'; \
    echo 'opcache.memory_consumption=128'; \
    echo 'opcache.interned_strings_buffer=8'; \
    echo 'opcache.max_accelerated_files=4000'; \
    echo 'opcache.revalidate_freq=2'; \
    echo 'opcache.fast_shutdown=1'; \
} > /usr/local/etc/php/conf.d/opcache.ini

WORKDIR /var/www/html
