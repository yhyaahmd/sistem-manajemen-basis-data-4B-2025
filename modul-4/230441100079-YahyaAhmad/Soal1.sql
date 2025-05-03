-- Soal Nomor 1
ALTER TABLE Servis
ADD COLUMN keterangan TEXT AFTER total_biaya;

-- Soal nomor 2, Nampilin semua service beserta nama pelanggannya
SELECT Servis.id_servis, Pelanggan.nama_pelanggan, Servis.tanggal_masuk, Servis.STATUS
FROM Servis INNER JOIN Pelanggan ON Servis.id_pelanggan = Pelanggan.id_pelanggan;

-- Soal nomor 3 ASC
SELECT * FROM Pelanggan
ORDER BY nama_pelanggan ASC;

-- Soal nomor 3 DESC
SELECT * FROM Kendaraan
ORDER BY tahun DESC;

-- Soal nomor 4 Ubah tipe data
ALTER TABLE Pelanggan
MODIFY no_telepon VARCHAR(20);

-- Soal nomor 5 LEFT JOIN, Alurnya dia nampilin semua service, klo ada montir tampilkan, klo gada tetap tampil tapi null
SELECT Servis.id_servis, Montir.nama_montir
FROM Servis
LEFT JOIN Penugasan_Montir ON Servis.id_servis = Penugasan_Montir.id_servis
LEFT JOIN Montir ON Penugasan_Montir.id_montir = Montir.id_montir;

-- Soal nomor 5 Right Join, Alurnya semua data dari service tetap keluar montir boleh kosong jika gak ditugasin
SELECT Montir.nama_montir, Servis.id_servis
FROM Montir
RIGHT JOIN Penugasan_Montir ON Montir.id_montir = Penugasan_Montir.id_montir
RIGHT JOIN Servis ON Penugasan_Montir.id_servis = Servis.id_servis;

-- Soal nomor 5 Self Join, Bandingin kendaraan dengan dirinya, dan dia tuh nyari kendaraan yang sama tapi beda ID
SELECT A.no_polisi AS Kendaraan1, B.no_polisi AS Kendaraan2, A.warna
FROM Kendaraan A
INNER JOIN Kendaraan B ON A.warna = B.warna
WHERE A.id_kendaraan < B.id_kendaraan;

-- Soal Nomor 6
-- 1. Cari servis yang biayanya lebih dari 500000
SELECT * FROM Servis
WHERE total_biaya > 500000;

-- 2. Cari servis dengan biaya kurang dari 300000
SELECT * FROM Servis
WHERE total_biaya < 300000;

-- 3. Cari kendaraan tahun produksi setelah 2020
SELECT * FROM Kendaraan
WHERE tahun >= 2020;

-- 4. Cari kendaraan tahun produksi sebelum 2020
SELECT * FROM Kendaraan
WHERE tahun <= 2020;

-- 5. Cari layanan dengan harga tepat 300000
SELECT * FROM Layanan
WHERE harga = 300000;
