npm install
npm run build
pm2 start script.json
sleep 10
# echo "=================== PM2 STOPPED ==================="
pm2 status
# echo "==================================================="

tail -f /dev/null # Garante que o container nao acaba