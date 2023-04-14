Microsoft Windows [Version 10.0.19045.2846]
(c) Microsoft Corporation. All rights reserved.

F:\xampp7\mysql\bin>mysql -u root -p
Enter password:
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 8
Server version: 10.4.18-MariaDB mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> USE dbtoko1;
Database changed
MariaDB [dbtoko1]> SELECT * FROM produk;
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  1 | TV01 | TV         |    3000000 |    4000000 |    3 |        2 |               1 |
|  2 | TV02 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 |
|  3 | K001 | Kulkas     |    4000000 |    5000000 |   10 |        3 |               1 |
|  4 | M001 | Meja Makan |    1000000 |    2000000 |    4 |        2 |               4 |
|  5 | T001 | Taro       |       4000 |       5000 |    3 |        2 |               2 |
|  6 | TK01 | Teh Kotak  |       3000 |       4000 |    2 |       10 |               3 |
+----+------+------------+------------+------------+------+----------+-----------------+
6 rows in set (0.053 sec)

-- SOAL 3.1

-- 1.	Tampilkan produk yang asset nya diatas 20jt
MariaDB [dbtoko1]> SELECT * FROM produk WHERE harga_beli * stok > 20000000;
+----+------+--------+------------+------------+------+----------+-----------------+
| id | kode | nama   | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+--------+------------+------------+------+----------+-----------------+
|  3 | K001 | Kulkas |    4000000 |    5000000 |   10 |        3 |               1 |
+----+------+--------+------------+------------+------+----------+-----------------+
1 row in set (0.010 sec)

-- 2.	Tampilkan data produk beserta selisih stok dengan minimal stok
MariaDB [dbtoko1]> SELECT SUM(stok - min_stok) AS selisih from produk;
+---------+
| selisih |
+---------+
|      10 |
+---------+
1 row in set (0.003 sec)

-- 3.	Tampilkan total asset produk secara keseluruhan
MariaDB [dbtoko1]> SELECT SUM(stok) AS total_asset FROM produk;
+-------------+
| total_asset |
+-------------+
|          32 |
+-------------+
1 row in set (0.000 sec)

-- 4.	Tampilkan data pelanggan yang lahirnya antara tahun 1999 sampai 2004
MariaDB [dbtoko1]> SELECT * FROM pelanggan WHERE YEAR(tgl_lahir) BETWEEN 1999 AND 2004;
+----+--------+----------------+------+-----------+------------+-------------------+----------+----------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir | tgl_lahir  | email             | alamat   | kartu_id |
+----+--------+----------------+------+-----------+------------+-------------------+----------+----------+
|  3 | 011103 | Sekar          | P    | Kediri    | 2001-09-08 | sekar@gmail.com   | Kediri   |        1 |
|  5 | 011105 | Pradana        | L    | Jakarta   | 2001-08-01 | pradana@gmail.com | Jakarta  |        2 |
|  6 | 011106 | Gayatri Putri  | P    | Jakarta   | 2002-09-01 | gayatri@gmail.com | Jakarta  |        1 |
|  9 | 011108 | SANDRA         | P    | Sukabumi  | 1999-06-04 | sandara@gmail.com | Sukabumi |        1 |
+----+--------+----------------+------+-----------+------------+-------------------+----------+----------+
4 rows in set (0.021 sec)

-- 5.	Tampilkan data pelanggan yang lahirnya tahun 1998
MariaDB [dbtoko1]> SELECT * FROM pelanggan WHERE YEAR(tgl_lahir) = 1998;
+----+--------+----------------+------+------------+------------+------------------+------------+----------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir  | tgl_lahir  | email            | alamat     | kartu_id |
+----+--------+----------------+------+------------+------------+------------------+------------+----------+
|  2 | 011102 | Pandan wangi   | P    | Yogyakarta | 1998-08-07 | pandan@gmail.com | Yogyakarta |        1 |
|  7 | 011107 | Sandi          | L    | Bandung    | 1998-08-12 | sandi@gmail.com  | Bandung    |        2 |
+----+--------+----------------+------+------------+------------+------------------+------------+----------+
2 rows in set (0.000 sec)

