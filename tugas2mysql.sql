Microsoft Windows [Version 10.0.19045.2728]
(c) Microsoft Corporation. All rights reserved.

F:\xampp7\mysql\bin>
F:\xampp7\mysql\bin>mysql -u root -p
Enter password:
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 8
Server version: 10.4.18-MariaDB mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> use dbtoko1;
Database changed
MariaDB [dbtoko1]> select * from produk;
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
6 rows in set (0.086 sec)
-- Soal 2.1
-- 2.	Tampilkan seluruh data produk diurutkan berdasarkan harga_jual mulai dari yang termahal
MariaDB [dbtoko1]> SELECT * FROM produk order by harga_jual desc;
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  3 | K001 | Kulkas     |    4000000 |    5000000 |   10 |        3 |               1 |
|  1 | TV01 | TV         |    3000000 |    4000000 |    3 |        2 |               1 |
|  2 | TV02 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 |
|  4 | M001 | Meja Makan |    1000000 |    2000000 |    4 |        2 |               4 |
|  5 | T001 | Taro       |       4000 |       5000 |    3 |        2 |               2 |
|  6 | TK01 | Teh Kotak  |       3000 |       4000 |    2 |       10 |               3 |
+----+------+------------+------------+------------+------+----------+-----------------+
6 rows in set (0.009 sec)

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
+----+--------+----------------+------+------------+------------+-------------------+------------+----------+
6 rows in set (0.023 sec)

-- 3. Tampilkan data kode, nama, tmp_lahir, tgl_lahir dari table pelanggan
MariaDB [dbtoko1]> SELECT kode,nama_pelanggan,tmp_lahir,tgl_lahir FROM pelanggan;
+--------+----------------+------------+------------+
| kode   | nama_pelanggan | tmp_lahir  | tgl_lahir  |
+--------+----------------+------------+------------+
| 011101 | Agung          | Bandung    | 1997-09-06 |
| 011102 | Pandan wangi   | Yogyakarta | 1998-08-07 |
| 011103 | Sekar          | Kediri     | 2001-09-08 |
| 011104 | Suandi         | Jakarta    | 1997-09-08 |
| 011105 | Pradana        | Jakarta    | 2001-08-01 |
| 011106 | Gayatri Putri  | Jakarta    | 2002-09-01 |
+--------+----------------+------------+------------+
6 rows in set (0.000 sec)

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
6 rows in set (0.000 sec)

-- 4. Tampilkan kode,nama,stok dari table produk yang stok-nya hanya 4
MariaDB [dbtoko1]> SELECT kode,nama,stok FROM produk WHERE stok=4;
+------+------------+------+
| kode | nama       | stok |
+------+------------+------+
| M001 | Meja Makan |    4 |
+------+------------+------+
1 row in set (0.012 sec)

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
+----+--------+----------------+------+------------+------------+-------------------+------------+----------+
6 rows in set (0.000 sec)

-- 5. Tampilkan seluruh data pelanggan yang tempat lahirnya Jakarta
MariaDB [dbtoko1]> SELECT * FROM pelanggan WHERE tmp_lahir = 'Jakarta';
+----+--------+----------------+------+-----------+------------+-------------------+---------+----------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir | tgl_lahir  | email             | alamat  | kartu_id |
+----+--------+----------------+------+-----------+------------+-------------------+---------+----------+
|  4 | 011104 | Suandi         | L    | Jakarta   | 1997-09-08 | suandi@gmail.com  | Kediri  |        1 |
|  5 | 011105 | Pradana        | L    | Jakarta   | 2001-08-01 | pradana@gmail.com | Jakarta |        2 |
|  6 | 011106 | Gayatri Putri  | P    | Jakarta   | 2002-09-01 | gayatri@gmail.com | Jakarta |        1 |
+----+--------+----------------+------+-----------+------------+-------------------+---------+----------+
3 rows in set (0.009 sec)

-- 6. Tampilkan kode, nama, tmp_lahir, tgl_lahir dari pelanggan diurutkan dari yang paling muda usianya
MariaDB [dbtoko1]> SELECT kode,nama_pelanggan,tmp_lahir,tgl_lahir FROM pelanggan ORDER by tgl_lahir desc;
+--------+----------------+------------+------------+
| kode   | nama_pelanggan | tmp_lahir  | tgl_lahir  |
+--------+----------------+------------+------------+
| 011106 | Gayatri Putri  | Jakarta    | 2002-09-01 |
| 011103 | Sekar          | Kediri     | 2001-09-08 |
| 011105 | Pradana        | Jakarta    | 2001-08-01 |
| 011102 | Pandan wangi   | Yogyakarta | 1998-08-07 |
| 011104 | Suandi         | Jakarta    | 1997-09-08 |
| 011101 | Agung          | Bandung    | 1997-09-06 |
+--------+----------------+------------+------------+
6 rows in set (0.001 sec)

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
6 rows in set (0.000 sec)
-- Soal 2.2
-- 1. Tampilkan data produk yang stoknya 3 dan 10
MariaDB [dbtoko1]> SELECT * FROM produk WHERE stok = 3 OR stok=10;
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  1 | TV01 | TV         |    3000000 |    4000000 |    3 |        2 |               1 |
|  2 | TV02 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 |
|  3 | K001 | Kulkas     |    4000000 |    5000000 |   10 |        3 |               1 |
|  5 | T001 | Taro       |       4000 |       5000 |    3 |        2 |               2 |
+----+------+------------+------------+------------+------+----------+-----------------+
4 rows in set (0.000 sec)

