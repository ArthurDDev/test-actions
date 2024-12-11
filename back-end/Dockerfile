FROM php:7.4-fpm
WORKDIR /var/www/html/projeto/back-end/

RUN apt-get update && apt-get install -y \
    git \
    curl \
    zip \
    unzip \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libonig-dev \
    libxml2-dev \
    libzip-dev

RUN docker-php-ext-configure gd --with-freetype --with-jpeg
RUN docker-php-ext-install pdo pdo_mysql mbstring gd xml zip

RUN apt-get install nginx netcat -y

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
COPY . /var/www/html/projeto/back-end/

EXPOSE 8000
EXPOSE 9000
EXPOSE 80

#RUN composer install

#RUN php artisan passport:install --force
#RUN php artisan key:generate
#RUN php artisan migrate:fresh --force

CMD ["bash", "script.sh"]
