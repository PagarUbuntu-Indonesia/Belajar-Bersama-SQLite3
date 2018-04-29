PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE "kategorimenu" (
id int(1) primary key not null,
nama char(50)
);
INSERT INTO "kategorimenu" VALUES(1,'makanan');
INSERT INTO "kategorimenu" VALUES(2,'lauk');
INSERT INTO "kategorimenu" VALUES(3,'minuman');
INSERT INTO "kategorimenu" VALUES(4,'sayur');
INSERT INTO "kategorimenu" VALUES(5,'cuci mulut');
INSERT INTO "kategorimenu" VALUES(6,'sambel');
CREATE TABLE "menu" (
id int(3) primary key not null,
nama char(75),
harga real,
id_kategori int(1)
);
INSERT INTO "menu" VALUES(1,'Nasi Goreng',15000.0,1);
INSERT INTO "menu" VALUES(2,'Nasi Rames',15000.0,1);
INSERT INTO "menu" VALUES(3,'Nasi Putih',4000.0,1);
INSERT INTO "menu" VALUES(4,'Nasi Kuning',5000.0,1);
INSERT INTO "menu" VALUES(5,'Nasi Uduk',5000.0,1);
INSERT INTO "menu" VALUES(6,'Nasi Kibuli',10000.0,1);
INSERT INTO "menu" VALUES(7,'Ikan Kangmas Goreng',10000.0,2);
INSERT INTO "menu" VALUES(8,'Ikan Kangmas Bakar',12000.0,2);
INSERT INTO "menu" VALUES(9,'Ikan Kangmas Asem Manis Kek Syandal_',12000.0,2);
INSERT INTO "menu" VALUES(10,'Ikan Lele Goreng',8000.0,2);
INSERT INTO "menu" VALUES(11,'Ikan Lele Bakar',8000.0,2);
INSERT INTO "menu" VALUES(12,'Ayam Goreng',13000.0,2);
INSERT INTO "menu" VALUES(13,'Ayam Goreng Geprek',13000.0,2);
INSERT INTO "menu" VALUES(14,'Ayam Bakar',14000.0,2);
INSERT INTO "menu" VALUES(15,'Bebek Goreng',14000.0,2);
INSERT INTO "menu" VALUES(16,'Bebek Kremes',15000.0,2);
INSERT INTO "menu" VALUES(17,'Bebek Bakar',15000.0,2);
INSERT INTO "menu" VALUES(18,'Kepiting Kari',16000.0,2);
INSERT INTO "menu" VALUES(19,'Kepiting Kremes',16000.0,2);
INSERT INTO "menu" VALUES(20,'Kerang Kari',15000.0,2);
INSERT INTO "menu" VALUES(21,'Kerang Masak Bening',14000.0,2);
INSERT INTO "menu" VALUES(22,'Air Jeruk Anget',6000.0,3);
INSERT INTO "menu" VALUES(23,'Es Jeruk Manis',7000.0,3);
INSERT INTO "menu" VALUES(24,'Es Teh Manis',5000.0,3);
INSERT INTO "menu" VALUES(25,'Teh Anget Manis',4000.0,3);
INSERT INTO "menu" VALUES(26,'Es Terong Belanda',4000.0,3);
INSERT INTO "menu" VALUES(27,'Es Timun Serut',4000.0,3);
INSERT INTO "menu" VALUES(28,'Es Kelapa Muda',4000.0,3);
INSERT INTO "menu" VALUES(29,'Sayur Asem Kek Integermanula',6000.0,4);
INSERT INTO "menu" VALUES(30,'Sayur Sop',6000.0,4);
INSERT INTO "menu" VALUES(31,'Sayur Bening',6000.0,4);
INSERT INTO "menu" VALUES(32,'Oseng Kangkung',6000.0,4);
INSERT INTO "menu" VALUES(33,'Oseng Terong',6000.0,4);
INSERT INTO "menu" VALUES(34,'Terong Dicabein',6000.0,4);
INSERT INTO "menu" VALUES(35,'Puding',5000.0,5);
INSERT INTO "menu" VALUES(36,'Es Krim',5000.0,5);
INSERT INTO "menu" VALUES(37,'Semangka',5000.0,5);
INSERT INTO "menu" VALUES(38,'Melon',5000.0,5);
INSERT INTO "menu" VALUES(39,'Pisang',5000.0,5);
INSERT INTO "menu" VALUES(40,'Sambel Terasi',2000.0,6);
INSERT INTO "menu" VALUES(41,'Sambel Ijo',2000.0,6);
INSERT INTO "menu" VALUES(42,'Sambel Tomat',2000.0,6);
INSERT INTO "menu" VALUES(43,'Sambel Dabu-dabu',2000.0,6);
INSERT INTO "menu" VALUES(44,'Sambel Bali',2000.0,6);
INSERT INTO "menu" VALUES(45,'Cabe-cabean',2000.0,6);
CREATE TABLE "meja"
(
id int(2) primary key not null,
nama char(10)
);
INSERT INTO "meja" VALUES(1,'Meja 1');
INSERT INTO "meja" VALUES(2,'Meja 2');
INSERT INTO "meja" VALUES(3,'Meja 3');
INSERT INTO "meja" VALUES(4,'Meja 4');
INSERT INTO "meja" VALUES(5,'Meja 5');
INSERT INTO "meja" VALUES(6,'Meja 6');
INSERT INTO "meja" VALUES(7,'Meja 7');
INSERT INTO "meja" VALUES(8,'Meja 8');
INSERT INTO "meja" VALUES(9,'Meja 9');
INSERT INTO "meja" VALUES(10,'Meja 10');
CREATE TABLE 'paket' (
id int(2) primary key not null,
nama char(50),
harga real
);
INSERT INTO "paket" VALUES(1,'Jones 1',18000.0);
INSERT INTO "paket" VALUES(2,'Jones 2',14000.0);
INSERT INTO "paket" VALUES(3,'Couple 1',43000.0);
INSERT INTO "paket" VALUES(4,'Couple 2',38000.0);
INSERT INTO "paket" VALUES(5,'Honeymoon',70000.0);
INSERT INTO "paket" VALUES(6,'Family',92000.0);
INSERT INTO "paket" VALUES(7,'Jones Akut',3000.0);
CREATE TABLE 'promopaket' (
id int(2) primary key not null,
id_paket int(2),
id_menu int(3),
jumlah int(3)
);
INSERT INTO "promopaket" VALUES(1,1,1,1);
INSERT INTO "promopaket" VALUES(2,1,22,1);
INSERT INTO "promopaket" VALUES(3,2,3,1);
INSERT INTO "promopaket" VALUES(4,2,7,1);
INSERT INTO "promopaket" VALUES(5,2,25,1);
INSERT INTO "promopaket" VALUES(6,3,3,2);
INSERT INTO "promopaket" VALUES(7,3,13,1);
INSERT INTO "promopaket" VALUES(8,3,10,1);
INSERT INTO "promopaket" VALUES(9,3,22,2);
INSERT INTO "promopaket" VALUES(10,4,4,1);
INSERT INTO "promopaket" VALUES(11,4,5,1);
INSERT INTO "promopaket" VALUES(12,4,12,1);
INSERT INTO "promopaket" VALUES(13,4,20,1);
INSERT INTO "promopaket" VALUES(14,4,27,2);
INSERT INTO "promopaket" VALUES(15,5,6,2);
INSERT INTO "promopaket" VALUES(16,5,9,1);
INSERT INTO "promopaket" VALUES(17,5,13,1);
INSERT INTO "promopaket" VALUES(18,5,17,1);
INSERT INTO "promopaket" VALUES(19,5,26,1);
INSERT INTO "promopaket" VALUES(20,5,28,1);
INSERT INTO "promopaket" VALUES(21,5,32,1);
INSERT INTO "promopaket" VALUES(22,5,43,1);
INSERT INTO "promopaket" VALUES(23,6,3,2);
INSERT INTO "promopaket" VALUES(24,6,5,1);
INSERT INTO "promopaket" VALUES(25,6,14,1);
INSERT INTO "promopaket" VALUES(26,6,16,1);
INSERT INTO "promopaket" VALUES(27,6,18,1);
INSERT INTO "promopaket" VALUES(28,6,21,1);
INSERT INTO "promopaket" VALUES(29,6,25,3);
INSERT INTO "promopaket" VALUES(30,6,30,1);
INSERT INTO "promopaket" VALUES(31,6,35,1);
INSERT INTO "promopaket" VALUES(32,6,41,1);
INSERT INTO "promopaket" VALUES(33,7,3,1);
INSERT INTO "promopaket" VALUES(34,7,32,1);
CREATE TABLE 'transaksi' (
id int(10) primary key not null,
id_meja int(2),
nama char(75),
no_hp char(20),
id_menu int(3),
jumlah int(2),
id_paket int(2)
);
INSERT INTO "transaksi" VALUES(1,1,'Jhon','xxx',2,2,NULL);
INSERT INTO "transaksi" VALUES(2,1,'Jhon','xxx',8,1,NULL);
INSERT INTO "transaksi" VALUES(3,1,'Jhon','xxx',12,1,NULL);
INSERT INTO "transaksi" VALUES(4,1,'Jhon','xxx',22,1,NULL);
INSERT INTO "transaksi" VALUES(5,1,'Jhon','xxx',23,1,NULL);
COMMIT;
