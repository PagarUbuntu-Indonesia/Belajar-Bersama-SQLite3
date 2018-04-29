-- Pertemuan 4
-- Khusus bahas Klausa SELECT
--
-- The SELECT Pipeline
-- Sintaks dari SELECT adalah untuk merepresentasikan data. SELECT mendukung berbagaimacam tipe query. 
-- Penggunaan SELECT memiliki klausa opsional yang sangat luas.

-- 
-- Sintaks SELECT yang paling umum seperti ini :
-- SELECT [DISTINC] select_heading
-- 	    FROM source_table
-- 	    WHERE filter_expression
-- 	    GROUP BY grouping_expressions
-- 	        HAVING filter_expression
-- 	    ORDER BY ordering_expressions
-- 	    LIMIT count
-- 	        OFFSET count
-- 
-- setiap klausa yang mengikuti perintah SELECT akhirnya membentuk seperti pipeline. secara konsep 
-- hasil dari statemen SELECT adalah memproses pemanggilan tabel, dan meneruskan (passing) tabel itu 
-- melewati pipeline. setiap tahapan membuat tabel aktual sebagai input untuk operasi kusus 
-- dan melewatkan tabel masilnya ke tahapan berikutnya.  

--
-- SELECT -> FROM -> WHERE -> GROUP BY -> HAVING -> ORDER BY -> LIMIT -> OFFSET
--
-- 
-- ------------------------------
-- Membaca data menggunakan SELECT
-- contoh
-- bash-4.2$ sqlite3 KodingKafe.db
SELECT * FROM menu INNER JOIN kategorimenu ON menu.id_kategori = kategorimenu.id;
--
--
-- ------------------------------
-- A Literal Value
-- Nilai literal adalah konstanta yang bisa digunakan pada SELECT. kita bisa menggunakan nilai literal 
-- dengan cara yang sama seperti menggunakan nama kolom pada klausa SELECT. 

-- berikut beberapa nilai literal yang bisa digunakan :

--   - Literal Numerik (seperti 1, 2.55, dst)

--   - Literal String  (semua string seperti 'Astina', 'Hai Dunia..', dst)

--   - NULL

--   - CURRENT_TIME  (akan memberikan waktu saat ini)

--   - CURRENT_DATE  (akan memberikan tanggal saat ini)

-- contoh
SELECT *, 2 AS 'kode kategori' FROM menu;
--
--
-- ------------------------------
-- Alias
-- contoh
SELECT id_kategori AS 'IDKategori' FROM menu;
SELECT m.* FROM menu AS m;
SELECT menu.nama, kategorimenu.nama FROM menu INNER JOIN kategorimenu ON menu.id_kategori = kategorimenu.id LIMIT 10;
SELECT m.nama, k.nama FROM menu AS m INNER JOIN kategorimenu AS k ON m.id_kategori = k.id LIMIT 10;
--
--
-- ------------------------------
-- Klausa WHERE
-- Klausa WHERE digunakan untuk memfilter hasil keluaran dari query sqlite, cara kerjanya nya adalah
-- melakukan kalkulasi pada bagian ekspresi, dan hasilnya berupa boolean, true, false, null lalu 
-- hanya baris yang bernilai true yang akan di kembalikan (return) untuk yang bernilai false 
-- atau null tidak akan dikembalikan.

-- contoh 
SELECT * FROM menu WHERE id_kategori = 3;
-- 
-- 
-- ------------------------------
-- List of operators in SQLite and how to use them
-- operator concatenation
-- digunakan untuk menggabungkan beberapa nilai literal atau kolom menjadi satu
-- contoh
SELECT 'ID dan Nama' || id || nama AS NamaDanID FROM menu LIMIT 10;
-- 
-- SQLite CAST operator
-- Operator Cast digunakan untuk mengubah nilai dari sebuah tipe data ke tipe data lain.
-- contoh
SELECT CAST('12.5' AS REAL) ToReal, CAS(12.5 AS INTEGER) As ToInteger;
-- 
-- 
-- ------------------------------
-- SQLite Arithmetic Operators
-- Digunakan untuk melakukan operasi aritmatika pada dua atau lebih literal numerik atau kolom numerik.

--   - penjumlahan (+)

--   - pengurangan (-)

--   - perkalian (*)

--   - modulo (%)

--   - pembagian (/)

-- contoh
SELECT 25+6, 25-6, 25%6, 25/6;
-- 
-- 
-- ------------------------------
-- SQLite Comparison operators
-- Digunakan untuk membandingkan dua operand dan menghasilkan nilai boolean true atau false
-- contoh
SELECT

10<6 as '<', 10<=6 AS '<=',

10>6 as '>', 10>=6 AS '>=',

10=6 as '=', 10==6 AS '==',

10!=6 as '!=', 10<>6 AS '<>';

