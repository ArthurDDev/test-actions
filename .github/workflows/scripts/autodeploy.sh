cd /var/www/html/test-actions/front-end
PID=$(cat PID)
kill $PID
cd /var/www/html/test-actions
git pull
cd /var/www/html/test-actions/back-end
/etc/init.d/mysql restart
php artisan key:generate
php artisan migrate:fresh --seed
php artisan passport:install
php artisan storage:link
cd /var/www/html/test-actions/front-end
npm run build
nohup node .output/server/index.mjs &
lsof -i :3000 | awk 'NR > 1 {print $2}' > PID
service nginx restart
