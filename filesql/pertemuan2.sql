-- Pertemuan 2
-- sintak dasar
-- tipe data
-- constraint
-- alter table & drop table 
-- view index
--
-- 1. sintaks dasar
-- pada sqlite bersifat casesensitive
-- komentar diawali tanda strip 2x --
--
--
-- 2 tipe data
-- Tipe kelas

-- ada 5 tipe yang bisa dipakai saat memasukan data ke database sqlite
-- 
- NULL
-- 
- INTEGER
-- 
- REAL

-- - TEXT
-- 
- BLOB

-- tipe data lengkap
-- - INT

-- - INTEGER

-- - TINYINT
-- 
- SMALLINT
-- 
- MEDIUMINT          =>  INTEGER
-- 
- BIGINT

-- - UNSIGNED BIG INT
-- 
- INT2
-- 
- INT8
-- 
---------------------------
- 
-- - CHARACTER(n)
-- 
- VARCHAR(n)
-- 
- VARYING CHARACTER(n)
-- 
- NCHAR(n)               => TEXT
-- 
- NATIVE CHARACTER(n)
-- 
- NVARCHAR(n)

-- - TEXT
-- 
- CLOB

-- ---------------------------
- 
-- BLOB

-- - no datatype specified    => NONE

-- ---------------------------

-- - REAL                     
-- 
- DOUBLE
-- 
- DOUBLE PRECISION    => REAL
-- 
- FLOAT
-- 
---------------------------

-- - NUMERIC
-- 
- DECIMAL
-- 
- BOOLEAN             => NUMERIC
-- 
- DATE
-- 
- DATETIME

-- 
---------------------------

--
--
-- 3 Alter dan Drop table
-- alter table untuk mengganti nama tabel
ALTER TABLE karyawan RENAME TO KuliIT;
--
-- alter table untuk menambahkan kolom
ALTER TABLE KuliIT ADD COLUMN lamamengabdi INT(3);
--
-- drop table untuk menghapus tabel
DROP TABLE karyawan;
--
--
-- 4 Constraint 
-- Constraint memberlakukan batasan dan aturan pada nilai yang dimasukan ke kolom untuk validasi data

-- - Primary key
  semua nilai unik dan digunakan untuk identitas tabel
  
--   contoh
  
--   NamaKolom INTEGER NOT NULL PRIMARY KEY;
  
--   atau
  
--   PRIMARY KEY(NamaKolom);
  
--   atau
  
--   PRIMARY KEY (NamaKolom1, NamaKolom2);
-- 
-----------------------

-- - Not Null
  Mencegah nilai kosong, dan nilai kolom harus diisi saat memasukan data
 
--   contoh
 
--   NamaKolom INTEGER NOT NULL
-- 
-----------------------
- 
-- - Default
  Jika nilai tidak dimasukan saat memasukan data nilai default --   yang akan dimasukan ke kolom
  
--   contoh
 
--   NamaKolom INTEGER DEFAULT 0;

-- -----------------------

-- - Unique
  Mencegah nilai ganda dalam suatu kolom
 
--   contoh
 
--   IdKaryawan INTEGER NOT NULL UNIQUE;

-- -----------------------
- 
-- - Chek
  Mengecek kondisi nilai saat dimasukan, jika nilai tidak cuco dengan kondisi maka 
--   tidak akan dimasukan.
  
--   contoh
  JumlahPesan INTEGER NOT NULL CHECK(JumlahPesan >= 1);

-- -----------------------

-- - Foreign Key
  Saat menggunakan banyak tabel dan saling relasi satu sama lain dan kita menginginkan
--   nilai yang dimasukan harus ada di tabel lain maka kita membutuhkan Foreign Key
  
--   Di Sqlite Foreign Key di nonaktifkan secara default, 
--   untuk mengaktifkannya dengan perintah 
-- 
-----------------------
  
--   PRAGMA foreign_keys = ON;
  
--   Contoh

--   |-----menu-----|            |--kategorimenu--|
--   
| id           |      |------> id            |
--   
| nama         |      |     |  nama          |
--   
| harga        |      |     |----------------|
--   
| id_kategori  |------|

--   |--------------|

--   perintah membuat tabelnya adalah 

  
--   CREATE TABLE "kategorimenu" (
 
--   id int(1) primary key not null,
  
--   nama char(50)
  );
 
--   CREATE TABLE "menu" (
 
--   id int(3) primary key not null,
 
--   nama char(75),
 
--   harga real,
 
--   id_kategori INT,
--   FOREIGN KEY(id_kategori) REFERENCES kategorimenu(id)
  );

--
--
-- 5 View dan Index
--   View digunakan untuk menyajikan data dari tabel. view sangat mirip dengan tabel tetapi tidak bisa
--   digunakan untuk menyimpan ke dalam tabel. view dibuat menggunakan statemen select.

CREATE VIEW SemuaMenuView
 
AS
  
SELECT
   
  m.nama,
  
  m.harga,
  
  m.id_kategori

FROM menu AS m
INNER JOIN kategorimenu AS k 
ON m.id_kategori = k.id;


--
SELECT name FROM sqlite_master WHERE type = 'view';
-- 
--   Temporary View adalah view yang digunakan pada koneksi database saat ini, jika kita keluar 
--   dari database, temporary view akan dihapus secara otomatis.

--   perintahnya sama dengan view hanya bedanya menggunakan statemen CREATE TEMP VIEW atau
--   CREATE TEMPORARY VIEW
--   
--   Hapus View
--   untuk menghapus view dengan perintah DROP
DROP VIEW SemuaMenuView;
--
--   Index pada sqlite fungsinya sama seperti daftar isi pada buku, saat kita mencari sebuah baris 
--   pada tabel sqlite dengan kriteria pencarian maka sqlite akan mencari semua baris sampe menemukan
--   baris yang cuco dengan kriteria pencarian kita. proses pencarian akan menjadi lambat ketika kita 
--   punya tabel besar

--   index digunakan untuk speed up dan optimasi database untuk menambah performa
--
CREATE INDEX NamaMenuIndex ON menu(nama);
PRAGMA index_list(menu);
--   index bukan hanya dibuat berdasarkan kolom tetapi bisa juga berdasarkan ekspresi 
--   seperti contoh berikut
CREATE INDEX JumlahOrderIndex ON transaksi(id, id_menu*jumlah); 
--
--
-- pertemuan 2 selesai 
-- \(^_^)/