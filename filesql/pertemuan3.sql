-- Pertemuan 3
-- 1. DML
-- 2. Transaksi
-- 3. Penanganan Konflik
--
--
-- 1 Data Manipulation Language
-- Insert
-- Perintah insert digunakan untuk membuat record pada tabel database (atau disebut juga memasukan 
-- satu baris data kedalam tabel)

INSERT INTO menu(id, nama, harga, id_kategori) 
        VALUES (46, "Es Kosong", 2000.0, 3), (47, "Cah Jamur", 6000.0, 4);

-- 
-- Update
-- Digunakan untuk memperbaharui satu atau lebih kolom dalam satu record

UPDATE menu SET harga=13000.0 WHERE nama="Nasi Goreng";
-- 
-- sqlite> UPDATE menu SET harga=13000.0;
-- ^ hasil dari perintah itu keseluruhan baris yang ada harganya jadi 13k semua
-- 
-- Delete record
-- Untuk menghapus satu atau lebih record (baris) pada database menggunakan perintah DELETE
DELETE FROM menu WHERE nama='Cah Jamur';
DELETE FROM menu WHERE id=45 OR id=46;
-- 
--
-- 2 Transaksi
-- Transaksi Database (database transaction) adalah daftar operasi sqlite (insert/update/delete) 
-- yang dieksekusi sebagai satuan unit. artinya keseluruhan operasi harus berhasil dieksekusi atau
-- tidak sama sekali. semua operasi bisa dibatalkan jika salah satu gagal tereksekusi.

-- Contoh kasus transaksi
-- transaksi pada sebuah pengiriman uang via rekening sebuah bank akan melibatkan beberapa aktivitas. -- operasi transaksi meliputi penarikan uang (withdrawal) dari akun pertama dan penambahan uang 
-- (depositing) pada akun kedua. transaksi ini harus semua selesai atau semua dibatalkan. 
-- tidak boleh hanya separuhnya yang dijalankan.

-- 
-- Kontrol Transaksi
-- perintah2 berikut untuk mengontrol transaksi
-- BEGIN TRANSACTION     untuk memulai transaksi
-- COMMIT                menyimpan perubahan, alternative nya bisa menggunakan perntah END
-- ROLLBACK              untuk mengembalikan perubahan
-- perintah2 tranksaksi hanya digunakan pada perintah DML (INSERT, UPDATE, and DELETE) dan 
-- tidak bisa digunakan untuk pembuatan dan penghapusan tabel.

--
-- contoh
BEGIN;
DELETE from MENU WHERE id > 10 AND id < 40;
SELECT * FROM menu;
ROLLBACK;
SELECT * FROM menu;
--
-- contoh 2
BEGIN;
DELETE FROM menu where id = 44;
COMMIT;
SELECT * FROM menu;
--
--
-- 3 Klausa Conflict
-- Saat kita mempunyai kolom yang diberlakukan constraint (UNIQUE, NOT NULL, CHECK / PRIMARY KEY) 
-- dan kita mencoba melakukan aksi INSERT atau UPDATE dengan nilai kolom yang ternyata conflict 
-- dengan constraint.

--
-- contoh
-- Jika kolom memiliki constraint UNIQUE dan kita mencoba INSERT nilai yang sama (duplikat nilai) 
-- dengan baris lain maka akan terjadi conflict dengan constraint. 

-- klausa CONFLICT akan memberikan pilihan yang dilakukan untuk menyelesaikan conflict tersebut.
-- 
-- Pada sqlite ada 5 penyelesaian (resolve) conflict :
--   1. Rollback
--      Adalah aktivitas yang melakukan operasi kebalikan dari transaksi, yaitu membatalkan 
--      operasi-operasi sebelumnya yang sudah terlanjut berjalan sampai keadaan database kembali 
--      ke awal sebelum transaksi dijalankan. 

--      contoh ketika kita mencoba memperbaharui (update) 10 baris dan 5 baris terjadi konflik 
--      karena nilai tidak cuco dengan kondisi constraint maka tidak ada baris yang diperbaharui, 
--      10 baris tetap sama dan pesan error akan dimunculkan.

--   2. ABORT
--      Adalah pembatalan (cancel) statemen sqlite hanya pada posisi conflict dan transaksi 
--      tidak akan dibatalkan.

--      contoh, ketika kita mencoba memperbaharui 10 baris dan 5 baris terjadi conflict dengan 
--      constraint maka hanya 5 yang gagal diperbaharui tetapi 5 baris lainnya berhasil diperbaharui, 
--      pesan error akan dimunculkan

--   3. FAIL
--      Adalah pembatalan statemen sqlite terakhir yang terjadi conflict dengan constraint, akhirnya 
--      transaksi tidak bisa dilanjutkan tetapi perubahan terakhir akan di prioritaskan pada keadaan 
--      commited.

--      contoh, ketika kita mencoba memperbaharui 10 baris, dan nilai pada 5 baris terjadi conflict 
--      dengan constraint, maka hanya 4 baris yang diupdate sisanya tidak, pesan error akan dimunculkan

--   4. IGNORE
--      Adalah akan mengabaikan baris yang conflict dengan constraint dan melanjutkan baris 
--      berikutnya dari statemen sqlite. 

--      contoh, ketika kita mencoba memperbaharui 10 baris, dan nilai pada 5 baris terjadi conflict 
--      dengan constraint, maka hanya 4 baris yang diupdate sisanya tdk, pesan error tdk dimunculkan.

--   5. REPLACE
-- 	- Ketika constraint nya UNIQUE atau PRIMARY KEY, REPLACE akan pengganti baris yang melanggar 
--        constraint dengan nilai masukan baru

-- 	- Ketika constraintnya NOT NULL, REPLACE akan mengganti nilai NULL dengan nilai default, 
--        jika tidak ada nilai default maka statemen akan di batalkan (abort)

-- 	- Ketika constraintnya CHECK, statemen akan dibatalkan

--
-- contoh
CREATE TABLE "kategorimenu" (
id INT(1) PRIMARY KEY NOT NULL ON CONFLICT IGNORE,
nama VARCHAR(50) );
--
INSERT INTO "kategorimenu" VALUES(1,'makanan');
INSERT INTO "kategorimenu" VALUES(2,'lauk');
INSERT INTO "kategorimenu" VALUES(2,'minuman');
INSERT INTO "kategorimenu" VALUES(4,'sayur');
INSERT INTO "kategorimenu" VALUES(4,'cuci mulut');
INSERT INTO "kategorimenu" VALUES(6,'sambel');
--
-- contoh 2
CREATE TABLE "kategorimenu3" (
id INT(1) PRIMARY KEY NOT NULL ON CONFLICT REPLACE,
nama VARCHAR(50) );
--
INSERT INTO "kategorimenu3" VALUES(1,'makanan');
INSERT INTO "kategorimenu3" VALUES(2,'lauk');
INSERT INTO "kategorimenu3" VALUES(2,'minuman');
INSERT INTO "kategorimenu3" VALUES(4,'sayur');
INSERT INTO "kategorimenu3" VALUES(4,'cuci mulut');
INSERT INTO "kategorimenu3" VALUES(6,'sambel');
--
--
-- pertemuan 3 selesai :P

