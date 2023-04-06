--1.Buat table produk
MariaDB [dbtoko1]> CREATE TABLE produk(
    -> id int NOT NULL auto_increment primary key,
    -> kode varchar(10) unique,
    -> nama varchar(45) NOT NULL,
    -> harga_beli double,
    -> harga_jual double,
    -> stok int(11),
    -> min_stok int(11),
    -> jenis_produk_id int NOT NULL REFERENCES jenis_produk(id));

--menampilkan table produk
MariaDB [dbtoko1]> show tables;

--2.Buat table pesanan items
MariaDB [dbtoko1]> CREATE TABLE pesanan_items(
    -> id int NOT NULL auto_increment primary key,
    -> produk_id int NOT NULL REFERENCES produk(id),
    -> pesanan_id int NOT NULL references pesanan(id),
    -> qty int(11),
    -> harga double);

--menampilkan table pesanan items
MariaDB [dbtoko1]> show tables;

--3.Buat table vendor
MariaDB [dbtoko1]> CREATE TABLE vendor(
    -> id int NOT NULL auto_increment primary key,
    -> nomor varchar(4) unique,
    -> nama varchar(40) NOT NULL,
    -> kota varchar(30),
    -> kontak varchar(30));

--Menampilkan table vendor
MariaDB [dbtoko1]> show tables;

--4.Buat table pembelian
MariaDB [dbtoko1]> CREATE TABLE pembelian(
    -> id int NOT NULL auto_increment primary key,
    -> tanggal varchar(45),
    -> nomor varchar(10) unique,
    -> produk_id int NOT NULL references produk(id),
    -> jumlah int(11),
    -> harga double,
    -> vendor_id int NOT NULL references vendor(id));

--menampilkan table pembelian;
MariaDB [dbtoko1]> show tables;

--5.Tambahkan kolom alamat pada pelanggan dengan tipe data varchar (40)
MariaDB [dbtoko1]> ALTER TABLE pelanggan
    -> ADD COLUMN alamat varchar(40) AFTER email;

--deskripsikan table pelanggan
MariaDB [dbtoko1]> desc pelanggan;

--6.Ubah kolom nama pada pelanggan menjadi nama_pelanggan
MariaDB [dbtoko1]> ALTER TABLE pelanggan
    -> CHANGE nama nama_pelanggan varchar(45);

--deskripsikan table pelanggan
MariaDB [dbtoko1]> desc pelanggan;

--7.edit tipe data nama_pelanggan menjadi varchar(50)
MariaDB [dbtoko1]> ALTER TABLE pelanggan
    -> MODIFY nama_pelanggan varchar(50);

--deskripsikan table pelanggan
MariaDB [dbtoko1]> desc pelanggan;