-- 
-- 
-- ------------------------------
-- SQLite Pattern Matching operators
-- Operator LIKE digunakan untuk pencocokan pola, penggunaan LIKE untuk mencari nilai yang cocok 
-- dengan pola seperti berikut

-- contoh
SELECT * FROM menu WHERE nama LIKE 'Nasi%';
SELECT * FROM menu WHERE nama LIKE '%g';
SELECT * FROM menu WHERE nama LIKE '%ng%';
-- 
-- 
-- ------------------------------
-- Operator GLOB sama seperti operator LIKE, tetapi operator GLOB bersifat case sensitive.
-- contoh
SELECT 'Jack' GLOB 'j%';
SELECT 'Jack' LIKE 'j%';
-- 
-- 
-- ------------------------------
-- Operator Logikal
-- Digunakan untuk operasi logikal
--   - AND  akan mengembalikan true ketika semua operand atau hasil ekspresi bernila true
--   - OR akan mengembalikan true ketika salah satu operand atau hasil ekspresi bernilai true
--   - BETWEEN digunakan untuk memilih nilai diantara range dari dua buah nilai. 
--     contoh 'X BETWEEN Y AND Z' akan mengembalikan nilai true (1) jika nilai X berada 
--     diantara nilai Y dan Z. selain itu akan mengembalikan nilai false (0). 'X BETWEEN Y AND Z' 
--     equivalent dengan 'X >=Y AND X <=Z
--   - IN digunakan untuk mengambil sebuah operand dari daftar operand yang ada dan akan mengembalikan 
--     true jika operand pertama bernilai sama dengan salah satu nilai dalam list. contoh 'col IN(x, y, z)'
--     akan equivalent dengan '(col=x) or (col=y) or (col=z)'
--   - NOT IN digunakan untuk mengambil sebuah operand yang tidak ada dalam daftar operand. 
--     contoh 'col NOT IN(x, y, z) akan equivalent dengan '(col<>x) AND (col<>y) AND (col<>z)'
--   - EXISTS tidak menggunakan operand, dia diikut oleh klausa SELECT yang akan menghasilkan 
--     nilai true (1) jika ada baris yang dihasilkan dari klausa SELECT, dan akan menghasilkan 
--     false (0) jika tidak ada baris yang dihasilkan oleh klausa SELECT
--   - NOT Digunakan untuk hasil kebalikan dari operator yang mengikutinya
-- contoh
SELECT * FROM menu WHERE (id > 5) AND (nama LIKE 'N%');
SELECT * FROM menu WHERE (id > 5) OR (nama LIKE 'N%');
SELECT * FROM menu WHERE id BETWEEN 5 AND 15;
SELECT * FROM menu WHERE id IN(2, 4, 6, 8, 10);
SELECT * FROM menu WHERE (id=2) OR (id=4) OR (id=6) OR (id=8) OR (id=10);
SELECT * FROM menu WHERE id NOT IN(2, 4, 6, 8);
SELECT * FROM menu WHERE (id <> 2) AND (id <> 4) AND (id <> 6) AND (id <> 8);
SELECT nama FROM kategorimenu AS k WHERE EXISTS (SELECT id_kategori FROM menu AS m WHERE k.id = m.id_kategori);
SELECT nama FROM kategorimenu AS k WHERE NOT EXISTS (SELECT id_kategori FROM menu AS m WHERE k.id = m.id_kategori);
-- 
-- 
-- ------------------------------
-- Sqlite ORDER
-- Digunakan untuk mengurutkan hasil keluaran dari ekspresi, kita menggunakan klausa ORDER BY;
-- contoh
SELECT m.nama, k.nama FROM menu AS m INNER JOIN kategorimenu AS k ON m.id_kategori = k.id ORDER BY k.nama ASC, m.nama DESC;
-- 
-- 
-- Sqlite LIMIT
-- Digunakan untuk membatasi jumlah baris yang dihasilkan oleh query sqlite. contohnya LIMIT 10 
-- akan membatasi hanya menghasilkan 10 baris dan mengabaikan sisanya
-- contoh
SELECT * FROM menu LIMIT 4, 3;
-- 
-- 
-- ------------------------------
-- Sqlite DISTINC
-- Jika query sqlite menghasilkan nilai yang terduplikat kita bisa menggunakan keyword DISTINC 
-- untuk menghapus duplicate nya dengan mengembalikan nilai yang distinc. Kita bisa menentukan 
-- lebih dari satu kolom setelah DISTINC.
-- contoh
SELECT k.nama FROM menu AS m INNER JOIN kategorimenu AS k;
SELECT DISTINCT k.nama FROM menu AS m INNER JOIN kategorimenu AS k;
-- 
-- 
-- ------------------------------
-- AGREGATE
-- adalah fungsi builtin pada sqlite yang akan mengelompokkan banyak nilai dari banyak baris 
-- ke sebuah nilai.
--   AVG()  - menghasilkan nilai rata-rata dari beberapa nilai
--   COUNT() COUNT(x) or COUNT(*)  - menghasilkan banyaknya nilai dari nilai x.
--   GROUP_CONCAT(kolom)  - Digunakan untuk menggabungkang concatenate semua nama pada kolom 
--                          ke sebuah string dibatasi koma. Dia tidak menampilkan daftar nilai, 
--                          dia hanya menampilkan satu nilai pada satu baris.
--   MAX()  - akan mengembalikan nilai tertinggi dari argumen
--   MIN()  - akan mengembalikan nilai terkecil dari argumen
--   SUM()  - menjumlahkan semua bilangan, akan menghasilkan null jika semua nilai null, selalu 
--            menghasilkan integer
--   TOTAL()  - menjumlahkan semua bilangan, akan menghasilkan 0 jika semua nilai null,
--              selalu menghasilkan nilai float
-- contoh
SELECT AVG(harga) FROM menu;
SELECT COUNT(id), COUNT(DISTINCT id_kategori), COUNT(*) FROM menu;
SELECT GROUP_CONCAT(k.nama) FROM menu AS m INNER JOIN kategorimenu AS k ON m.id_kategori = k.id;
SELECT GROUP_CONCAT(k.nama, ' & ') FROM menu AS m INNER JOIN kategorimenu AS k ON m.id_kategori = k.id;
SELECT MAX(harga), MIN(harga) FROM menu;
SELECT SUM(harga), TOTAL(harga) FROM menu;
-- 
-- 
-- ------------------------------
-- Sqlite GROUP BY
-- digunakan khusus untuk satu atau lebih kolom yang akan digunakan sebagai sebuah group. 
-- Baris yang bernilai sama akan dikumpulkan ke grup-grup.
-- contoh
SELECT k.nama, COUNT(m.id) AS HitungMenu FROM menu AS m INNER JOIN kategorimenu AS k 
ON m.id_kategori = k.id GROUP BY k.nama;
-- 
-- 
-- ------------------------------
-- Klausa HAVING
-- Digunakan untuk menyaring hasil keluaran grup oleh klausa GROUP BY.
-- contoh
SELECT k.nama, COUNT(m.id) AS HitungMenu FROM menu AS m INNER JOIN kategorimenu AS k ON m.id_kategori = k.id GROUP BY k.nama HAVING COUNT(m.id) = 5;
-- 
-- 
-- ------------------------------
-- Sqlite Query dan Sub Query
-- Didalam query kita bisa membuat query lain. query bersarang (nested) ini disebut sebagai subquery.
-- contoh
SELECT * FROM menu WHERE id IN (SELECT id  FROM menu WHERE harga > 5000);
-- 
-- 
-- ------------------------------
-- UNION 
-- mengembalikan gabungan dari tabel
-- contoh
SELECT id_kategori AS idGabungan FROM menu UNION SELECT id FROM kategorimenu;
-- 
-- 
-- ------------------------------
-- INTERSECT
-- mengembalikan nilai yang ada dari kombinasi dua tabel. 
-- nilai yang tidak ada pada salah satunya diabaikan.
-- contoh
SELECT id_kategori FROM menu INTERSECT SELECT id FROM kategorimenu;
-- 
-- 
-- ------------------------------
-- EXCEPT
-- Misalnya kita mempunyai dua buah list yaitu list1 dan list2 jika kita hanya ingin menampilkan 
-- hasil baris dari list1 yang tidak terdapat di list2 kita menggunakan EXCEPT
-- contoh
SELECT id FROM kategorimenu EXCEPT SELECT id_kategori FROM menu;
-- 
-- 
-- ------------------------------
-- Null
-- adalah nilai khusus di sqlite yang mewakili tidak diketahui (unknown) atau kehilangan nilai 
-- (missing value), kalo nilai blank "" atau 0 adalah known value
-- contoh
SELECT * FROM menu WHERE kategorimenu = NULL;
SELECT * FROM menu WHERE kategorimenu IS NULL;
-- 
-- 
-- ------------------------------
-- WHEN 
-- digunakan untuk pernyataan kondisional
SELECT nama,

CASE
 
  WHEN id_kategori IS NULL THEN 'Ga ada kategori'
 
  ELSE id_kategori

END

AS KategoriMenu

FROM menu;

-- 
-- 
-- ------------------------------
-- Advanced Query
-- AQ adalah query yang berisi JOIN, subquery dan beberapa agregate rumit.
-- biasanya pakai SELECT, GROUP_CONCAT(), INNER JOIN, GROUP BY, HAVING dst
-- contohnya ga ada
-- mangap _/|\_
-- 
-- 
-- Pertemuan 4 done \(^_^)/
-- 
-- 