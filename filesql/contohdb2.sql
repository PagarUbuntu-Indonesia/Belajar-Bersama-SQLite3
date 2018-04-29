PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE "karyawan" (
id int primary key not null,
nama text not null,
umur int not null,
alamat char(75),
gapok real , jenis_kelamin char(1));
INSERT INTO "karyawan" VALUES(1,'Annonimouse',17,'Tangerang',3000000.0,NULL);
INSERT INTO "karyawan" VALUES(2,'Slamet',18,'Banyumas',3500000.0,NULL);
INSERT INTO "karyawan" VALUES(3,'Paul',28,'California',2750000.0,NULL);
INSERT INTO "karyawan" VALUES(4,'Alen',25,'Texas',2000000.0,NULL);
INSERT INTO "karyawan" VALUES(5,'Teddy',23,'Norway',2500000.0,NULL);
INSERT INTO "karyawan" VALUES(6,'Mark',25,'Rich-Mond',4500000.0,NULL);
INSERT INTO "karyawan" VALUES(7,'David',27,'Montana',5000000.0,NULL);
INSERT INTO "karyawan" VALUES(8,'Paul',32,'Kelipornia',2250000.0,NULL);
CREATE TABLE bagian (
id INT PRIMARY KEY NOT NULL,
bagian CHAR(50) NOT NULL,
id_karyawan INT NOT NULL );
INSERT INTO "bagian" VALUES(1,'IT',1);
INSERT INTO "bagian" VALUES(2,'HRD',2);
INSERT INTO "bagian" VALUES(3,'Finnance',7);
INSERT INTO "bagian" VALUES(4,'Engineering',3);
INSERT INTO "bagian" VALUES(5,'Finnance',4);
INSERT INTO "bagian" VALUES(6,'Engineering',5);
INSERT INTO "bagian" VALUES(7,'Finnance',6);
CREATE TABLE audit (
id_karyawan  INT NOT NULL,
tanggal      TEXT NOT NULL
);
INSERT INTO "audit" VALUES(8,'2018-01-03 13:26:23');

COMMIT;
