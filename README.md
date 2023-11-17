# Praktikum Modul 3 Jaringan Komputer

Perkenalkan kami dari kelas `Jaringan Komputer D Kelompok D03`, dengan anggota sebagai berikut:

| Nama                   | NRP        |
| ---------------------- | ---------- |
| Alfan Lukeyan Rizki    | 5025211046 |
| Dimas Prihady Setyawan | 5025211184 |

## Daftar Isi

- [Official Report](#laporan-resmi)
  - [Menu](#daftar-isi)
  - [Topology](#topology)
  - [Node Config](#config)
  - [Prerequisite](#prerequisite)
- [Question 1 - DHCP](#Soal-1)
  - [Script Solution](#script)
  - [Test Result](#result)
- [Question 2 - DHCP](#Soal-2)
  - [Script Solution](#script-1)
  - [Test Result](#result-1)
- [Question 3 - DHCP](#Soal-3)
  - [Script Solution](#script-2)
  - [Test Result](#result-2)
- [Question 4 - DHCP](#Soal-4)
  - [Script Solution](#script-3)
  - [Test Result](#result-3)
- [Question 5 - DHCP](#Soal-5)
  - [Script Solution](#script-4)
  - [Test Result](#result-4)
- [Question 6 - Reverse Proxy](#Soal-6)
  - [Script Solution](#script-5)
  - [Test Result](#result-5)
- [Question 7 - Reverse Proxy](#Soal-7)
  - [Script Solution](#script-6)
  - [Test Result](#result-6)
- [Question 8 - Reverse Proxy](#Soal-8)
  - [Script Solution](#script-7)
  - [Test Result](#result-7)
- [Question 9 - Reverse Proxy](#Soal-9)
  - [Script Solution](#script-8)
  - [Test Result](#result-8)
- [Question 10 - Reverse Proxy](#Soal-10)
  - [Script Solution](#script-9)
  - [Test Result](#result-9)
- [Question 11 - Reverse Proxy](#Soal-11)
  - [Script Solution](#script-10)
  - [Test Result](#result-10)
- [Question 12 - Reverse Proxy](#Soal-12)
  - [Script Solution](#script-11)
  - [Test Result](#result-11)
- [Question 13 - Implementasi Laravel](#Soal-13)
  - [Script Solution](#script-12)
  - [Test Result](#result-12)
- [Question 14 - Implementasi Laravel](#Soal-14)
  - [Script Solution](#script-13)
  - [Test Result](#result-13)
- [Question 15 - Implementasi Laravel](#Soal-15)
  - [Script Solution](#script-14)
  - [Test Result](#result-14)
- [Question 16 - Implementasi Laravel](#Soal-16)
  - [Script Solution](#script-15)
  - [Test Result](#result-15)
- [Question 17 - Implementasi Laravel](#Soal-17)
  - [Script Solution](#script-16)
  - [Test Result](#result-16)
- [Question 18 - Implementasi Laravel](#Soal-18)
  - [Script Solution](#script-17)
  - [Test Result](#result-17)
- [Question 19 - Implementasi Laravel](#Soal-19)
  - [Script Solution](#script-18)
  - [Test Result](#result-18)
- [Question 20 - Implementasi Laravel](#Soal-20)
  - [Script Solution](#script-19)
  - [Test Result](#result-19)

### Topology

![Alt text](./images/image.png)

### Config

- Router
    - Aura (DHCP Relay)
    ```
    auto eth0
    iface eth0 inet dhcp

    auto eth1
    iface eth1 inet static
        address 10.23.1.1
        netmask 255.255.255.0

    auto eth2
    iface eth2 inet static
        address 10.23.2.1
        netmask 255.255.255.0

    auto eth3
    iface eth3 inet static
        address 10.23.3.0
        netmask 255.255.255.0

    auto eth4
    iface eth4 inet static
        address 10.23.4.0
        netmask 255.255.255.0
    ```
    
- Switch 1
    - Himmel (DHCP Server)
    ```
    auto eth0
    iface eth0 inet static
        address 10.23.1.2
        netmask 255.255.255.0
        gateway 10.23.1.1
    ```
    - Helter (DNS Server)
    ```
    auto eth0
    iface eth0 inet static
        address 10.23.1.3
        netmask 255.255.255.0
        gateway 10.23.1.1
    ```
- Switch 2
    - Denken (Database Server)
    ```
    auto eth0
    iface eth0 inet static
        address 10.23.2.2
        netmask 255.255.255.0
        gateway 10.23.2.1
    ```
    - Eisen (Load Balancer)
    ```
    auto eth0
    iface eth0 inet static
        address 10.23.2.3
        netmask 255.255.255.0
        gateway 10.23.2.1
    ```
- Switch 3
    - Lugner (PHP Worker)
    ```
    auto eth0
    iface eth0 inet dhcp
    hwaddress ether 62:4f:02:e4:b9:d9
    ```
    - Linie (PHP Worker)
    ```
    auto eth0
    iface eth0 inet dhcp
    hwaddress ether 46:ce:7b:d6:39:b1
    ```
    - Lawine (PHP Worker)
    ```
    auto eth0
    iface eth0 inet dhcp
    hwaddress ether 2a:36:9f:ff:a7:5b
    ```
    - Richter (PHP Client)
    ```
    auto eth0
    iface eth0 inet dhcp
    ```
    - Revolte (PHP Client)
    ```
    auto eth0
    iface eth0 inet dhcp
    ```
- Switch 4
    - Fern (Laravel Worker)
    ```
    auto eth0
    iface eth0 inet dhcp
    hwaddress ether fe:36:70:4f:cf:31
    ```
    - Flamme (Laravel Worker)
    ```
    auto eth0
    iface eth0 inet dhcp
    hwaddress ether 2e:64:4b:37:c4:c2
    ```
    - Frieren (Laravel Worker)
    ```
    auto eth0
    iface eth0 inet dhcp
    hwaddress ether 32:22:bb:85:ee:d4
    ```
    - Stark (Laravel Client)
    ```
    auto eth0
    iface eth0 inet dhcp
    ```
    - Sein (Laravel Client)
    ```
    auto eth0
    iface eth0 inet dhcp
    ```

## Soal-1
> Lakukan konfigurasi sesuai dengan peta yang sudah diberikan. Semua CLIENT harus menggunakan konfigurasi dari DHCP Server.

## Soal-2
> Client yang melalui Switch3 mendapatkan range IP dari [prefix IP].3.16 - [prefix IP].3.32 dan [prefix IP].3.64 - [prefix IP].3.80 (2)

## Soal-3
> Client yang melalui Switch4 mendapatkan range IP dari [prefix IP].4.12 - [prefix IP].4.20 dan [prefix IP].4.160 - [prefix IP].4.168 (3)

## Soal-4
> Client mendapatkan DNS dari Heiter dan dapat terhubung dengan internet melalui DNS tersebut (4)

## Soal-5
> Lama waktu DHCP server meminjamkan alamat IP kepada Client yang melalui Switch3 selama 3 menit sedangkan pada client yang melalui Switch4 selama 12 menit. Dengan waktu maksimal dialokasikan untuk peminjaman alamat IP selama 96 menit (5)

## Soal-6
> Pada masing-masing worker PHP, lakukan konfigurasi virtual host untuk website berikut dengan menggunakan php 7.3. (6)

## Soal-7
> Kepala suku dari Bredt Region memberikan resource server sebagai berikut:
```
- Lawine, 4GB, 2vCPU, dan 80 GB SSD.
- Linie, 2GB, 2vCPU, dan 50 GB SSD.
- Lugner 1GB, 1vCPU, dan 25 GB SSD.
```
> aturlah agar Eisen dapat bekerja dengan maksimal, lalu lakukan testing dengan 1000 request dan 100 request/second. (7)

## Soal-8
> Karena diminta untuk menuliskan grimoire, buatlah analisis hasil testing dengan 200 request dan 10 request/second masing-masing algoritma Load Balancer dengan ketentuan sebagai berikut:
```
- Nama Algoritma Load Balancer
- Report hasil testing pada Apache Benchmark
- Grafik request per second untuk masing masing algoritma. 
- Analisis (8)
```

## Soal-9
> Dengan menggunakan algoritma Round Robin, lakukan testing dengan menggunakan 3 worker, 2 worker, dan 1 worker sebanyak 100 request dengan 10 request/second, kemudian tambahkan grafiknya pada grimoire. (9)

## Soal-10
> Selanjutnya coba tambahkan konfigurasi autentikasi di LB dengan dengan kombinasi username: “netics” dan password: “ajkyyy”, dengan yyy merupakan kode kelompok. Terakhir simpan file “htpasswd” nya di /etc/nginx/rahasisakita/ (10)

## Soal-11
> Lalu buat untuk setiap request yang mengandung /its akan di proxy passing menuju halaman https://www.its.ac.id. (11) hint: (proxy_pass)

## Soal-12
> Selanjutnya LB ini hanya boleh diakses oleh client dengan IP [Prefix IP].3.69, [Prefix IP].3.70, [Prefix IP].4.167, dan [Prefix IP].4.168. (12) hint: (fixed in dulu clientnya)

## Soal-13
> Semua data yang diperlukan, diatur pada Denken dan harus dapat diakses oleh Frieren, Flamme, dan Fern. (13)

## Soal-14
> Frieren, Flamme, dan Fern memiliki Riegel Channel sesuai dengan quest guide berikut. Jangan lupa melakukan instalasi PHP8.0 dan Composer (14)

## Soal-15
> Riegel Channel memiliki beberapa endpoint yang harus ditesting sebanyak 100 request dengan 10 request/second. Tambahkan response dan hasil testing pada grimoire. **POST /auth/register** (15)


## Soal-16
> Riegel Channel memiliki beberapa endpoint yang harus ditesting sebanyak 100 request dengan 10 request/second. Tambahkan response dan hasil testing pada grimoire. **POST /auth/login** (16)

## Soal-17
> Riegel Channel memiliki beberapa endpoint yang harus ditesting sebanyak 100 request dengan 10 request/second. Tambahkan response dan hasil testing pada grimoire. **GET /me** (17)

## Soal-18
> Untuk memastikan ketiganya bekerja sama secara adil untuk mengatur Riegel Channel maka implementasikan Proxy Bind pada Eisen untuk mengaitkan IP dari Frieren, Flamme, dan Fern. (18)

## Soal-19
> Untuk meningkatkan performa dari Worker, coba implementasikan PHP-FPM pada Frieren, Flamme, dan Fern. Untuk testing kinerja naikkan 
```- pm.max_children
- pm.start_servers
- pm.min_spare_servers
- pm.max_spare_servers
```
> sebanyak tiga percobaan dan lakukan testing sebanyak 100 request dengan 10 request/second kemudian berikan hasil analisisnya pada Grimoire.(19)

## Soal-20
> Nampaknya hanya menggunakan PHP-FPM tidak cukup untuk meningkatkan performa dari worker maka implementasikan Least-Conn pada Eisen. Untuk testing kinerja dari worker tersebut dilakukan sebanyak 100 request dengan 10 request/second. (20)