-- 6.	Tampilkan data pelanggan yang berulang tahun bulan agustus
MariaDB [dbtoko1]> SELECT * FROM pelanggan WHERE MONTH(tgl_lahir) = 08;
+----+--------+----------------+------+------------+------------+-------------------+------------+----------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir  | tgl_lahir  | email             | alamat     | kartu_id |
+----+--------+----------------+------+------------+------------+-------------------+------------+----------+
|  2 | 011102 | Pandan wangi   | P    | Yogyakarta | 1998-08-07 | pandan@gmail.com  | Yogyakarta |        1 |
|  5 | 011105 | Pradana        | L    | Jakarta    | 2001-08-01 | pradana@gmail.com | Jakarta    |        2 |
|  7 | 011107 | Sandi          | L    | Bandung    | 1998-08-12 | sandi@gmail.com   | Bandung    |        2 |
+----+--------+----------------+------+------------+------------+-------------------+------------+----------+
3 rows in set (0.009 sec)

-- 7.	Tampilkan data pelanggan : nama, tmp_lahir, tgl_lahir dan umur (selisih tahun sekarang dikurang tahun kelahiran)
MariaDB [dbtoko1]> SELECT nama_pelanggan, tmp_lahir, tgl_lahir, (YEAR(NOW())-YEAR(tgl_lahir)) AS umur FROM pelanggan;
+----------------+------------+------------+------+
| nama_pelanggan | tmp_lahir  | tgl_lahir  | umur |
+----------------+------------+------------+------+
| Agung          | Bandung    | 1997-09-06 |   26 |
| Pandan wangi   | Yogyakarta | 1998-08-07 |   25 |
| Sekar          | Kediri     | 2001-09-08 |   22 |
| Suandi         | Jakarta    | 1997-09-08 |   26 |
| Pradana        | Jakarta    | 2001-08-01 |   22 |
| Gayatri Putri  | Jakarta    | 2002-09-01 |   21 |
| Sandi          | Bandung    | 1998-08-12 |   25 |
| SANDRA         | Sukabumi   | 1999-06-04 |   24 |
+----------------+------------+------------+------+
8 rows in set (0.001 sec)

-- SOAL 3.2
-- 1.	Berapa jumlah pelanggan yang tahun lahirnya 1998
MariaDB [dbtoko1]> SELECT COUNT(*) AS jumlah_pelanggan FROM pelanggan WHERE YEAR(tgl_lahir) = 1998;
+------------------+
| jumlah_pelanggan |
+------------------+
|                2 |
+------------------+
1 row in set (0.000 sec)

-- 2.	Berapa jumlah pelanggan perempuan yang tempat lahirnya di Jakarta
MariaDB [dbtoko1]> SELECT COUNT(*) AS jumlah_pelanggan FROM pelanggan WHERE jk = 'P' AND tmp_lahir = 'Jakarta';
+------------------+
| jumlah_pelanggan |
+------------------+
|                1 |
+------------------+
1 row in set (0.000 sec)

-- 3.	Berapa jumlah total stok semua produk yang harga jualnya dibawah 10rb
MariaDB [dbtoko1]> SELECT SUM(stok) AS total_stok FROM produk WHERE harga_jual < 10000;
+------------+
| total_stok |
+------------+
|          5 |
+------------+
1 row in set (0.000 sec)

-- 4.	Ada berapa produk yang mempunyai kode awal K
MariaDB [dbtoko1]> SELECT COUNT(*) AS jumlah_produk FROM produk WHERE kode LIKE 'K%';
+---------------+
| jumlah_produk |
+---------------+
|             1 |
+---------------+
1 row in set (0.010 sec)

-- 5.	Berapa harga jual rata-rata produk yang diatas 1jt
MariaDB [dbtoko1]> SELECT AVG(harga_jual) AS rata2_harga_jual FROM produk WHERE harga_jual > 1000000;
+------------------+
| rata2_harga_jual |
+------------------+
|          3500000 |
+------------------+
1 row in set (0.000 sec)

-- 6.	Tampilkan jumlah stok yang paling besar
MariaDB [dbtoko1]> SELECT MAX(stok) AS max_stok FROM produk;
+----------+
| max_stok |
+----------+
|       10 |
+----------+
1 row in set (0.001 sec)


