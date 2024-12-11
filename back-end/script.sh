#!/bin/bash

# ===================================================== #
# Script de deploy automatico do back-end - NAO ALTERAR #
# ===================================================== #

echo "=================== INICIANDO O BACK-END ==================="

# Configuração do NGINX
ln -s /etc/nginx/sites-available/projeto.config-front /etc/nginx/sites-enabled/projeto.config-front
ln -s /etc/nginx/sites-available/projeto.config-back /etc/nginx/sites-enabled/projeto.config-back
rm /etc/nginx/sites-enabled/default
cp .env.example .env

# Configuração do back-end
composer install
php artisan key:generate
php artisan migrate:fresh
service nginx start

# Acesso ao armazenamento
chown -R www-data:www-data storage bootstrap/cache

echo "=================== COPNFIGURAÇÃO DO BACK CONCLUÍDA ==================="

php-fpm
