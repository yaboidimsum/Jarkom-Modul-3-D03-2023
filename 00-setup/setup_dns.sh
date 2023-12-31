echo 'nameserver 192.168.122.1' > /etc/resolv.conf
apt-get update
apt install bind9 -y

# Temporary
echo 'zone "riegel.canyon.d03.com" {
    type master;
    file "/etc/bind/sites/riegel.canyon.d03.com";
};

zone "granz.channel.d03.com" {
    type master;
    file "/etc/bind/sites/granz.channel.d03.com";
};

zone "1.23.10.in-addr.arpa" {
    type master;
    file "/etc/bind/sites/1.23.10.in-addr.arpa";
};' > /etc/bind/named.conf.local

mkdir -p /etc/bind/sites
cp /etc/bind/db.local /etc/bind/sites/riegel.canyon.d03.com
cp /etc/bind/db.local /etc/bind/sites/granz.channel.d03.com
cp /etc/bind/db.local /etc/bind/sites/1.23.10.in-addr.arpa

echo ';
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     riegel.canyon.d03.com. root.riegel.canyon.d03.com. (
                        2023111401      ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      riegel.canyon.d03.com.
@       IN      A       10.23.2.3     ; IP LB Eiken
www     IN      CNAME   riegel.canyon.d03.com.' > /etc/bind/sites/riegel.canyon.d03.com

echo '
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     granz.channel.d03.com. root.granz.channel.d03.com. (
                        2023111401      ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      granz.channel.d03.com.
@       IN      A       10.23.2.3     ; IP LB Eiken
www     IN      CNAME   granz.channel.d03.com.' > /etc/bind/sites/granz.channel.d03.com

echo '
; BIND reverse data file for local loopback interface
;
$TTL    604800
@       IN      SOA     riegel.canyon.d03.com. root.riegel.canyon.d03.com. (
                        2023111401      ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      riegel.canyon.d03.com.
1       IN      PTR     riegel.canyon.d03.com.' > /etc/bind/sites/1.23.10.in-addr.arpa

echo 'options {
      directory "/var/cache/bind";

      forwarders {
              192.168.122.1;
      };

      // dnssec-validation auto;
      allow-query{any;};
      auth-nxdomain no;    # conform to RFC1035
      listen-on-v6 { any; };
}; ' >/etc/bind/named.conf.options

service bind9 start