MariaDB [dbtoko1]> SELECT * FROM PRODUK;
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  1 | TV01 | TV         |    3000000 |    4000000 |    3 |        2 |               1 |
|  2 | TV02 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 |
|  3 | K001 | Kulkas     |    4000000 |    5000000 |   10 |        3 |               1 |
|  4 | M001 | Meja Makan |    1000000 |    2000000 |    4 |        2 |               4 |
|  5 | T001 | Taro       |       4000 |       5000 |    3 |        2 |               2 |
|  6 | TK01 | Teh Kotak  |       3000 |       4000 |    2 |       10 |               3 |
+----+------+------------+------------+------------+------+----------+-----------------+
6 rows in set (0.000 sec)

-- 7.	Ada berapa produk yang stoknya kurang dari minimal stok
MariaDB [dbtoko1]> SELECT COUNT(*) AS jumlah_produk FROM produk WHERE stok < min_stok;
+---------------+
| jumlah_produk |
+---------------+
|             1 |
+---------------+
1 row in set (0.000 sec)

-- 8.	Berapa total asset dari keseluruhan produk
MariaDB [dbtoko1]> SELECT SUM(stok * harga_beli) AS total_asset FROM produk;
+-------------+
| total_asset |
+-------------+
|    73018000 |
+-------------+
1 row in set (0.000 sec)

-- SOAL 3.3
-- 1.	Tampilkan data produk : id, nama, stok dan informasi jika stok telah sampai batas minimal atau kurang dari minimum stok dengan informasi ‘segera belanja’ jika tidak ‘stok aman’.
MariaDB [dbtoko1]> SELECT id, nama, stok,
    -> CASE
    -> WHEN stok < min_stok THEN 'segera belanja'
    -> ELSE 'stok aman'
    -> END AS info_stok
    -> FROM produk;
+----+------------+------+----------------+
| id | nama       | stok | info_stok      |
+----+------------+------+----------------+
|  1 | TV         |    3 | stok aman      |
|  2 | TV 21 Inch |   10 | stok aman      |
|  3 | Kulkas     |   10 | stok aman      |
|  4 | Meja Makan |    4 | stok aman      |
|  5 | Taro       |    3 | stok aman      |
|  6 | Teh Kotak  |    2 | segera belanja |
+----+------------+------+----------------+
6 rows in set (0.001 sec)

-- 2.	Tampilkan data pelanggan: id, nama, umur dan kategori umur : jika umur < 17 → ‘muda’ , 17-55 → ‘Dewasa’, selainnya ‘Tua’
MariaDB [dbtoko1]> SELECT id, nama_pelanggan, YEAR(NOW()) - YEAR(tgl_lahir) AS umur,
    -> CASE
    -> WHEN YEAR(NOW()) - YEAR(tgl_lahir) < 17 THEN 'muda'
    -> WHEN YEAR(NOW()) - YEAR(tgl_lahir) BETWEEN 17 AND 55 THEN 'Dewasa'
    -> ELSE 'Tua'
    -> END AS kategori_umur
    -> FROM pelanggan;
+----+----------------+------+---------------+
| id | nama_pelanggan | umur | kategori_umur |
+----+----------------+------+---------------+
|  1 | Agung          |   26 | Dewasa        |
|  2 | Pandan wangi   |   25 | Dewasa        |
|  3 | Sekar          |   22 | Dewasa        |
|  4 | Suandi         |   26 | Dewasa        |
|  5 | Pradana        |   22 | Dewasa        |
|  6 | Gayatri Putri  |   21 | Dewasa        |
|  7 | Sandi          |   25 | Dewasa        |
|  9 | SANDRA         |   24 | Dewasa        |
+----+----------------+------+---------------+
8 rows in set (0.000 sec)

-- 3.	Tampilkan data produk: id, kode, nama, dan bonus untuk kode ‘TV01’ →’DVD Player’ , ‘K001’ → ‘Rice Cooker’ selain dari diatas ‘Tidak Ada’
MariaDB [dbtoko1]> SELECT id, kode, nama,
    -> CASE
    -> WHEN kode = 'TV01' THEN 'DVD Player'
    -> WHEN kode = 'K001' THEN 'Rice Cooker'
    -> ELSE 'Tidak Ada'
    -> END AS bonus
    -> FROM produk;