-- 2. Tampilkan data produk yang harga jualnya kurang dari 5 juta tetapi lebih dari 500 ribu
MariaDB [dbtoko1]> SELECT * FROM produk WHERE harga_jual < 5000000 and harga_jual > 500000;
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  1 | TV01 | TV         |    3000000 |    4000000 |    3 |        2 |               1 |
|  2 | TV02 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 |
|  4 | M001 | Meja Makan |    1000000 |    2000000 |    4 |        2 |               4 |
+----+------+------------+------------+------------+------+----------+-----------------+
3 rows in set (0.009 sec)

-- 3. Tampilkan data produk yang harus segera ditambah stoknya
MariaDB [dbtoko1]> SELECT * FROM produk WHERE min_stok > stok;
+----+------+-----------+------------+------------+------+----------+-----------------+
| id | kode | nama      | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+-----------+------------+------------+------+----------+-----------------+
|  6 | TK01 | Teh Kotak |       3000 |       4000 |    2 |       10 |               3 |
+----+------+-----------+------------+------------+------+----------+-----------------+
1 row in set (0.001 sec)

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
+----+--------+----------------+------+------------+------------+-------------------+------------+----------+
6 rows in set (0.000 sec)

-- 4. Tampilkan data pelanggan mulai dari yang paling muda
MariaDB [dbtoko1]> SELECT * FROM pelanggan ORDER BY tgl_lahir desc;
+----+--------+----------------+------+------------+------------+-------------------+------------+----------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir  | tgl_lahir  | email             | alamat     | kartu_id |
+----+--------+----------------+------+------------+------------+-------------------+------------+----------+
|  6 | 011106 | Gayatri Putri  | P    | Jakarta    | 2002-09-01 | gayatri@gmail.com | Jakarta    |        1 |
|  3 | 011103 | Sekar          | P    | Kediri     | 2001-09-08 | sekar@gmail.com   | Kediri     |        1 |
|  5 | 011105 | Pradana        | L    | Jakarta    | 2001-08-01 | pradana@gmail.com | Jakarta    |        2 |
|  2 | 011102 | Pandan wangi   | P    | Yogyakarta | 1998-08-07 | pandan@gmail.com  | Yogyakarta |        1 |
|  4 | 011104 | Suandi         | L    | Jakarta    | 1997-09-08 | suandi@gmail.com  | Kediri     |        1 |
|  1 | 011101 | Agung          | L    | Bandung    | 1997-09-06 | agung@gmail.com   | Bandung    |        1 |
+----+--------+----------------+------+------------+------------+-------------------+------------+----------+
6 rows in set (0.001 sec)

-- 5. Tampilkan data pelanggan yang lahirnya di Jakarta dan gendernya perempuan
MariaDB [dbtoko1]> SELECT * FROM pelanggan WHERE tmp_lahir = 'Jakarta' and jk='P';
+----+--------+----------------+------+-----------+------------+-------------------+---------+----------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir | tgl_lahir  | email             | alamat  | kartu_id |
+----+--------+----------------+------+-----------+------------+-------------------+---------+----------+
|  6 | 011106 | Gayatri Putri  | P    | Jakarta   | 2002-09-01 | gayatri@gmail.com | Jakarta |        1 |
+----+--------+----------------+------+-----------+------------+-------------------+---------+----------+
1 row in set (0.001 sec)

-- 6. Tampilkan data pelanggan yang ID nya 2, 4 dan 6
MariaDB [dbtoko1]> SELECT * FROM pelanggan WHERE id in (2,4,6);
+----+--------+----------------+------+------------+------------+-------------------+------------+----------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir  | tgl_lahir  | email             | alamat     | kartu_id |
+----+--------+----------------+------+------------+------------+-------------------+------------+----------+
|  2 | 011102 | Pandan wangi   | P    | Yogyakarta | 1998-08-07 | pandan@gmail.com  | Yogyakarta |        1 |
|  4 | 011104 | Suandi         | L    | Jakarta    | 1997-09-08 | suandi@gmail.com  | Kediri     |        1 |
|  6 | 011106 | Gayatri Putri  | P    | Jakarta    | 2002-09-01 | gayatri@gmail.com | Jakarta    |        1 |
+----+--------+----------------+------+------------+------------+-------------------+------------+----------+
3 rows in set (0.010 sec)

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
6 rows in set (0.000 sec)

