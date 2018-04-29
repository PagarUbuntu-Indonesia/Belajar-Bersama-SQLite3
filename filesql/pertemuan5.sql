-- Pertemuan 5
--   - inner join
--   
- left outer join
--   
- cross join
--   
- klausa having
--   
- keywoard distinc
--   
- limit

--
-- ---------------------
-- Klausa JOIN
-- Pada saat tertentu kita membutuhkan pengambilan data dari banyak tabel, untuk itu digunakan 
-- klausa JOIN, kita bisa menghubungkan dua atau lebih tabel atau subquery dengan melakukan 
-- JOIN tabel, juga bisa mendefinisikan kolom yang akan di join dan kondisinya.
-- 
-- Setiap Klausa JOIN berisi
--   - nama tabel atau subquery sebagai left table, nama tabel atau subquery sebelum klausa join
--   - JOIN operator (diantara INNER JOIN, LEFT OUTER JOIN, atau CROSS JOIN). 
--   - JOIN constraint (sebagai kondisi baris yang cocok dengan kondisi akan dipilih)
-- 
-- 
-- 
-- ---------------------
-- INNER JOIN
-- akan menghasilkan hanya baris yang cocok dengan kondisi join dan mengabaikan semua baris 
-- lainnya yang tidak cocok dengan kondisi
-- contoh
SELECT menu.nama, kategorimenu.nama FROM menu INNER JOIN kategorimenu ON menu.id_kategori = kategorimenu.id;
-- 
-- 
-- ---------------------
-- JOIN - USING
-- kita bisa menggunakan INNER JOIN diikuti USING
-- contoh
SELECT menu.nama, kategorimenu.nama FROM menu INNER JOIN kategorimenu USING(id_kategori);
-- 
-- 
-- ---------------------
-- NATURAL JOIN
-- Natural join mirip JOIN - USING, perbedaannya natural join otomatis menguji kesamaan 
-- diantara nilai setiap kolom yang ada di kedua tabel.
-- contoh
SELECT menu.nama, kategorimenu.nama FROM menu NATURAL JOIN kategorimenu;
-- 
-- 
-- ---------------------
-- LEFT OUTER JOIN
-- Standart sql mendukung 3 jenis outer join: left, right dan full, tapi sqlite hanya mendukung 
-- left outer join.
-- Pada left outer join semua nilai dari kolom pada tabel kiri melalui perintah SELECT akan 
-- termasuk pada hasil query, jadi nilai cocok atau tidak dengan kondisi kolom kiri selalu 
-- muncul sebagai hasil.
-- jadi misalnya tabel kiri memiliki 'n' baris maka hasil query juga akan 'n baris. 
-- sedangkan pada tabel kanan jika nilai tidak cocok dengan kondisi join akan menghasilkan null.
-- contoh
SELECT menu.nama, kategorimenu.nama FROM menu LEFT JOIN kategorimenu ON menu.id_kategori = kategorimenu.id;
-- 
-- 
-- 
-- 
-- 100402
-- 
-- ---------------------
-- CROSS JOIN
-- Cross join akan menghasilkan nilai dari kolom yang di SELECT pada gabungan dua tabel, 
-- yang datanya cocok semua nilai dari tabel pertama dan tabel kedua.

-- jadi semua nilai di tabel pertama akan cocok dengan 'n' baris dari tabel ke dua.
-- contoh
SELECT * FROM menu CROSS JOIN kategorimenu;
-- 
-- 
-- ---------------------
-- Klausa HAVING
-- fungsinya mirip dengan klausa WHERE, digunakan untuk memfilter nilai dari tiap 
-- baris tabel. setiap nilai yang bernilai false akan dibuang. 
-- perbedaan HAVING dengan WHERE, klausa WHERE ditempatkan pada kondisi pemilihan kolom, 
-- sedangkan HAVING digunakan setelah GROUP BY yang menginjinkan HAVING untuk memfilter 
-- hasil keluaran dari GROUP BY. 
-- contoh
SELECT * FROM menu GROUP BY nama HAVING (count(nama) < 2);
-- 
-- 
-- ---------------------
-- DISTINC Keyword
-- Digunakan untuk membuang duplikat dari baris 
-- contoh
SELECT DISTINC nama FROM menu;
-- 
-- 
-- ---------------------
-- Klausa ORDER BY
-- digunakan untuk mengurutkan baris hasil dari SELECT. 
-- contoh
SELECT * FROM menu ORDER BY id_kategori ASC, id DESC;
-- 
-- 
-- ---------------------
-- Klausa LIMIT
-- digunakan untuk membatasi jumlah data yang dihasilkan statemen SELECT.
SELECT * FROM menu LIMIT 10;
SELECT * FROM menu LIMIT 3 OFFSET 10;
SELECT * FROM menu LIMIT 3, 10;
-- 
-- 
-- Pertemuan 5 selesai \(^_^)/
-- 
-- 
--