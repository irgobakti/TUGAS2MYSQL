-- SOLA KE 1
 SELECT COUNT(*) AS Jumlah_pelanggan
    -> FROM pelanggan
    -> WHERE tgl_lahir ='1998';

-- 1.	Berapa jumlah pelanggan yang tahun lahirnya 1998

SELECT COUNT(*) AS jumlah_pelanggan_perempuan_jakarta
    -> FROM pelanggan
    -> WHERE jk = 'P' AND tmp_lahir = 'Jakarta';

-- 2.	Banyakkan jumlah pelanggan perempuan yang lahir di Jakarta pada tahun 1998

 SELECT SUM(stok) AS total_stok_produk
    -> FROM produk
    -> WHERE harga_jual < 10000;
 -- 3.	Total stok dari semua produk yang hargajualnya kurang dari Rp. 10.000

 SELECT COUNT(*) AS jumlah_produk_kode_k
    -> FROM produk
    -> WHERE kode LIKE 'K%';
-- 4.	Mencari jumlah produk yang diawali dengan K dan ada dalam database

 SELECT AVG(harga_jual) AS rata_rata_harga_jual_produk_diatas_1jt
    -> FROM produk
    -> WHERE harga_jual > 1000000;
-- 5.	Rata-rata harga jual dari produk yang hargajualnya lebih dari 1 juta

SELECT MAX(stok) AS jumlah_stok_terbesar
FROM produk;

-- 6.	Produk dengan jumlah stok terbesar 

 SELECT COUNT(*) AS jumlah_produk_kurang_dari_min_stok
    -> FROM produk
    -> WHERE stok < min_stok;

-- 7.	Hitung banyak produk yang stok nya kurang dari minimal stok yang telah ditentukan

SELECT sum(stok) as total_asset from produk;
-- 8.Total asset dari semua produk 




-- SOAL ke 2 ----------->

SELECT id, nama, stok,
    CASE 
        WHEN stok <= min_stok THEN 'segera belanja'
        ELSE 'stok aman'
    END AS status_stok
FROM produk;
-- 1.Menampilkan status stok setiap produk di database, apabila stok produk tidak memenuhi minimal stok maka akan muncul segera belanja jika terpenuhi maka stok aman

 SELECT id, nama, TIMESTAMPDIFF(YEAR, tgl_lahir, CURDATE()) AS umur,
    ->     CASE
    ->         WHEN TIMESTAMPDIFF(YEAR, tgl_lahir, CURDATE()) < 17 THEN 'muda'
    ->         WHEN TIMESTAMPDIFF(YEAR, tgl_lahir, CURDATE()) BETWEEN 17 AND 55 THEN 'Dewasa'
    ->         ELSE 'Tua'
    ->     END AS kategori_umur
    -> FROM pelanggan;
-- Untuk menampilkan data pelanggan yang usia dibawah 17 tahun , di atas 17 tahun sampai 
-- di atas 55 tahun dan tua

SELECT id, kode, nama,
    CASE
        WHEN kode = 'TV01' THEN 'DVD Player'
        WHEN kode = 'K001' THEN 'Rice Cooker'
        ELSE 'Tidak Ada'
    END AS bonus
FROM produk;
-- Menambahkan kolom baru "Bonus" pada table produk dengan kode ‘TV01’ →’DVD Player’ , ‘K001’ → ‘Rice Cooker’ selain dari diatas ‘Tidak Ada’


-- SOAL KE 3------------->
SELECT tmp_lahir AS tempat_lahir, COUNT(*) AS jumlah_pelanggan
FROM pelanggan
GROUP BY tmp_lahir
ORDER BY jumlah_pelanggan DESC;

-- 1.	Tampilkan data statistik jumlah tempat lahir pelanggan

SELECT jp.nama AS jenis_produk, COUNT(*) AS jumlah_produk
    -> FROM produk p
    -> JOIN jenis_produk jp ON p.jenis_produk_id = jp.id
    -> GROUP BY jp.nama
    -> ORDER BY jumlah_produk DESC;

-- 2.	Tampilkan jumlah statistik produk berdasarkan jenis produk

SELECT id, nama, TIMESTAMPDIFF(YEAR, tgl_lahir, CURDATE()) AS umur
FROM pelanggan
WHERE TIMESTAMPDIFF(YEAR, tgl_lahir, CURDATE()) < (
    SELECT AVG(TIMESTAMPDIFF(YEAR, tgl_lahir, CURDATE()))
    FROM pelanggan
);

-- 3.	Tampilkan data pelanggan yang usianya dibawah rata usia pelanggan

SELECT id, kode, nama, harga_jual
    -> FROM produk
    -> WHERE harga_jual > (
    ->     SELECT AVG(harga_jual)
    ->     FROM produk
    -> );
    -- 4.	Tampilkan data produk dengan hargajual yang lebih dari rata-rata hargajual produk

SELECT p.id, p.nama, p.email, k.iuran
    -> FROM pelanggan p
    -> JOIN kartu k ON p.kartu_id = k.id
    -> WHERE k.iuran > 90000;
    -- 5.	Tampilkan data pelanggan yang memiliki kartu dimana iuran tahunan kartu diatas 90rb

SELECT id, kode, nama, harga_jual
FROM produk
WHERE harga_jual < (
    SELECT AVG(harga_jual)
    FROM produk
);

-- 6.	Tampilkan statistik data produk dimana harga produknya dibawah rata-rata harga produk secara keseluruhan

SELECT p.id, p.nama, p.email, k.diskon
FROM pelanggan p
JOIN kartu k ON p.kartu_id = k.id
WHERE k.diskon > 3;

-- 7.	Tampilkan data pelanggan yang memiliki kartu dimana diskon kartu yang diberikan diatas 3%

