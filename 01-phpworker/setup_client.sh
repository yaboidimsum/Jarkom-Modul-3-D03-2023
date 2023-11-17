echo 'nameserver 10.23.1.3' > /etc/resolv.conf

apt update
apt install lynx -y
apt install htop -y
apt install apache2-utils -y

# test no 7 dan 8
# ab -n 1000 -c 100 http://www.granz.channel.d03.com/ 

# Testing load balancing algorithm -> Round Robin, Least Connection, IP Hash, dan Generic Hash


# test no 9 
# Dengan menggunakan algoritma Round Robin, lakukan testing dengan menggunakan 3 worker, 2 worker, dan 1 worker sebanyak 100 request dengan 10 request/second, kemudian tambahkan grafiknya pada grimoire. (9)
# ab -n 100 -c 10 http://10.23.2.3/

# ab -n 200 -c 10 http://10.23.4.1/me 