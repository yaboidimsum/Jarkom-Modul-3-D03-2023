echo 'nameserver 10.23.1.3' > /etc/resolv.conf

apt-get update
apt install isc-dhcp-server -y

echo 'subnet 10.23.1.0 netmask 255.255.255.0 {
}

subnet 10.23.2.0 netmask 255.255.255.0 {
}

subnet 10.23.3.0 netmask 255.255.255.0 {
    range 10.23.3.16 10.23.3.32;
    range 10.23.3.64 10.23.3.80;
    option routers 10.23.3.0;
    option broadcast-address 10.23.3.255;
    option domain-name-servers 10.23.1.3;
    default-lease-time 180;
    max-lease-time 5760;
}

subnet 10.23.4.0 netmask 255.255.255.0 {
    range 10.23.4.12 10.23.4.20;
    range 10.23.4.160 10.23.4.168;
    option routers 10.23.4.0;
    option broadcast-address 10.23.4.255;
    option domain-name-servers 10.23.1.3;
    default-lease-time 720;
    max-lease-time 5760;
}

host Lugner  {
    hardware ethernet 62:4f:02:e4:b9:d9;
    fixed-address 10.23.3.1;
}

host Linie  {
    hardware ethernet 46:ce:7b:d6:39:b1;
    fixed-address 10.23.3.2;
}

host Lawine  {
    hardware ethernet 2a:36:9f:ff:a7:5b;
    fixed-address 10.23.3.3;
}

host Fern  {
    hardware ethernet fe:36:70:4f:cf:31;
    fixed-address 10.23.4.1;
}

host Flamme  {
    hardware ethernet 2e:64:4b:37:c4:c2;
    fixed-address 10.23.4.2;
}

host Frieren  {
    hardware ethernet 32:22:bb:85:ee:d4;
    fixed-address 10.23.4.3;
}' > /etc/dhcp/dhcpd.conf

echo 'INTERFACESv4="eth0"' > /etc/default/isc-dhcp-server

service isc-dhcp-server start