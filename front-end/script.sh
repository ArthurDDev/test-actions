#!/bin/bash

# ====================================================== #
# Script de deploy automatico do front-end - NAO ALTERAR #
# ====================================================== #

npm install
npm run build

#Inicialização do servidor
pm2 start script.json

echo "=================== CONFIGURAÇÃO DO FRONT CONCLUIDA ==================="

# Garante que o container nao acabE
tail -f /dev/null