-- 7. Tampilkan data produk yang harganya antara 500 ribu sampai 6 juta
MariaDB [dbtoko1]> SELECT * FROM produk WHERE harga_jual >= 500000 and harga_jual <= 6000000;
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  1 | TV01 | TV         |    3000000 |    4000000 |    3 |        2 |               1 |
|  2 | TV02 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 |
|  3 | K001 | Kulkas     |    4000000 |    5000000 |   10 |        3 |               1 |
|  4 | M001 | Meja Makan |    1000000 |    2000000 |    4 |        2 |               4 |
+----+------+------------+------------+------------+------+----------+-----------------+
4 rows in set (0.000 sec)

-- Soal 2.3
-- 1. Tampilkan produk yang kode awalnya huruf K dan huruf M
MariaDB [dbtoko1]> SELECT * FROM produk WHERE kode like 'K%' or kode like 'M%';
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  3 | K001 | Kulkas     |    4000000 |    5000000 |   10 |        3 |               1 |
|  4 | M001 | Meja Makan |    1000000 |    2000000 |    4 |        2 |               4 |
+----+------+------------+------------+------------+------+----------+-----------------+
2 rows in set (0.011 sec)

-- 2. Tampilkan produk yang kode awalnya bukan huruf M
MariaDB [dbtoko1]> SELECT * FROM produk WHERE kode not LIKE 'M%';
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  1 | TV01 | TV         |    3000000 |    4000000 |    3 |        2 |               1 |
|  2 | TV02 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 |
|  3 | K001 | Kulkas     |    4000000 |    5000000 |   10 |        3 |               1 |
|  5 | T001 | Taro       |       4000 |       5000 |    3 |        2 |               2 |
|  6 | TK01 | Teh Kotak  |       3000 |       4000 |    2 |       10 |               3 |
+----+------+------------+------------+------------+------+----------+-----------------+
5 rows in set (0.000 sec)

-- 3. Tampilkan produk-produk televisi
MariaDB [dbtoko1]> SELECT * FROM produk WHERE kode LIKE 'TV%';
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  1 | TV01 | TV         |    3000000 |    4000000 |    3 |        2 |               1 |
|  2 | TV02 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 |
+----+------+------------+------------+------------+------+----------+-----------------+
2 rows in set (0.009 sec)

MariaDB [dbtoko1]> SELECT * FROM pelanggan WHERE nama_pelanggan LIKE '%SA';
Empty set (0.000 sec)

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
+----+--------+----------------+------+------------+------------+-------------------+------------+----------+
7 rows in set (0.022 sec)

MariaDB [dbtoko1]> INSERT INTO pelanggan (kode,nama_pelanggan,jk,tmp_lahir,tgl_lahir,email,alamat,kartu_id) VALUES
    -> ('011108','SANDRA','P','Sukabumi','1999-06-04','sandara@gmail.com','Sukabumi',1);
Query OK, 1 row affected, 1 warning (0.013 sec)

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

-- 4. Tampilkan pelanggan mengandung huruf 'SA'
MariaDB [dbtoko1]> SELECT * FROM pelanggan WHERE nama_pelanggan like '%SA%';
+----+--------+----------------+------+-----------+------------+-------------------+----------+----------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir | tgl_lahir  | email             | alamat   | kartu_id |
+----+--------+----------------+------+-----------+------------+-------------------+----------+----------+
|  7 | 011107 | Sandi          | L    | Bandung   | 1998-08-12 | sandi@gmail.com   | Bandung  |        2 |
|  9 | 011108 | SANDRA         | P    | Sukabumi  | 1999-06-04 | sandara@gmail.com | Sukabumi |        1 |
+----+--------+----------------+------+-----------+------------+-------------------+----------+----------+
2 rows in set (0.000 sec)

-- 5. Tampilkan pelanggan yang lahirnya bukan di Jakarta dan mengandung huruf ‘yo‘
MariaDB [dbtoko1]> SELECT * FROM pelanggan WHERE tmp_lahir != 'Jakarta' and tmp_lahir like '%yo%';
+----+--------+----------------+------+------------+------------+------------------+------------+----------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir  | tgl_lahir  | email            | alamat     | kartu_id |
+----+--------+----------------+------+------------+------------+------------------+------------+----------+
|  2 | 011102 | Pandan wangi   | P    | Yogyakarta | 1998-08-07 | pandan@gmail.com | Yogyakarta |        1 |
+----+--------+----------------+------+------------+------------+------------------+------------+----------+
1 row in set (0.010 sec)

