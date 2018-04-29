-- berikut ini adalah perintah2 di pertemeuan pertama
-- 1 perintah dasar
.help
.quit
.database
.table
.schema
.schema namatable
.open KodingKafe.db
--
--
-- 2 membuat tabel
CREATE TABLE "karyawan" (

id int primary key not null,
nama text not null,
umur int not null,
alamat char(75),
gapok real , jenis_kelamin char(1));
--
--
-- 3 memasukkan baris data (insert record) ke database sqlite
INSERT INTO "karyawan" VALUES(1,'Annonimouse',17,'Tangerang',3000000.0,NULL);
INSERT INTO "karyawan" VALUES(2,'Slamet',18,'Banyumas',3500000.0,NULL);
INSERT INTO "karyawan" VALUES(3,'Paul',28,'California',2750000.0,NULL);

INSERT INTO "karyawan" VALUES(4,'Alen',25,'Texas',2000000.0,NULL);

INSERT INTO "karyawan" VALUES(5,'Teddy',23,'Norway',2500000.0,NULL);

INSERT INTO "karyawan" VALUES(6,'Mark',25,'Rich-Mond',4500000.0,NULL);

INSERT INTO "karyawan" VALUES(7,'David',27,'Montana',5000000.0,NULL);

INSERT INTO "karyawan" VALUES(8,'Paul',32,'Kelipornia',2250000.0,NULL);

--
--
-- 4 menghapus tabel
.table
DROP TABLE karyawan; 
.table
--
--
-- 5 menampilkan isi table (menggunakan SELECT)
select * from karyawan;
--
--
-- 6 merapikan tampilan tabel di CLI
.header on

.mode column

select * from karyawan;

-- 
--
-- 7 mengeksport tabel ke file *.csv
.headers on

.mode csv

.output namadata.csv

select * from karyawan;

.quit

--
--
-- 8 untuk membuat database perintahnya di shell os
-- bash$ sqlite3 NamaDatabase.db
--
--
-- 9 untuk perintah dump juga di shell os
-- bash$ sqlite3 NamaDatabase.db .dump > NamaSQL.sql
--
--
-- 10 untuk import dari file sql ke datase juga perintahnya di shell os
-- bash$ sqlite3 NamaDatabase.db < NamaSQL.sql
--
--
-- pertemuan 1 sekian .. \(^_^)/







