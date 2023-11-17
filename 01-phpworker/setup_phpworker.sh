echo 'nameserver 10.23.1.3' > /etc/resolv.conf

apt-get update
apt-get install nginx -y
apt-get install wget -y
apt-get install unzip -y
apt-get install lynx -y
apt-get install htop -y
apt-get install apache2-utils -y
apt-get install php7.3 php-fpm -y
apt install python3-pip -y
pip3 install gdown

service nginx start
service php7.3-fpm start

mkdir /var/www/granz.channel.d03.com
cd /var/www/granz.channel.d03.com
gdown https://drive.google.com/uc?id=1ViSkRq7SmwZgdK64eRbr5Fm1EGCTPrU1
unzip -j granz.channel.yyy.com.zip
rm granz.channel.yyy.com.zip

cp /etc/nginx/sites-available/default /etc/nginx/sites-available/granz.channel.d03.com
ln -s /etc/nginx/sites-available/granz.channel.d03.com /etc/nginx/sites-enabled/
rm /etc/nginx/sites-enabled/default

echo 'server {
    listen 80;
    server_name _;

    root /var/www/granz.channel.d03.com;
    index index.php index.html index.htm;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/run/php/php7.3-fpm.sock;  # Sesuaikan versi PHP dan socket
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        include fastcgi_params;
    }
}' > /etc/nginx/sites-available/granz.channel.d03.com

service nginx restart