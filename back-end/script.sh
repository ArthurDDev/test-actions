#!/bin/bash

echo "=================== STARTING BACK-END ==================="

ln -s /etc/nginx/sites-available/projeto.config-front /etc/nginx/sites-enabled/projeto.config-front
ln -s /etc/nginx/sites-available/projeto.config-back /etc/nginx/sites-enabled/projeto.config-back
rm /etc/nginx/sites-enabled/default
cp .env.example .env

composer install
php artisan key:generate
php artisan migrate:fresh
service nginx start

echo "=================== BACK-END CONFIG ENDED ==================="

sleep 20

echo "=================== NGINX STATUS ==================="
service nginx restart
service nginx status
echo "==================================================="

tail -f /dev/null # Garante que o container nao acaba