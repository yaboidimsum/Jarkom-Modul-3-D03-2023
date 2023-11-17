echo 'nameserver 10.23.1.3' > /etc/resolv.conf

apt-get update
apt-get install -y lsb-release ca-certificates apt-transport-https software-properties-common gnupg2
curl -sSLo /usr/share/keyrings/deb.sury.org-php.gpg https://packages.sury.org/php/apt.gpg
sh -c 'echo "deb [signed-by=/usr/share/keyrings/deb.sury.org-php.gpg] https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list'
apt-get update
apt-get install php8.0-fpm -y
apt-get install nginx -y
service nginx start
service php8.0-fpm start

cp /etc/nginx/sites-available/default /etc/nginx/sites-available/laravel-worker
# unlink
unlink /etc/nginx/sites-enabled/default
ln -s /etc/nginx/sites-available/laravel-worker /etc/nginx/sites-enabled/laravel-worker

# No 18
# Untuk memastikan ketiganya bekerja sama secara adil untuk mengatur Granz Channel maka implementasikan Proxy Bind pada Eisen untuk mengaitkan IP dari Frieren, Flamme, dan Fern. (18)
echo 'upstream worker {
    server 10.23.4.1:8001;
    server 10.23.4.2:8002;
    server 10.23.4.3:8003;
}

server {
    listen 80;
    server_name riegel.canyon.d03.com www.riegel.canyon.d03.com;

    location / {
        proxy_pass http://worker;
    }
} 
' > /etc/nginx/sites-available/laravel-worker

service nginx restart