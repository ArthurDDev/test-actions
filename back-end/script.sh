#!/bin/bash

echo "=================== STARTING BACK-END ==================="

add-apt-repository -y ppa:ondrej/php > /dev/null
apt-get install -y php7.4
apt-get install -y php7.4-curl php7.4-cli php7.4-dev php7.4-gd php7.4-intl php7.4-json php7.4-mysql php7.4-opcache php7.4-bcmath php7.4-mbstring php7.4-soap

ln -s /etc/nginx/sites-available/projeto.config-front /etc/nginx/sites-enabled/projeto.config-front
ln -s /etc/nginx/sites-available/projeto.config-back /etc/nginx/sites-enabled/projeto.config-back
rm /etc/nginx/sites-enabled/default
cp .env.example .env

composer install
php artisan key:generate
php artisan migrate:fresh
service nginx start

chown -R www-data:www-data storage bootstrap/cache #Permite que o servidor de fato acesse o armazenamento

echo "=================== BACK-END CONFIG ENDED ==================="

sleep 20

echo "=================== NGINX STATUS ==================="
service nginx restart
service nginx status
echo "==================================================="

php-fpm
#tail -f /dev/null # Garante que o container nao acaba
