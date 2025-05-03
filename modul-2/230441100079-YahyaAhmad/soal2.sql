-- nampilin data pelanggan dan kendaraan miliknya TUGAS 1
CREATE OR REPLACE VIEW View_Pelanggan_Kendaraan AS
SELECT p.id_pelanggan, p.nama_pelanggan, k.no_polisi, k.merk, k.tipe, k.tahun, k.warna
FROM Pelanggan p JOIN Kendaraan k ON p.id_pelanggan = k.id_pelanggan;

SELECT * FROM View_Pelanggan_Kendaraan;

-- nampilin data servis lengkap dengan nama pelanggan dan nama kendaraan TUGAS 2
CREATE OR REPLACE VIEW View_Servis_Lengkap AS
SELECT s.id_servis, p.nama_pelanggan, k.no_polisi, k.merk, s.tanggal_masuk, s.tanggal_keluar, s.status, s.total_biaya
FROM Servis s JOIN Pelanggan p ON s.id_pelanggan = p.id_pelanggan JOIN Kendaraan k ON s.id_kendaraan = k.id_kendaraan;

SELECT * FROM View_Servis_Lengkap;

-- nampilin servis yang status-nya ‘selesai’ dan total biaya lebih dari 300000 TUGAS 3
CREATE OR REPLACE VIEW View_Servis_Selesai_Mahal AS
SELECT s.id_servis, p.nama_pelanggan, k.no_polisi, s.tanggal_masuk, s.tanggal_keluar, s.total_biaya
FROM Servis s JOIN Pelanggan p ON s.id_pelanggan = p.id_pelanggan JOIN Kendaraan k ON s.id_kendaraan = k.id_kendaraan
WHERE s.status = 'selesai' AND s.total_biaya > 300000;

SELECT * FROM View_Servis_Selesai_Mahal;

-- nampilin total pendapatan servis untuk setiap pelanggan TUGAS 4
CREATE OR REPLACE VIEW View_Pendapatan_Pelanggan AS
SELECT p.id_pelanggan, p.nama_pelanggan, COUNT(s.id_servis) AS jumlah_servis, SUM(s.total_biaya) AS total_pendapatan
FROM Pelanggan p JOIN Servis s ON p.id_pelanggan = s.id_pelanggan
WHERE s.status = 'selesai' GROUP BY p.id_pelanggan, p.nama_pelanggan;

SELECT * FROM View_Pendapatan_Pelanggan;

-- Nampilin penugasan montir lengkap dengan nama montir dan status servis TUGAS 5
CREATE OR REPLACE VIEW View_Penugasan_Montir AS
SELECT pm.id_penugasan, m.nama_montir, m.spesialisasi, s.id_servis, s.status, p.nama_pelanggan, k.no_polisi, pm.catatan_pekerjaan
FROM Penugasan_Montir pm JOIN Montir m ON pm.id_montir = m.id_montir JOIN Servis s ON pm.id_servis = s.id_servis JOIN Pelanggan p ON s.id_pelanggan = p.id_pelanggan
JOIN Kendaraan k ON s.id_kendaraan = k.id_kendaraan;

SELECT * FROM View_Penugasan_Montir;