-- 6. Tampilkan pelanggan yang karakter huruf ke – 2 nya adalah A
MariaDB [dbtoko1]> SELECT * FROM pelanggan WHERE nama_pelanggan LIKE '_a%';
+----+--------+----------------+------+------------+------------+-------------------+------------+----------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir  | tgl_lahir  | email             | alamat     | kartu_id |
+----+--------+----------------+------+------------+------------+-------------------+------------+----------+
|  2 | 011102 | Pandan wangi   | P    | Yogyakarta | 1998-08-07 | pandan@gmail.com  | Yogyakarta |        1 |
|  6 | 011106 | Gayatri Putri  | P    | Jakarta    | 2002-09-01 | gayatri@gmail.com | Jakarta    |        1 |
|  7 | 011107 | Sandi          | L    | Bandung    | 1998-08-12 | sandi@gmail.com   | Bandung    |        2 |
|  9 | 011108 | SANDRA         | P    | Sukabumi   | 1999-06-04 | sandara@gmail.com | Sukabumi   |        1 |
+----+--------+----------------+------+------------+------------+-------------------+------------+----------+
4 rows in set (0.000 sec)

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
6 rows in set (0.001 sec)

-- Soal 2.4
-- 1. Tampilkan 2 data produk termahal
MariaDB [dbtoko1]> SELECT * FROM produk ORDER BY harga_beli desc limit 2;
+----+------+--------+------------+------------+------+----------+-----------------+
| id | kode | nama   | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+--------+------------+------------+------+----------+-----------------+
|  3 | K001 | Kulkas |    4000000 |    5000000 |   10 |        3 |               1 |
|  1 | TV01 | TV     |    3000000 |    4000000 |    3 |        2 |               1 |
+----+------+--------+------------+------------+------+----------+-----------------+
2 rows in set (0.000 sec)

-- 2. Tampilkan produk yang paling murah
MariaDB [dbtoko1]> SELECT * FROM produk ORDER BY harga_beli limit 1;
+----+------+-----------+------------+------------+------+----------+-----------------+
| id | kode | nama      | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+-----------+------------+------------+------+----------+-----------------+
|  6 | TK01 | Teh Kotak |       3000 |       4000 |    2 |       10 |               3 |
+----+------+-----------+------------+------------+------+----------+-----------------+
1 row in set (0.009 sec)

-- 3. Tampilkan produk yang stoknya paling banyak
MariaDB [dbtoko1]> SELECT * FROM produk ORDER BY stok desc limit 1;
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  2 | TV02 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 |
+----+------+------------+------------+------------+------+----------+-----------------+
1 row in set (0.000 sec)

-- 4. Tampilkan dua produk yang stoknya paling sedikit
MariaDB [dbtoko1]> SELECT * FROM produk ORDER BY stok limit 1;
+----+------+-----------+------------+------------+------+----------+-----------------+
| id | kode | nama      | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+-----------+------------+------------+------+----------+-----------------+
|  6 | TK01 | Teh Kotak |       3000 |       4000 |    2 |       10 |               3 |
+----+------+-----------+------------+------------+------+----------+-----------------+
1 row in set (0.000 sec)

-- 5. Tampilkan pelanggan yang paling muda
MariaDB [dbtoko1]> SELECT * FROM pelanggan ORDER BY tgl_lahir desc limit 1;
+----+--------+----------------+------+-----------+------------+-------------------+---------+----------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir | tgl_lahir  | email             | alamat  | kartu_id |
+----+--------+----------------+------+-----------+------------+-------------------+---------+----------+
|  6 | 011106 | Gayatri Putri  | P    | Jakarta   | 2002-09-01 | gayatri@gmail.com | Jakarta |        1 |
+----+--------+----------------+------+-----------+------------+-------------------+---------+----------+
1 row in set (0.000 sec)

-- 6. Tampilkan pelanggan yang paling tua
MariaDB [dbtoko1]> SELECT * FROM pelanggan ORDER BY tgl_lahir limit 1;
+----+--------+----------------+------+-----------+------------+-----------------+---------+----------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir | tgl_lahir  | email           | alamat  | kartu_id |
+----+--------+----------------+------+-----------+------------+-----------------+---------+----------+
|  1 | 011101 | Agung          | L    | Bandung   | 1997-09-06 | agung@gmail.com | Bandung |        1 |
+----+--------+----------------+------+-----------+------------+-----------------+---------+----------+
1 row in set (0.001 sec)

MariaDB [dbtoko1]>