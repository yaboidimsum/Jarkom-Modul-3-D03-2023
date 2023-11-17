# 7 dan 8
echo 'nameserver 10.23.1.3' > /etc/resolv.conf

apt-get update
apt-get install nginx -y
apt-get install lynx -y
apt-get install apache2-utils -y
service nginx start

cp /etc/nginx/sites-available/default /etc/nginx/sites-available/lb_php

echo 'upstream worker {
    server 10.23.3.1;
    server 10.23.3.2;
    server 10.23.3.3;
}

server {
    listen 80;
    server_name granz.channel.d03.com www.granz.channel.d03.com;

    root /var/www/html;
    index index.html index.htm index.nginx-debian.html;

    location / {
        allow 10.23.3.69;
        allow 10.23.3.70;
        allow 10.23.4.167;
        allow 10.23.4.168;
        deny all;
        proxy_pass http://worker;
    }

    location ~ /its {
        proxy_pass https://www.its.ac.id;
        proxy_set_header Host www.its.ac.id;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}' > /etc/nginx/sites-available/lb_php

ln -s /etc/nginx/sites-available/lb_php /etc/nginx/sites-enabled/
rm /etc/nginx/sites-enabled/default

service nginx restart

mkdir /etc/nginx/rahasisakita
htpasswd -c /etc/nginx/rahasisakita/htpasswd netics

# auth_basic "Restricted Content";
# auth_basic_user_file /etc/nginx/rahasisakita/htpasswd;

