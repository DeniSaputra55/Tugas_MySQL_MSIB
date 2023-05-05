Microsoft Windows [Version 10.0.19045.2846]
(c) Microsoft Corporation. All rights reserved.

F:\xampp7\mysql\bin>mysql -u root -p
Enter password:
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 10
Server version: 10.4.18-MariaDB mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> USE dbtoko1;
Database changed

-- menambahkan kolom status_pembayaran pada table pembayaran
MariaDB [dbtoko1]> ALTER TABLE pembayaran ADD COLUMN status_pembayaran VARCHAR(20) DEFAULT 'belum lunas';
Query OK, 0 rows affected (0.019 sec)
Records: 0  Duplicates: 0  Warnings: 0

-- menambhakan kolom total_bayar pada table pembayaran
MariaDB [dbtoko1]> ALTER TABLE pembayaran ADD total_bayar DECIMAL(10,2);
Query OK, 0 rows affected (0.011 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [dbtoko1]> desc pembayaran;
+-------------------+---------------+------+-----+-------------+----------------+
| Field             | Type          | Null | Key | Default     | Extra          |
+-------------------+---------------+------+-----+-------------+----------------+
| id                | int(11)       | NO   | PRI | NULL        | auto_increment |
| no_kuintasi       | varchar(10)   | YES  | UNI | NULL        |                |
| tanggal           | date          | YES  |     | NULL        |                |
| jumlah            | double        | YES  |     | NULL        |                |
| ke                | int(11)       | YES  |     | NULL        |                |
| pesanan_id        | int(11)       | NO   |     | NULL        |                |
| status_pembayaran | varchar(20)   | YES  |     | belum lunas |                |
| total_bayar       | decimal(10,2) | YES  |     | NULL        |                |
+-------------------+---------------+------+-----+-------------+----------------+
8 rows in set (0.017 sec)

-- menambhakan kolom total_harga pada table pembayaran
MariaDB [dbtoko1]> ALTER TABLE pembayaran ADD total_harga DECIMAL(10,2) DEFAULT 0 AFTER id;
    -> END $$
Query OK, 0 rows affected (0.013 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [dbtoko1]> desc pembayaran;
+-------------------+---------------+------+-----+-------------+----------------+
| Field             | Type          | Null | Key | Default     | Extra          |
+-------------------+---------------+------+-----+-------------+----------------+
| id                | int(11)       | NO   | PRI | NULL        | auto_increment |
| total_harga       | decimal(10,2) | YES  |     | 0.00        |                |
| no_kuintasi       | varchar(10)   | YES  | UNI | NULL        |                |
| tanggal           | date          | YES  |     | NULL        |                |
| jumlah            | double        | YES  |     | NULL        |                |
| ke                | int(11)       | YES  |     | NULL        |                |
| pesanan_id        | int(11)       | NO   |     | NULL        |                |
| status_pembayaran | varchar(20)   | YES  |     | belum lunas |                |
| total_bayar       | decimal(10,2) | YES  |     | NULL        |                |
+-------------------+---------------+------+-----+-------------+----------------+
9 rows in set (0.021 sec)

-- membuat  trigger AFTER UPDATE
MariaDB [dbtoko1]> DELIMITER $$
MariaDB [dbtoko1]> CREATE TRIGGER update_status_pembayaran AFTER UPDATE ON pembayaran
    -> FOR EACH ROW
    -> BEGIN
    -> IF NEW.total_bayar = NEW.total_harga THEN
    -> UPDATE pembayaran SET status_pembayaran = 'lunas' WHERE id = NEW.id;
    -> ELSE
    -> UPDATE pembayaran SET status_pembayaran = 'belum lunas' WHERE id = NEW.id;
    -> END IF;
    -> END $$
Query OK, 0 rows affected (0.015 sec)

MariaDB [dbtoko1]> DELIMITER ;
MariaDB [dbtoko1]> select * from pesanan;
+----+------------+--------+--------------+
| id | tanggal    | total  | pelanggan_id |
+----+------------+--------+--------------+
|  1 | 2023-03-04 | 200000 |            1 |
|  2 | 0000-00-00 | 200000 |            1 |
|  3 | 2022-02-02 |  30000 |            1 |
+----+------------+--------+--------------+
3 rows in set (0.000 sec)

-- menambahkan kolom id_pembayaran pada table pesanan
MariaDB [dbtoko1]> ALTER TABLE pesanan ADD COLUMN id_pembayaran INT;
Query OK, 0 rows affected (0.011 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [dbtoko1]> SELECT * FROM pesanan;
+----+------------+--------+--------------+---------------+
| id | tanggal    | total  | pelanggan_id | id_pembayaran |
+----+------------+--------+--------------+---------------+
|  1 | 2023-03-04 | 200000 |            1 |          NULL |
|  2 | 0000-00-00 | 200000 |            1 |          NULL |
|  3 | 2022-02-02 |  30000 |            1 |          NULL |
+----+------------+--------+--------------+---------------+
3 rows in set (0.000 sec)

-- membuat trigger BEFORE UPDATE
MariaDB [dbtoko1]> DELIMITER $$
MariaDB [dbtoko1]> CREATE TRIGGER proses_pembayaran_update_before BEFORE UPDATE on pesanan
    -> FOR EACH ROW
    -> BEGIN
    -> IF OLD.id_pembayaran = NEW.id_pembayaran THEN
    -> SET @status = 'BELUM BAYAR';
    -> SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Warning: Belum Lunas';
    -> END IF;
    -> UPDATE pembayaran SET status_pembayaran = @status WHERE id = OLD.id_pembayaran;
    -> SET @status_lama = (SELECT status_pembayaran FROM pembayaran WHERE id = OLD.id_pembayaran);
    -> UPDATE pembayaran SET status = @status_lama WHERE id = OLD.id_pembayaran;
    -> SET @status_baru = (SELECT status_pembayaran FROM pembayaran WHERE id = NEW.id_pembayaran);
    -> IF @status_baru < 'Sudah Bayar' THEN
    -> SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Warning: Belum Lunas';
    -> END IF;
    -> UPDATE pembayaran SET status = @status_baru WHERE id = NEW.id_pembayaran;
    -> END $$
Query OK, 0 rows affected (0.014 sec)

MariaDB [dbtoko1]> DELIMITER ;



