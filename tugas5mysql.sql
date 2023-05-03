Microsoft Windows [Version 10.0.19045.2846]
(c) Microsoft Corporation. All rights reserved.

F:\xampp7\mysql\bin>mysql -u root -p
Enter password:
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 11
Server version: 10.4.18-MariaDB mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> use dbtoko1;
Database changed

-- Tugas 7
MariaDB [dbtoko1]> select * from pelanggan;
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
-- 1.Buat fungsi inputPelanggan(), setelah itu panggil fungsinya
MariaDB [dbtoko1]> DELIMITER $$
MariaDB [dbtoko1]> CREATE PROCEDURE inputPelanggann(kode VARCHAR(11),nama_pelanggan VARCHAR(100),jk VARCHAR(1),tmp_lahir VARCHAR(100),tgl_lahir DATE,email VARCHAR(100),alamat TEXT,kartu_id INT(11))
    -> BEGIN
    -> INSERT INTO pelanggan(kode,nama_pelanggan,jk,tmp_lahir,tgl_lahir,email,alamat,kartu_id) VALUES (kode,nama_pelanggan,jk,tmp_lahir,tgl_lahir,email,alamat,kartu_id);
    -> END $$
Query OK, 0 rows affected (0.015 sec)

MariaDB [dbtoko1]> CALL inputPelanggann('011109','Tuti','P','Cirebon','1999-07-08','tuti@gmail.com','Cirebon',1);
Query OK, 1 row affected (0.012 sec)

-- 2.Buat fungsi showPelanggan(), setelah itu panggil fungsinya
MariaDB [dbtoko1]> DELIMITER $$
MariaDB [dbtoko1]> create procedure showPelanggan()
    -> BEGIN
    -> SELECT kode,nama_pelanggan,jk,tmp_lahir,email,alamat,kartu_id from pelanggan;
    -> END $$
Query OK, 0 rows affected (0.015 sec)

MariaDB [dbtoko1]> DELIMITER ;
MariaDB [dbtoko1]> CALL showPelanggan();
+--------+----------------+------+------------+-------------------+------------+----------+
| kode   | nama_pelanggan | jk   | tmp_lahir  | email             | alamat     | kartu_id |
+--------+----------------+------+------------+-------------------+------------+----------+
| 011101 | Agung          | L    | Bandung    | agung@gmail.com   | Bandung    |        1 |
| 011102 | Pandan wangi   | P    | Yogyakarta | pandan@gmail.com  | Yogyakarta |        1 |
| 011103 | Sekar          | P    | Kediri     | sekar@gmail.com   | Kediri     |        1 |
| 011104 | Suandi         | L    | Jakarta    | suandi@gmail.com  | Kediri     |        1 |
| 011105 | Pradana        | L    | Jakarta    | pradana@gmail.com | Jakarta    |        2 |
| 011106 | Gayatri Putri  | P    | Jakarta    | gayatri@gmail.com | Jakarta    |        1 |
| 011107 | Sandi          | L    | Bandung    | sandi@gmail.com   | Bandung    |        2 |
| 011108 | SANDRA         | P    | Sukabumi   | sandara@gmail.com | Sukabumi   |        1 |
| 011109 | Tuti           | P    | Cirebon    | tuti@gmail.com    | Cirebon    |        1 |
+--------+----------------+------+------------+-------------------+------------+----------+
9 rows in set (0.009 sec)

Query OK, 0 rows affected (0.055 sec)

MariaDB [dbtoko1]> select * from produk;
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  1 | TV01 | TV         |    3000000 |    4000000 |    3 |        2 |               1 |
|  2 | TV02 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 |
|  3 | K001 | Kulkas     |    4000000 |    5000000 |   10 |        3 |               1 |
|  4 | M001 | Meja Makan |    1000000 |    2000000 |    4 |        2 |               4 |
|  5 | T001 | Taro       |       4000 |       5000 |    3 |        2 |               2 |
+----+------+------------+------------+------------+------+----------+-----------------+
5 rows in set (0.020 sec)

-- 3.Buat fungsi inputProduk(), setelah itu panggil fungsinya
MariaDB [dbtoko1]> DELIMITER $$
MariaDB [dbtoko1]> CREATE PROCEDURE inputProdukk(kode VARCHAR(11), nama VARCHAR(100),harga_beli DOUBLE,harga_jual DOUBLE,stok INT(11),min_stok INT(11),jenis_produk_id INT(11))
    -> BEGIN
    -> INSERT INTO produk (kode,nama,harga_beli,harga_jual,stok,min_stok,jenis_produk_id) VALUES (kode,nama,harga_beli,harga_jual,stok,min_stok,jenis_produk_id);
    -> END $$
Query OK, 0 rows affected (0.014 sec)

MariaDB [dbtoko1]> delimiter ;
MariaDB [dbtoko1]> CALL inputProdukk('L01','Lemari',1000000,1500000,5,2,3);
Query OK, 1 row affected (0.011 sec)