+----+------+------------+-------------+
| id | kode | nama       | bonus       |
+----+------+------------+-------------+
|  1 | TV01 | TV         | DVD Player  |
|  2 | TV02 | TV 21 Inch | Tidak Ada   |
|  3 | K001 | Kulkas     | Rice Cooker |
|  4 | M001 | Meja Makan | Tidak Ada   |
|  5 | T001 | Taro       | Tidak Ada   |
|  6 | TK01 | Teh Kotak  | Tidak Ada   |
+----+------+------------+-------------+
6 rows in set (0.001 sec)

-- SOAL 3.4
-- 1.	Tampilkan data statistik jumlah tempat lahir pelanggan
MariaDB [dbtoko1]> SELECT tmp_lahir, COUNT(*) AS jumlah_pelanggan FROM pelanggan GROUP BY tmp_lahir;
+------------+------------------+
| tmp_lahir  | jumlah_pelanggan |
+------------+------------------+
| Bandung    |                2 |
| Jakarta    |                3 |
| Kediri     |                1 |
| Sukabumi   |                1 |
| Yogyakarta |                1 |
+------------+------------------+
5 rows in set (0.009 sec)

-- 2.	Tampilkan jumlah statistik produk berdasarkan jenis produk
MariaDB [dbtoko1]> SELECT jenis_produk_id, COUNT(*) AS jumlah_produk FROM produk GROUP BY jenis_produk_id;
+-----------------+---------------+
| jenis_produk_id | jumlah_produk |
+-----------------+---------------+
|               1 |             3 |
|               2 |             1 |
|               3 |             1 |
|               4 |             1 |
+-----------------+---------------+
4 rows in set (0.000 sec)


MariaDB [dbtoko1]> SELECT * FROM pelanggan;
+----+--------+----------------+------+------------+------------+-------------------+------------+----------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir  | tgl_lahir  | email             | alamat     | kartu_id |
+----+--------+----------------+------+------------+------------+-------------------+------------+----------+
|  1 | 011101 | Agung          | L    | Bandung    | 1997-09-06 | agung@gmail.com   | Bandung    |        1 |
|  2 | 011102 | Pandan wangi   | P    | Yogyakarta | 1998-08-07 | pandan@gmail.com  | Yogyakarta |        1 |
|  3 | 011103 | Sekar          | P    | Kediri     | 2001-09-08 | sekar@gmail.com   | Kediri     |        1 |
|  4 | 011104 | Suandi         | L    | Jakarta    | 1997-09-08 | suandi@gmail.com  | Kediri     |        1 |
|  5 | 011105 | Pradana        | L    | Jakarta    | 2001-08-01 | pradana@gmail.com | Jakarta    |        2 |
|  6 | 011106 | Gayatri Putri  | P    | Jakarta    | 2002-09-01 | gayatri@gmail.com | Jakarta    |        1 |
|  7 | 011107 | Sandi          | L    | Bandung    | 1998-08-12 | sandi@gmail.com   | Bandung    |        2 |
|  9 | 011108 | SANDRA         | P    | Sukabumi   | 1999-06-04 | sandara@gmail.com | Sukabumi   |        1 |
+----+--------+----------------+------+------------+------------+-------------------+------------+----------+
8 rows in set (0.000 sec)

-- 3.	Tampilkan data pelanggan yang usianya dibawah rata usia pelanggan
MariaDB [dbtoko1]> SELECT nama_pelanggan, TIMESTAMPDIFF(YEAR, tgl_lahir, CURDATE()) AS usia FROM pelanggan
    -> HAVING usia< (SELECT AVG(TIMESTAMPDIFF(YEAR, tgl_lahir, CURDATE())) FROM pelanggan);
+----------------+------+
| nama_pelanggan | usia |
+----------------+------+
| Sekar          |   21 |
| Pradana        |   21 |
| Gayatri Putri  |   20 |
+----------------+------+
3 rows in set (0.001 sec)

