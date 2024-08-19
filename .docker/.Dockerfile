FROM php:8.2-fpm as app
USER root
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer
RUN apt-get update && apt-get install -y \
    libonig-dev \
    libxml2-dev \
    unzip \
    libpq-dev \
    libzip-dev
RUN docker-php-ext-install mysqli pdo_mysql exif zip mbstring
WORKDIR /var/www/html
ADD ./.docker/php.ini /usr/local/etc/php/php.ini
RUN groupadd --force -g 1000 deploy
RUN useradd -ms /bin/bash --no-user-group -g 1000 -u 1337 deploy
CMD ["php-fpm"]
EXPOSE 9000
USER 1000
