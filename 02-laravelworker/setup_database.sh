echo 'nameserver 10.23.1.3' > /etc/resolv.conf

apt-get update
apt-get install mariadb-server -y
service mysql start

CREATE USER 'kelompokd03'@'%' IDENTIFIED BY 'passwordd03';
CREATE USER 'kelompokd03'@'localhost' IDENTIFIED BY 'passwordd03';
CREATE DATABASE dbkelompokd03;
GRANT ALL PRIVILEGES ON *.* TO 'kelompokd03'@'%';
GRANT ALL PRIVILEGES ON *.* TO 'kelompokd03'@'localhost';
FLUSH PRIVILEGES;

# Db akan diakses oleh 3 worker, maka 
echo '# This group is read both by the client and the server
# use it for options that affect everything
[client-server]

# Import all .cnf files from configuration directory
!includedir /etc/mysql/conf.d/
!includedir /etc/mysql/mariadb.conf.d/

# Options affecting the MySQL server (mysqld)
[mysqld]
skip-networking=0
skip-bind-address
' > /etc/mysql/my.cnf