-- 4.	Tampilkan data produk yang harganya diatas rata-rata harga produk
MariaDB [dbtoko1]> SELECT harga_beli, harga_jual FROM produk WHERE harga_jual > (SELECT AVG(harga_jual) FROM produk);
+------------+------------+
| harga_beli | harga_jual |
+------------+------------+
|    3000000 |    4000000 |
|    2000000 |    3000000 |
|    4000000 |    5000000 |
+------------+------------+
3 rows in set (0.015 sec)

-- 5.	Tampilkan data pelanggan yang memiliki kartu dimana iuran tahunan kartu diatas 90rb
MariaDB [dbtoko1]> SELECT pelanggan.id, pelanggan.nama_pelanggan, kartu.kode, kartu.iuran FROM pelanggan
    -> JOIN kartu ON pelanggan.kartu_id = kartu.id WHERE kartu.iuran  > 900;
+----+----------------+-------+-------+
| id | nama_pelanggan | kode  | iuran |
+----+----------------+-------+-------+
|  1 | Agung          | 10111 |  2000 |
|  2 | Pandan wangi   | 10111 |  2000 |
|  3 | Sekar          | 10111 |  2000 |
|  4 | Suandi         | 10111 |  2000 |
|  5 | Pradana        | 10112 |  1500 |
|  6 | Gayatri Putri  | 10111 |  2000 |
|  7 | Sandi          | 10112 |  1500 |
|  9 | SANDRA         | 10111 |  2000 |
+----+----------------+-------+-------+
8 rows in set (0.000 sec)

-- 6.	Tampilkan statistik data produk dimana harga produknya dibawah rata-rata harga produk secara keseluruhan
MariaDB [dbtoko1]> SELECT COUNT(*) AS total_produk,
    -> MIN(harga_beli) AS harga_min,
    -> MAX(harga_jual) AS harga_max,
    -> AVG(harga_jual) AS rata2_harga
    -> FROM produk
    -> WHERE harga_jual < (SELECT AVG(harga_jual) FROM produk);
+--------------+-----------+-----------+-------------------+
| total_produk | harga_min | harga_max | rata2_harga       |
+--------------+-----------+-----------+-------------------+
|            3 |      3000 |   2000000 | 669666.6666666666 |
+--------------+-----------+-----------+-------------------+
1 row in set (0.009 sec)

-- 7.	Tampilkan data pelanggan yang memiliki kartu dimana diskon kartu yang diberikan diatas 3%
MariaDB [dbtoko1]> SELECT pelanggan.id, pelanggan.nama_pelanggan, kartu.kode, kartu.diskon FROM pelanggan JOIN kartu ON pelanggan.kartu_id = kartu_id WHERE kartu.diskon > 0.03;
+----+----------------+-------+--------+
| id | nama_pelanggan | kode  | diskon |
+----+----------------+-------+--------+
|  1 | Agung          | 10111 |  20000 |
|  1 | Agung          | 10112 |  15000 |
|  1 | Agung          | 10113 |  10000 |
|  2 | Pandan wangi   | 10111 |  20000 |
|  2 | Pandan wangi   | 10112 |  15000 |
|  2 | Pandan wangi   | 10113 |  10000 |
|  3 | Sekar          | 10111 |  20000 |
|  3 | Sekar          | 10112 |  15000 |
|  3 | Sekar          | 10113 |  10000 |
|  4 | Suandi         | 10111 |  20000 |
|  4 | Suandi         | 10112 |  15000 |
|  4 | Suandi         | 10113 |  10000 |
|  5 | Pradana        | 10111 |  20000 |
|  5 | Pradana        | 10112 |  15000 |
|  5 | Pradana        | 10113 |  10000 |
|  6 | Gayatri Putri  | 10111 |  20000 |
|  6 | Gayatri Putri  | 10112 |  15000 |
|  6 | Gayatri Putri  | 10113 |  10000 |
|  7 | Sandi          | 10111 |  20000 |
|  7 | Sandi          | 10112 |  15000 |
|  7 | Sandi          | 10113 |  10000 |
|  9 | SANDRA         | 10111 |  20000 |
|  9 | SANDRA         | 10112 |  15000 |
|  9 | SANDRA         | 10113 |  10000 |
+----+----------------+-------+--------+
24 rows in set (0.001 sec)

MariaDB [dbtoko1]>