-- 4.Buat fungsi showProduk(), setelah itu panggil fungsinya
MariaDB [dbtoko1]> DELIMITER ;
MariaDB [dbtoko1]> CALL showProduk();
+------------+------------+------------+
| nama       | harga_beli | harga_jual |
+------------+------------+------------+
| TV         |    3000000 |    4000000 |
| TV 21 Inch |    2000000 |    3000000 |
| Kulkas     |    4000000 |    5000000 |
| Meja Makan |    1000000 |    2000000 |
| Taro       |       4000 |       5000 |
| Lemari     |    1000000 |    1500000 |
+------------+------------+------------+
6 rows in set (0.001 sec)

Query OK, 0 rows affected (0.012 sec)

-- 5.Buat fungsi totalPesanan(), setelah itu panggil fungsinya
MariaDB [dbtoko1]> DELIMITER $$
MariaDB [dbtoko1]> CREATE PROCEDURE totalPesanan()
    -> BEGIN
    -> DECLARE total_pesanan DECIMAL(10,2);
    -> SELECT SUM(total) INTO total_pesanan FROM pesanan;
    -> SELECT total_pesanan;
    -> END $$
Query OK, 0 rows affected (0.017 sec)

MariaDB [dbtoko1]> CALL totalPesanan();
    -> END $$
+---------------+
| total_pesanan |
+---------------+
|     430000.00 |
+---------------+
1 row in set (0.010 sec)

Query OK, 1 row affected (0.013 sec)

-- 6.tampilkan seluruh pesanan dari semua pelanggan
MariaDB [dbtoko1]> DELIMITER $$
MariaDB [dbtoko1]> CREATE PROCEDURE showseluruhPesanan()
    -> BEGIN
    -> SELECT pesanan.id, pesanan.tanggal, pesanan.total, pelanggan.nama_pelanggan
    -> FROM pesanan
    -> JOIN pelanggan ON pesanan.pelanggan_id = pelanggan.id;
    -> END $$
Query OK, 0 rows affected (0.014 sec)

MariaDB [dbtoko1]> delimiter ;
MariaDB [dbtoko1]> CALL showseluruhPesanan();
+----+------------+--------+----------------+
| id | tanggal    | total  | nama_pelanggan |
+----+------------+--------+----------------+
|  1 | 2023-03-04 | 200000 | Agung          |
|  2 | 0000-00-00 | 200000 | Agung          |
|  3 | 2022-02-02 |  30000 | Agung          |
+----+------------+--------+----------------+
3 rows in set (0.001 sec)

Query OK, 0 rows affected (0.011 sec)
----------------------------------------------------------------------------------------------------------------------------------------------------------------
MariaDB [dbtoko1]> select * from pesanan;
+----+------------+--------+--------------+
| id | tanggal    | total  | pelanggan_id |
+----+------------+--------+--------------+
|  1 | 2023-03-04 | 200000 |            1 |
|  2 | 0000-00-00 | 200000 |            1 |
|  3 | 2022-02-02 |  30000 |            1 |
+----+------------+--------+--------------+
3 rows in set (0.001 sec)

MariaDB [dbtoko1]> select * from pelanggan;
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
| 10 | 011109 | Tuti           | P    | Cirebon    | 1999-07-08 | tuti@gmail.com    | Cirebon    |        1 |
+----+--------+----------------+------+------------+------------+-------------------+------------+----------+
9 rows in set (0.000 sec)

MariaDB [dbtoko1]> select * from produk
    -> ;
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  1 | TV01 | TV         |    3000000 |    4000000 |    3 |        2 |               1 |
|  2 | TV02 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 |
|  3 | K001 | Kulkas     |    4000000 |    5000000 |   10 |        3 |               1 |
|  4 | M001 | Meja Makan |    1000000 |    2000000 |    4 |        2 |               4 |
|  5 | T001 | Taro       |       4000 |       5000 |    3 |        2 |               2 |
|  7 | L01  | Lemari     |    1000000 |    1500000 |    5 |        2 |               3 |
+----+------+------------+------------+------------+------+----------+-----------------+
6 rows in set (0.000 sec)

-- 7.buatkan query panjang di atas menjadi sebuah view baru: pesanan_produk_vw (menggunakan join dari table pesanan,pelanggan dan produk)
MariaDB [dbtoko1]> CREATE VIEW pesanan_produk_vw AS
    -> SELECT pesanan.id AS pesanan_id, pesanan.tanggal, pesanan.total, pelanggan.kode AS pelanggan_kode, pelanggan.nama_pelanggan, pelanggan.jk, pelanggan.tmp_lahir, pelanggan.tgl_lahir, pelanggan.email, pelanggan.kartu_id, produk.kode AS produk_kode, produk.nama AS produk_nama, produk.harga_jual, pesanan_items.qty, pesanan_items.harga
    -> FROM pesanan
    -> JOIN pelanggan ON pesanan.pelanggan_id = pelanggan.id
    -> JOIN pesanan_items pesanan_items ON pesanan.id = pesanan_items.pesanan_id
    -> JOIN produk ON pesanan_items.produk_id = produk.id;
Query OK, 0 rows affected (0.024 sec)

MariaDB [dbtoko1]> SELECT * FROM pesanan_produk_vw;
Empty set (0.001 sec)

MariaDB [dbtoko1]>